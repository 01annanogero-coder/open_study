/// Wikipedia source using the official MediaWiki API.
library;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'open_source.dart';
import '../../models/study_resource.dart';

class WikipediaSource implements OpenSource {
  @override
  final String name = 'Wikipedia';

  static const String _baseUrl = 'https://en.wikipedia.org/w/api.php';

  @override
  Future<List<StudyResource>> search(String query, http.Client client) async {
    final uri = Uri.parse(_baseUrl).replace(queryParameters: {
      'action': 'query',
      'list': 'search',
      'srsearch': query,
      'format': 'json',
      'srlimit': kMaxPerSource.toString(),
    });

    final response = await client.get(uri, headers: {'User-Agent': kUserAgent});

    if (response.statusCode != 200) {
      throw SourceException('Wikipedia HTTP ${response.statusCode}');
    }

    final Map<String, dynamic> data;
    try {
      data = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw SourceException('Wikipedia: invalid JSON');
    }

    final searchResults = data['query']?['search'] as List<dynamic>?;
    if (searchResults == null) {
      return const [];
    }

    final results = <StudyResource>[];
    for (final item in searchResults) {
      final pageId = item['pageid'] as int?;
      if (pageId == null) continue;

      final title = item['title'] as String?;
      if (title == null || title.isEmpty) continue;

      final snippet = item['snippet'] as String? ?? '';
      final description = _cleanSnippet(snippet);

      final encodedTitle = Uri.encodeComponent(title.replaceAll(' ', '_'));
      final url = 'https://en.wikipedia.org/wiki/$encodedTitle';

      results.add(StudyResource(
        id: 'wiki-$pageId',
        title: title,
        source: name,
        license: 'CC BY-SA 4.0',
        licenseUrl: 'https://creativecommons.org/licenses/by-sa/4.0/',
        type: ResourceType.article,
        url: url,
        description: description,
      ));

      if (results.length >= kMaxPerSource) break;
    }

    return results;
  }

  /// Removes HTML tags and decodes common HTML entities from Wikipedia snippet.
  String _cleanSnippet(String snippet) {
    var cleaned = snippet
        .replaceAll(RegExp(r'<[^>]*>'), '') // Remove HTML tags
        .replaceAll('\u0026quot;', '"')
        .replaceAll('\u0026#39;', "'")
        .replaceAll('\u0026#039;', "'")
        .replaceAll('\u0026nbsp;', ' ')
        .replaceAll('\u0026amp;', '&')
        .trim();
    return cleaned;
  }
}