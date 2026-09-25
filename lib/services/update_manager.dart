import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import '../app_info.dart';
import 'local_store.dart';
import 'update_checker.dart';
import 'update_platform.dart';

/// What the app should tell the student when it opens.
enum UpdateNotice {
  none,

  /// This launch is the first one after an update was installed.
  updated,

  /// An update is downloaded and Android needs the student to tap Install
  /// (Android 11 and older, or a silent install that Android refused).
  readyToInstall,

  /// An update is downloaded; installing it automatically needs the
  /// one-time "Install unknown apps" permission.
  needsPermission,
}

/// Keeps Open Study up to date:
///
/// 1. When the app opens (at most once a day) it asks GitHub for a newer
///    release and, on Wi-Fi unless the student allows mobile data, downloads
///    the APK in the background.
/// 2. The download is checked against the release's SHA256SUMS.txt; Android
///    itself also refuses any APK not signed with Open Study's key.
/// 3. When the student leaves the app, the update is installed. On Android
///    12+ that needs no prompt once "Install unknown apps" is allowed, so the
///    next launch simply runs the new version. On older Android the app asks
///    the student to tap Install next time it is open.
class UpdateManager {
  final LocalStore store;
  final UpdatePlatform platform;
  final UpdateChecker checker;
  final http.Client _http;
  final String currentVersion;

  UpdateManager({
    required this.store,
    UpdatePlatform? platform,
    UpdateChecker? checker,
    http.Client? client,
    this.currentVersion = appVersion,
  })  : platform = platform ?? MethodChannelUpdatePlatform(),
        checker = checker ?? UpdateChecker(client: client),
        _http = client ?? http.Client();

  static const _checkEvery = Duration(hours: 20);

  bool _busy = false;

  /// The downloaded, verified update waiting to be installed, if any.
  ({String version, String path})? get ready {
    final r = store.downloadedUpdate;
    if (r == null) return null;
    if (compareVersions(r.version, currentVersion) <= 0) return null;
    if (!File(r.path).existsSync()) return null;
    return r;
  }

  /// Run when the app opens. Returns what to tell the student now; the
  /// download (if any) continues in the background.
  Future<UpdateNotice> onLaunch() async {
    final outcome = await _safe(platform.takeInstallOutcome, null);

    // First launch after an update: say so once, and tidy up the old file.
    final last = store.lastRunVersion;
    await store.setLastRunVersion(currentVersion);
    if (last != null && compareVersions(currentVersion, last) > 0) {
      await _discardDownload();
      return UpdateNotice.updated;
    }

    if (outcome != null && outcome.startsWith('failed')) {
      // Corrupt or refused: throw the file away and try again another day.
      await _discardDownload();
    }
    if (!store.checkForUpdates) return UpdateNotice.none;

    if (ready == null) {
      // Not waiting on anything: look for a new version in the background.
      _checkAndDownload();
      return UpdateNotice.none;
    }
    return _noticeForReady(outcome == 'needs_confirmation');
  }

  Future<UpdateNotice> _noticeForReady(bool needsConfirmation) async {
    final sdk = await _safe(platform.sdkInt, 0);
    if (needsConfirmation || sdk < 31) return UpdateNotice.readyToInstall;
    if (!await _safe(platform.canInstall, false)) {
      // Ask once per version, not on every launch.
      if (store.permissionAskedFor == ready!.version) return UpdateNotice.none;
      await store.setPermissionAskedFor(ready!.version);
      return UpdateNotice.needsPermission;
    }
    return UpdateNotice.none; // It will install when the app is left.
  }

  /// Run when the student leaves the app: install silently where Android
  /// allows it, so the next launch is the new version.
  Future<void> onBackground() async {
    final r = ready;
    if (r == null || !store.checkForUpdates) return;
    if (await _safe(platform.sdkInt, 0) < 31) return;
    if (!await _safe(platform.canInstall, false)) return;
    await _safe(() => platform.install(r.path, silent: true), null);
  }

