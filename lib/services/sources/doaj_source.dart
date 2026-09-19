/// DOAJ (Directory of Open Access Journals) source using the official API.
library;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'open_source.dart'
    show OpenSource, SourceException, kUserAgent, kMaxPerSource;
import '../../models/study_resource.dart';

class DoajSource implements OpenSource {
  @override
  final String name = 'DOAJ';

  static const String _baseUrl = 'https://doaj.org/api/search/articles';

  @override
  Future<List<StudyResource>> search(String query, http.Client client) async {
    final encodedQuery = Uri.encodeComponent(query);
    final uri = Uri.parse('$_baseUrl/$encodedQuery').replace(queryParameters: {
      'pageSize': kMaxPerSource.toString(),
    });

    final response = await client.get(uri, headers: {'User-Agent': kUserAgent});

    if (response.statusCode != 200) {
      throw SourceException('DOAJ HTTP ${response.statusCode}');
    }

    final Map<String, dynamic> data;
    try {
      data = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw SourceException('DOAJ: invalid JSON');
    }

    final resultsList = data['results'] as List<dynamic>?;
    if (resultsList == null) {
      return const [];
    }

    final results = <StudyResource>[];
    for (final item in resultsList) {
      final bibjson = item['bibjson'] as Map<String, dynamic>?;
      if (bibjson == null) continue;

      final id = item['id'] as String?;
      if (id == null || id.isEmpty) continue;

      final title = bibjson['title'] as String?;
      if (title == null || title.isEmpty) continue;

      final links = bibjson['link'] as List<dynamic>?;
      if (links == null || links.isEmpty) continue;

      String? url;
      // Prefer fulltext link
      for (final link in links) {
        final linkMap = link as Map<String, dynamic>?;
        if (linkMap == null) continue;
        if (linkMap['type'] == 'fulltext') {
          url = linkMap['url'] as String?;
          break;
        }
      }
      // Fall back to first link
      url ??= (links.first as Map<String, dynamic>?)?['url'] as String?;
      if (url == null || url.isEmpty) continue;
      url = url.replaceFirst('http://', 'https://');

      final authors = (bibjson['author'] as List<dynamic>?)
              ?.map((a) => (a as Map<String, dynamic>)['name'] as String?)
              .whereType<String>()
              .where((n) => n.isNotEmpty)
              .join(', ') ??
          '';

      results.add(StudyResource(
        id: 'doaj-$id',
        title: title,
        source: name,
        license: 'Open access (see article)',
        licenseUrl: null,
        type: ResourceType.article,
        url: url,
        creator: authors.isNotEmpty ? authors : null,
      ));

      if (results.length >= kMaxPerSource) break;
    }

    return results;
  }
}