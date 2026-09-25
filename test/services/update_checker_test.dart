import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:open_study_app/app_info.dart';
import 'package:open_study_app/services/update_checker.dart';

UpdateChecker checkerReturning(int status, Map<String, dynamic> body) =>
    UpdateChecker(client: MockClient((req) async {
      expect(req.url.toString(), 'https://api.github.com/repos/$releasesRepo/releases/latest');
      return http.Response(jsonEncode(body), status);
    }));

Map<String, dynamic> release(String tag, {List<String> assets = const ['OpenStudy.apk', 'SHA256SUMS.txt']}) => {
      'tag_name': tag,
      'html_url': 'https://github.com/$releasesRepo/releases/tag/$tag',
      'draft': false,
      'prerelease': false,
      'assets': [
        for (final a in assets) {'name': a, 'browser_download_url': 'https://example.test/$a'},
      ],
    };

void main() {
  group('compareVersions', () {
    test('orders by number, not text', () {
      expect(compareVersions('1.0.10', '1.0.9'), greaterThan(0));
      expect(compareVersions('1.0.2', '1.0.2'), 0);
      expect(compareVersions('1.0.1', '1.0.2'), lessThan(0));
      expect(compareVersions('2.0.0', '1.9.9'), greaterThan(0));
      expect(compareVersions('1.1', '1.0.5'), greaterThan(0));
    });
  });

  group('UpdateChecker', () {
    test('finds a newer release and its APK', () async {
      final r = await checkerReturning(200, release('v1.0.3')).checkDetailed(current: '1.0.2');
      expect(r.failed, isFalse);
      expect(r.update?.version, '1.0.3');
      expect(r.update?.apkUrl, 'https://example.test/OpenStudy.apk');
    });

    test('says nothing when already up to date', () async {
      final r = await checkerReturning(200, release('v1.0.2')).checkDetailed(current: '1.0.2');
      expect(r.update, isNull);
      expect(r.failed, isFalse);
    });

    test('ignores an older release', () async {
      final r = await checkerReturning(200, release('v1.0.1')).checkDetailed(current: '1.0.2');
      expect(r.update, isNull);
      expect(r.failed, isFalse);
    });

    test('falls back to the release page when there is no APK', () async {
      final r = await checkerReturning(200, release('v1.1.0', assets: ['notes.txt'])).checkDetailed(current: '1.0.2');
      expect(r.update?.apkUrl, isNull);
      expect(r.update?.pageUrl, contains('/releases/tag/v1.1.0'));
    });

    test('reports failure when GitHub cannot be reached', () async {
      final r = await checkerReturning(500, {}).checkDetailed(current: '1.0.2');
      expect(r.update, isNull);
      expect(r.failed, isTrue);

      final offline = UpdateChecker(client: MockClient((_) async => throw const SocketException('offline')));
      final r2 = await offline.checkDetailed(current: '1.0.2');
      expect(r2.failed, isTrue);
    });
  });

  test('appVersion matches pubspec.yaml', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final version = RegExp(r'^version:\s*([0-9.]+)', multiLine: true).firstMatch(pubspec)!.group(1);
    expect(appVersion, version);
  });
}
