/// Internet Archive source using the official advanced search API.
library;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'open_source.dart';
import '../../models/study_resource.dart';
import 'license_labels.dart';

class InternetArchiveSource implements OpenSource {
  @override
  final String name = 'Internet Archive';

  static const String _baseUrl = 'https://archive.org/advancedsearch.php';

  @override
  Future<List<StudyResource>> search(String query, http.Client client) async {
    final encodedQuery = _buildQuery(query);
    final uri = Uri.parse(_baseUrl).replace(queryParameters: {
      'q': encodedQuery,
      'fl[]': ['identifier', 'title', 'mediatype', 'licenseurl', 'creator'],
      'rows': kMaxPerSource.toString(),
      'output': 'json',
    });

    final response = await client.get(uri, headers: {'User-Agent': kUserAgent});

    if (response.statusCode != 200) {
      throw SourceException('Internet Archive HTTP ${response.statusCode}');
    }

    final Map<String, dynamic> data;
    try {
      data = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw SourceException('Internet Archive: invalid JSON');
    }

    final docs = data['response']?['docs'] as List<dynamic>?;
    if (docs == null) {
      return const [];
    }

    final results = <StudyResource>[];
    for (final doc in docs) {
      final licenseUrl = doc['licenseurl'] as String?;
      if (licenseUrl == null ||
          (!licenseUrl.toLowerCase().contains('creativecommons.org') &&
              !licenseUrl.toLowerCase().contains('publicdomain'))) {
        continue;
      }

      final identifier = doc['identifier'] as String?;
      if (identifier == null || identifier.isEmpty) {
        continue;
      }

      final title = _extractTitle(doc['title']);
      if (title == null || title.isEmpty) {
        continue;
      }

      final mediatype = doc['mediatype'] as String?;
      final type = mediatype == 'movies' ? ResourceType.video : ResourceType.article;

      final creator = _extractCreator(doc['creator']);

      results.add(StudyResource(
        id: 'ia-$identifier',
        title: title,
        source: name,
        license: licenseLabelFromUrl(licenseUrl),
        licenseUrl: licenseUrl,
        type: type,
        url: 'https://archive.org/details/$identifier',
        thumbnailUrl: 'https://archive.org/services/img/$identifier',
        creator: creator,
      ));

      if (results.length >= kMaxPerSource) break;
    }

    return results;
  }

  /// Builds the query string for Internet Archive.
  /// Wraps the user query in double quotes only if it doesn't already contain them.
  String _buildQuery(String query) {
    final trimmed = query.trim();
    final hasQuotes = trimmed.contains('"');
    final q = hasQuotes ? trimmed : '"$trimmed"';
    final licenseFilter =
        '(licenseurl:*creativecommons.org* OR licenseurl:*publicdomain*)';
    final mediaFilter = 'mediatype:(texts OR movies OR education)';
    return '( title:($q) OR subject:($q) OR description:($q) ) AND $mediaFilter AND $licenseFilter';
  }

  /// Extracts a single title string from the title field (may be String or List).
  String? _extractTitle(dynamic titleField) {
    if (titleField == null) return null;
    if (titleField is String) return titleField;
    if (titleField is List && titleField.isNotEmpty) {
      return titleField.first as String?;
    }
    return null;
  }

  /// Extracts creator string (may be String or List).
  String? _extractCreator(dynamic creatorField) {
    if (creatorField == null) return null;
    if (creatorField is String) return creatorField;
    if (creatorField is List) {
      return creatorField.whereType<String>().join(', ');
    }
    return null;
  }
}