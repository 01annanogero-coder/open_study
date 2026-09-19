/// arXiv source using the official Atom API.
library;

import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'open_source.dart';
import '../../models/study_resource.dart';

class ArxivSource implements OpenSource {
  @override
  final String name = 'arXiv';

  static const String _baseUrl = 'https://export.arxiv.org/api/query';

  @override
  Future<List<StudyResource>> search(String query, http.Client client) async {
    final uri = Uri.parse(_baseUrl).replace(queryParameters: {
      'search_query': 'all:$query',
      'start': '0',
      'max_results': kMaxPerSource.toString(),
    });

    final response = await client.get(uri, headers: {
      'User-Agent': kUserAgent,
      'Accept': 'application/xml, text/xml',
    });

    if (response.statusCode != 200) {
      throw SourceException('arXiv HTTP ${response.statusCode}');
    }

    xml.XmlDocument document;
    try {
      document = xml.XmlDocument.parse(response.body);
    } catch (e) {
      throw SourceException('arXiv: invalid XML');
    }

    final results = <StudyResource>[];

    for (final entry in document.findAllElements('entry')) {
      // arXiv ID is in <id> tag (e.g., http://arxiv.org/abs/2301.12345)
      final idElement = entry.findElements('id').firstOrNull;
      if (idElement == null) continue;
      final idUrl = idElement.innerText.trim();
      final arxivId = _extractArxivId(idUrl);
      if (arxivId == null) continue;

      // Title
      final titleElement = entry.findElements('title').firstOrNull;
      final title = titleElement?.innerText
              .replaceAll(RegExp(r'\s+'), ' ')
              .trim() ??
          '';
      if (title.isEmpty) continue;

      // Summary (description)
      final summaryElement = entry.findElements('summary').firstOrNull;
      var description = summaryElement?.innerText
              .replaceAll(RegExp(r'\s+'), ' ')
              .trim() ??
          '';
      if (description.length > 200) {
        description = description.substring(0, 200).trimRight() + '…';
      }

      // Authors
      final authors = entry
          .findElements('author')
          .map((a) => a.findElements('name').firstOrNull?.innerText.trim())
          .whereType<String>()
          .where((n) => n.isNotEmpty)
          .join(', ');

      // URL: convert to https and use the abs page
      final url = idUrl.replaceFirst('http://', 'https://');

      results.add(StudyResource(
        id: 'arxiv-$arxivId',
        title: title,
        source: name,
        license: 'Free to read (arXiv)',
        licenseUrl: null,
        type: ResourceType.article,
        url: url,
        description: description,
        creator: authors.isNotEmpty ? authors : null,
      ));

      if (results.length >= kMaxPerSource) break;
    }

    return results;
  }

  /// Extracts the arXiv identifier from the full ID URL.
  /// e.g., "https://arxiv.org/abs/2301.12345" → "2301.12345"
  String? _extractArxivId(String idUrl) {
    final match = RegExp(r'arxiv\.org/abs/([^/]+)').firstMatch(idUrl);
    return match?.group(1);
  }
}