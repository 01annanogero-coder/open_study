import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:open_study_app/services/local_store.dart';
import 'package:open_study_app/services/update_checker.dart';
import 'package:open_study_app/services/update_manager.dart';
import 'package:open_study_app/services/update_platform.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Stands in for the phone.
class FakePlatform implements UpdatePlatform {
  int sdk;
  bool metered;
  bool allowed;
  String? outcome;
  final String dir;
  final installs = <({String path, bool silent})>[];
  var settingsOpened = 0;

  FakePlatform({this.sdk = 34, this.metered = false, this.allowed = true, this.outcome})
      : dir = Directory.systemTemp.createTempSync('open_study_update').path;

  @override
  Future<int> sdkInt() async => sdk;
  @override
  Future<String> cacheDir() async => dir;
  @override
  Future<bool> isMetered() async => metered;
  @override
  Future<bool> canInstall() async => allowed;
  @override
  Future<void> openInstallSettings() async => settingsOpened++;
  @override
  Future<void> install(String path, {required bool silent}) async => installs.add((path: path, silent: silent));
  @override
  Future<String?> takeInstallOutcome() async {
    final o = outcome;
    outcome = null;
    return o;
  }
}

final apkBytes = utf8.encode('pretend this is Open Study 1.0.3');
final apkHash = sha256.convert(apkBytes).toString();

/// A GitHub that has release [version] with an APK and checksums.
MockClient github({String version = '1.0.3', String? sums, List<int>? apk}) {
  return MockClient((req) async {
    final url = req.url.toString();
    if (url == updateFeedUrl) {
      return http.Response(
          jsonEncode({
            'tag_name': 'v$version',
            'html_url': 'https://github.com/x/releases/tag/v$version',
            'assets': [
              {'name': 'OpenStudy-$version.apk', 'browser_download_url': 'https://dl.test/app.apk', 'size': 40},
              {'name': 'SHA256SUMS.txt', 'browser_download_url': 'https://dl.test/sums.txt', 'size': 90},
            ],
          }),
          200);
    }
    if (url == 'https://dl.test/sums.txt') {
      return http.Response(sums ?? '$apkHash  OpenStudy-$version.apk\n', 200);
    }
    if (url == 'https://dl.test/app.apk') return http.Response.bytes(apk ?? apkBytes, 200);
    return http.Response('not found', 404);
  });
}

Future<LocalStore> freshStore([Map<String, Object> values = const {}]) async {
  SharedPreferences.setMockInitialValues(values);
  return LocalStore.open();
}

UpdateManager manager(LocalStore store, FakePlatform platform, http.Client client) =>
    UpdateManager(store: store, platform: platform, client: client, currentVersion: '1.0.2');

/// Lets the background download started by onLaunch finish.
Future<void> settle() => Future<void>.delayed(const Duration(milliseconds: 100));