  /// The student tapped Install: Android shows its own confirmation.
  Future<void> installNow() async {
    final r = ready;
    if (r == null) return;
    await platform.install(r.path, silent: false);
  }

  /// "Check now" in About: look for a newer version right away (ignoring
  /// the daily limit and the Wi-Fi setting) and download it.
  Future<({UpdateInfo? update, bool failed})> checkNow({void Function(double progress)? onProgress}) async {
    final result = await checker.checkDetailed(current: currentVersion);
    await store.setLastUpdateCheck(DateTime.now());
    final u = result.update;
    if (u == null) return result;
    if (ready?.version != u.version) {
      final ok = await _download(u, onProgress: onProgress);
      if (!ok) return (update: u, failed: true);
    }
    return result;
  }

  Future<void> _checkAndDownload() async {
    if (_busy) return;
    _busy = true;
    try {
      final last = store.lastUpdateCheck;
      if (last != null && DateTime.now().difference(last) < _checkEvery) return;
      if (store.updateOnWifiOnly && await _safe(platform.isMetered, true)) return;
      final result = await checker.checkDetailed(current: currentVersion);
      if (result.failed) return; // offline: try again next launch
      await store.setLastUpdateCheck(DateTime.now());
      if (result.update != null) await _download(result.update!);
    } finally {
      _busy = false;
    }
  }

  /// Downloads the release APK and keeps it only if its SHA-256 matches the
  /// release's checksum file. Returns whether a verified file is ready.
  Future<bool> _download(UpdateInfo u, {void Function(double progress)? onProgress}) async {
    if (u.apkUrl == null || u.sumsUrl == null || u.apkName == null) return false;
    File? part;
    try {
      final sums = await _http.get(Uri.parse(u.sumsUrl!)).timeout(const Duration(seconds: 30));
      if (sums.statusCode != 200) return false;
      final expected = expectedSha256(sums.body, u.apkName!);
      if (expected == null) return false;

      final dir = await platform.cacheDir();
      part = File('$dir/open_study_update.part');
      final res = await _http.send(http.Request('GET', Uri.parse(u.apkUrl!)));
      if (res.statusCode != 200) return false;
      final total = res.contentLength ?? u.apkSize ?? 0;
      final sink = part.openWrite();
      var received = 0;
      await for (final chunk in res.stream.timeout(const Duration(seconds: 60))) {
        sink.add(chunk);
        received += chunk.length;
        if (total > 0) onProgress?.call(received / total);
      }
      await sink.close();

      final actual = (await sha256.bind(part.openRead()).first).toString();
      if (actual != expected) {
        await part.delete();
        return false;
      }
      await _discardDownload();
      final apk = await part.rename('$dir/open_study_${u.version}.apk');
      await store.setDownloadedUpdate(u.version, apk.path);
      return true;
    } catch (_) {
      if (part != null && part.existsSync()) await part.delete();
      return false;
    }
  }

  Future<void> _discardDownload() async {
    final r = store.downloadedUpdate;
    if (r != null) {
      final f = File(r.path);
      if (f.existsSync()) await f.delete();
    }
    await store.clearDownloadedUpdate();
  }

  static Future<T> _safe<T>(Future<T> Function() f, T fallback) async {
    try {
      return await f();
    } catch (_) {
      return fallback;
    }
  }

  void dispose() {
    checker.dispose();
    _http.close();
  }
}

/// The SHA-256 for [fileName] in a SHA256SUMS.txt ("<hash>  <name>" per line).
String? expectedSha256(String sums, String fileName) {
  for (final line in sums.split('\n')) {
    final m = RegExp(r'^([0-9a-fA-F]{64})\s+\*?(.+?)\s*$').firstMatch(line.trim());
    if (m != null && m.group(2) == fileName) return m.group(1)!.toLowerCase();
  }
  return null;
}
