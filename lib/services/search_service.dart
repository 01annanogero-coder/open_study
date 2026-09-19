import 'dart:async';
import 'package:http/http.dart' as http;
import '../models/study_resource.dart';
import 'sources/open_source.dart';
import 'sources/sources.dart';

class ApiException implements Exception {
  final String message;
  ApiException(this.message);
  @override
  String toString() => message;
}

/// Searches every open-content source directly from the device, using each
/// provider's official public API. There is no backend of our own: nothing is
/// proxied, cached or re-hosted, and no scraping or browser spoofing is used.
class SearchService {
  static const Duration _perSourceTimeout = Duration(seconds: 12);

  final http.Client _client;
  final List<OpenSource> _sources;

  SearchService({http.Client? client, List<OpenSource>? sources})
      : _client = client ?? http.Client(),
        _sources = sources ?? defaultSources();

  /// [query] is the raw search text. [subcategory], when a chip is tapped,
  /// narrows the search by appending it to the query.
  Future<SearchResult> search(String query, {String? subcategory}) async {
    final base = query.trim();
    if (base.isEmpty) {
      throw ApiException('Type something to search for.');
    }
    final effective =
        (subcategory == null || subcategory.isEmpty) ? base : '$base $subcategory';

    final outcomes = await Future.wait(_sources.map((s) => _runSource(s, effective)));

    final failed = <String>[
      for (final o in outcomes)
        if (o.failed) o.sourceName,
    ];
    if (failed.length == _sources.length) {
      throw ApiException(
        'Could not reach any source. Check your internet connection and try again.',
      );
    }

    final merged = _interleave([for (final o in outcomes) o.results]);
    final seen = <String>{};
    final unique = <StudyResource>[
      for (final r in merged)
        if (seen.add(r.url)) r,
    ];

    return SearchResult(
      subcategories: generateSubcategories(unique, base),
      resources: unique,
      failedSources: failed,
    );
  }

  Future<_Outcome> _runSource(OpenSource source, String query) async {
    try {
      final results =
          await source.search(query, _client).timeout(_perSourceTimeout);
      return _Outcome(source.name, results.take(kMaxPerSource).toList(), false);
    } catch (_) {
      return _Outcome(source.name, const [], true);
    }
  }

  /// Round-robin merge so one busy source cannot bury the others.
  static List<StudyResource> _interleave(List<List<StudyResource>> lists) {
    final out = <StudyResource>[];
    var i = 0;
    var added = true;
    while (added) {
      added = false;
      for (final l in lists) {
        if (i < l.length) {
          out.add(l[i]);
          added = true;
        }
      }
      i++;
    }
    return out;
  }

  void dispose() => _client.close();
}

class _Outcome {
  final String sourceName;
  final List<StudyResource> results;
  final bool failed;
  _Outcome(this.sourceName, this.results, this.failed);
}

// ---- Subcategory chips ------------------------------------------------------

final List<RegExp> _labelPatterns = [
  RegExp(r'\byear\s*\d+\b', caseSensitive: false),
  RegExp(r'\bsem(?:ester)?\s*\d+\b', caseSensitive: false),
  RegExp(r'\bchapter\s*\d+\b', caseSensitive: false),
  RegExp(r'\bmodule\s*\d+\b', caseSensitive: false),
  RegExp(r'\bunit\s*\d+\b', caseSensitive: false),
];

/// Builds up to six chips from the titles that came back, padded with generic
/// study-oriented suggestions.
List<String> generateSubcategories(List<StudyResource> resources, String query) {
  final counts = <String, int>{};
  for (final r in resources) {
    for (final p in _labelPatterns) {
      final m = p.firstMatch(r.title);
      if (m != null) {
        final label = _titleCase(m.group(0)!.trim());
        counts[label] = (counts[label] ?? 0) + 1;
      }
    }
  }

  final labels = counts.entries.toList()
    ..sort((a, b) {
      final byCount = b.value.compareTo(a.value);
      return byCount != 0 ? byCount : a.key.compareTo(b.key);
    });
  final out = [for (final e in labels) e.key];

  final cleaned = query
      .replaceAll(
        RegExp(r'\b(ba|bsc|ma|msc|notes|books|past|papers|exam|free)\b',
            caseSensitive: false),
        '',
      )
      .trim();
  final subject = _titleCase(cleaned.isEmpty ? query.trim() : cleaned);

  final fallbacks = [
    subject.isNotEmpty ? 'Introduction to $subject' : 'Introduction',
    'Textbooks',
    'Lecture videos',
    'Practice questions',
    'Revision guides',
    'Research papers',
  ];
  for (final f in fallbacks) {
    if (!out.contains(f)) out.add(f);
  }
  return out.take(6).toList();
}

String _titleCase(String s) => s.replaceAllMapped(
      RegExp(r'\w\S*'),
      (m) => m[0]![0].toUpperCase() + m[0]!.substring(1).toLowerCase(),
    );