void main() {
  test('downloads a newer release in the background and keeps it once verified', () async {
    final store = await freshStore();
    final platform = FakePlatform();
    final m = manager(store, platform, github());

    expect(await m.onLaunch(), UpdateNotice.none);
    await settle();

    expect(m.ready?.version, '1.0.3');
    expect(File(m.ready!.path).readAsBytesSync(), apkBytes);
    expect(store.lastUpdateCheck, isNotNull);
  });

  test('throws away a download whose checksum does not match', () async {
    final store = await freshStore();
    final m = manager(store, FakePlatform(), github(apk: utf8.encode('tampered')));
    await m.onLaunch();
    await settle();
    expect(m.ready, isNull);
    expect(store.downloadedUpdate, isNull);
  });

  test('refuses a release without a checksum for its APK', () async {
    final store = await freshStore();
    final m = manager(store, FakePlatform(), github(sums: '${'0' * 64}  something-else.apk\n'));
    await m.onLaunch();
    await settle();
    expect(m.ready, isNull);
  });

  test('waits for Wi-Fi when "Wi-Fi only" is on, and not when it is off', () async {
    final store = await freshStore();
    final platform = FakePlatform(metered: true);
    await manager(store, platform, github()).onLaunch();
    await settle();
    expect(store.downloadedUpdate, isNull);
    expect(store.lastUpdateCheck, isNull, reason: 'skipped, so it tries again next launch');

    await store.setUpdateOnWifiOnly(false);
    final m = manager(store, platform, github());
    await m.onLaunch();
    await settle();
    expect(m.ready?.version, '1.0.3');
  });

  test('checks at most about once a day', () async {
    final store = await freshStore();
    await store.setLastUpdateCheck(DateTime.now().subtract(const Duration(hours: 2)));
    final m = manager(store, FakePlatform(), github());
    await m.onLaunch();
    await settle();
    expect(m.ready, isNull);
  });

  test('does nothing when automatic updates are off', () async {
    final store = await freshStore();
    await store.setCheckForUpdates(false);
    final m = manager(store, FakePlatform(), github());
    await m.onLaunch();
    await settle();
    expect(m.ready, isNull);
  });

  test('installs silently on leaving the app, on Android 12+ with permission', () async {
    final store = await freshStore();
    final platform = FakePlatform(sdk: 34, allowed: true);
    final m = manager(store, platform, github());
    await m.onLaunch();
    await settle();

    await m.onBackground();
    expect(platform.installs, hasLength(1));
    expect(platform.installs.single.silent, isTrue);
    expect(platform.installs.single.path, m.ready!.path);
  });

  test('without the permission: no silent install, asks once per version', () async {
    final store = await freshStore();
    final platform = FakePlatform(sdk: 34, allowed: false);
    final m = manager(store, platform, github());
    await m.onLaunch();
    await settle();
    await m.onBackground();
    expect(platform.installs, isEmpty);

    // Next launch: the update is waiting, so the student is asked once.
    expect(await m.onLaunch(), UpdateNotice.needsPermission);
    expect(await m.onLaunch(), UpdateNotice.none);
  });

  test('Android 11 and older: asks the student to tap Install', () async {
    final store = await freshStore();
    final platform = FakePlatform(sdk: 30);
    final m = manager(store, platform, github());
    await m.onLaunch();
    await settle();
    await m.onBackground();
    expect(platform.installs, isEmpty);

    expect(await m.onLaunch(), UpdateNotice.readyToInstall);
    await m.installNow();
    expect(platform.installs.single.silent, isFalse);
  });

  test('a refused silent install turns into an Install prompt', () async {
    final store = await freshStore();
    final platform = FakePlatform(sdk: 34);
    final m = manager(store, platform, github());
    await m.onLaunch();
    await settle();
    platform.outcome = 'needs_confirmation';
    expect(await m.onLaunch(), UpdateNotice.readyToInstall);
  });

  test('a failed install discards the file so it is fetched again later', () async {
    final store = await freshStore();
    final platform = FakePlatform(sdk: 34);
    final m = manager(store, platform, github());
    await m.onLaunch();
    await settle();
    final path = m.ready!.path;
    platform.outcome = 'failed: INSTALL_FAILED_UPDATE_INCOMPATIBLE';
    await m.onLaunch();
    expect(store.downloadedUpdate, isNull);
    expect(File(path).existsSync(), isFalse);
  });

  test('the first launch of a new version says so and tidies up', () async {
    final store = await freshStore();
    final platform = FakePlatform();
    final old = manager(store, platform, github());
    await old.onLaunch();
    await settle();
    final path = old.ready!.path;

    // Android replaced the app: now running 1.0.3.
    final updated = UpdateManager(store: store, platform: platform, client: github(), currentVersion: '1.0.3');
    expect(await updated.onLaunch(), UpdateNotice.updated);
    expect(File(path).existsSync(), isFalse);
    expect(await updated.onLaunch(), UpdateNotice.none);
  });

  test('"Check now" ignores the daily limit and Wi-Fi setting and reports progress', () async {
    final store = await freshStore();
    await store.setLastUpdateCheck(DateTime.now());
    final m = manager(store, FakePlatform(metered: true), github());
    final progress = <double>[];
    final result = await m.checkNow(onProgress: progress.add);
    expect(result.update?.version, '1.0.3');
    expect(m.ready?.version, '1.0.3');
    expect(progress.last, 1.0);
  });

  test('expectedSha256 reads the SHA256SUMS format', () {
    final h = 'A' * 64;
    expect(expectedSha256('$h  OpenStudy-1.0.3.apk\n', 'OpenStudy-1.0.3.apk'), 'a' * 64);
    expect(expectedSha256('$h *OpenStudy-1.0.3.apk', 'OpenStudy-1.0.3.apk'), 'a' * 64);
    expect(expectedSha256('$h  Other.apk', 'OpenStudy-1.0.3.apk'), isNull);
  });
}
