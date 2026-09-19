/// OpenAlex source using the official API.
library;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'open_source.dart'
    show OpenSource, SourceException, kUserAgent, kMaxPerSource;
import '../../models/study_resource.dart';
import 'license_labels.dart';

class OpenAlexSource implements OpenSource {
  @override
  final String name = 'OpenAlex';

  static const String _baseUrl = 'https://api.openalex.org/works';

  @override
  Future<List<StudyResource>> search(String query, http.Client client) async {
    const filter =
        'open_access.is_oa:true,best_oa_location.license:cc-by|cc-by-sa|cc0|public-domain|cc-by-nc|cc-by-nc-sa';
    const select = 'id,title,best_oa_location,authorships';

    final uri = Uri.parse(_baseUrl).replace(queryParameters: {
      'search': query,
      'filter': filter,
      'per_page': kMaxPerSource.toString(),
      'select': select,
    });

    final response = await client.get(uri, headers: {'User-Agent': kUserAgent});

    if (response.statusCode != 200) {
      throw SourceException('OpenAlex HTTP ${response.statusCode}');
    }

    final Map<String, dynamic> data;
    try {
      data = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw SourceException('OpenAlex: invalid JSON');
    }

    final works = data['results'] as List<dynamic>?;
    if (works == null) {
      return const [];
    }

    final results = <StudyResource>[];
    for (final work in works) {
      final bestOa = work['best_oa_location'] as Map<String, dynamic>?;
      if (bestOa == null) continue;

      final license = bestOa['license'] as String?;
      if (license == null) continue;

      var url = bestOa['landing_page_url'] as String?;
      url ??= bestOa['pdf_url'] as String?;
      if (url == null || url.isEmpty) continue;
      url = url.replaceFirst('http://', 'https://');

      final id = work['id'] as String?;
      if (id == null) continue;
      final shortId = id.split('/').last;

      final title = work['title'] as String?;
      if (title == null || title.isEmpty) continue;

      final authorships = work['authorships'] as List<dynamic>?;
      final authors = authorships
              ?.take(3)
              .map((a) => (a as Map<String, dynamic>)['author']?['display_name'] as String?)
              .whereType<String>()
              .where((n) => n.isNotEmpty)
              .join(', ') ??
          '';

      results.add(StudyResource(
        id: 'openalex-$shortId',
        title: title,
        source: name,
        license: licenseLabelFromCode(license),
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