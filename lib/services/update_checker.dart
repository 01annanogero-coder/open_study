import 'dart:convert';

import 'package:http/http.dart' as http;
import '../app_info.dart';

/// Where to ask for the latest release. Test builds can point this at a local
/// feed with --dart-define=UPDATE_FEED_URL=...; normal builds ask GitHub.
const String updateFeedUrl = String.fromEnvironment(
  'UPDATE_FEED_URL',
  defaultValue: 'https://api.github.com/repos/$releasesRepo/releases/latest',
);

/// A newer release found on GitHub.
class UpdateInfo {
  final String version;

  /// Direct download of the Android app, if the release has one.
  final String? apkUrl;

  /// File name of the APK, as listed in the checksum file.
  final String? apkName;

  /// Size of the APK in bytes, as GitHub reports it.
  final int? apkSize;

  /// The release's SHA256SUMS.txt, used to check the download.
  final String? sumsUrl;

  /// The release page, with notes and all files.
  final String pageUrl;

  const UpdateInfo({
    required this.version,
    required this.pageUrl,
    this.apkUrl,
    this.apkName,
    this.apkSize,
    this.sumsUrl,
  });
}

/// Asks GitHub whether a newer Open Study release exists. Sends nothing but
/// an ordinary request for the public release list; no identifiers.
class UpdateChecker {
  final http.Client _client;
  final String feedUrl;
  UpdateChecker({http.Client? client, this.feedUrl = updateFeedUrl}) : _client = client ?? http.Client();

  /// The latest release if it is newer than [current], otherwise null.
  /// Network or parsing problems also give null: a failed check is silent.
  Future<UpdateInfo?> check({String current = appVersion}) async => (await checkDetailed(current: current)).update;

  /// Like [check], but also says whether GitHub could be reached, so a manual
  /// check can tell "up to date" apart from "could not check".
  Future<({UpdateInfo? update, bool failed})> checkDetailed({String current = appVersion}) async {
    try {
      final res = await _client
          .get(Uri.parse(feedUrl), headers: const {'Accept': 'application/vnd.github+json'})
          .timeout(const Duration(seconds: 15));
      if (res.statusCode != 200) return (update: null, failed: true);
      final json = jsonDecode(res.body) as Map<String, dynamic>;
      final tag = (json['tag_name'] as String? ?? '').replaceFirst(RegExp(r'^v'), '');
      if (tag.isEmpty) return (update: null, failed: true);
      if (json['draft'] == true || json['prerelease'] == true) return (update: null, failed: false);
      if (compareVersions(tag, current) <= 0) return (update: null, failed: false);
      Map<String, dynamic>? apk, sums;
      for (final a in (json['assets'] as List? ?? const [])) {
        final asset = a as Map<String, dynamic>;
        final name = (asset['name'] as String? ?? '').toLowerCase();
        if (name.endsWith('.apk')) apk ??= asset;
        if (name == 'sha256sums.txt') sums = asset;
      }
      return (
        update: UpdateInfo(
          version: tag,
          apkUrl: apk?['browser_download_url'] as String?,
          apkName: apk?['name'] as String?,
          apkSize: apk?['size'] as int?,
          sumsUrl: sums?['browser_download_url'] as String?,
          pageUrl: json['html_url'] as String? ?? releasesPage,
        ),
        failed: false,
      );
    } catch (_) {
      return (update: null, failed: true);
    }
  }

  void dispose() => _client.close();
}

/// Compares dotted versions such as '1.0.10' and '1.0.9': negative when
/// [a] is older, zero when equal, positive when newer. Anything that is not
/// a number counts as 0.
int compareVersions(String a, String b) {
  List<int> parts(String v) =>
      v.split(RegExp(r'[.+-]')).take(3).map((p) => int.tryParse(p) ?? 0).toList()
        ..addAll(List.filled(3, 0));
  final x = parts(a), y = parts(b);
  for (var i = 0; i < 3; i++) {
    if (x[i] != y[i]) return x[i].compareTo(y[i]);
  }
  return 0;
}
