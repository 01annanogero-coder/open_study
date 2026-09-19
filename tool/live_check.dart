/// Live check tool for all open content sources.
///
/// Runs each source with a real HTTP client and prints results.
/// Usage: dart run tool/live_check.dart [query]
/// Default query: "software engineering"
library;

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:open_study_app/services/sources/sources.dart';

void main(List<String> arguments) async {
  final query = arguments.isNotEmpty ? arguments.first : 'software engineering';
  print('Query: "$query"');
  print('');

  final client = http.Client();
  final sources = defaultSources();
  var anyFailed = false;

  for (final source in sources) {
    // Skip YouTube if no API key
    if (source is YouTubeCcSource) {
      // We can't easily check the private _apiKey, so we'll just try and catch
      // the empty result. The source returns empty list without network call
      // when key is empty.
    }

    try {
      final results = await source.search(query, client).timeout(
        const Duration(seconds: 15),
      );

      print('${source.name}: ${results.length} results');
      for (final r in results.take(2)) {
        print('  - ${r.title} [${r.license}]');
      }
      if (results.isEmpty) {
        print('  (no results)');
      }
      print('');
    } catch (e) {
      print('FAIL  ${source.name}: $e');
      print('');
      anyFailed = true;
    }
  }

  client.close();

  if (anyFailed) {
    exitCode = 1;
  }
}