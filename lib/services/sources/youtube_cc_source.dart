/// YouTube Creative Commons source using the official YouTube Data API v3.
library;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'open_source.dart'
    show OpenSource, SourceException, kUserAgent, kMaxPerSource;
import '../../models/study_resource.dart';

class YouTubeCcSource implements OpenSource {
  @override
  final String name = 'YouTube (Creative Commons)';

  static const String _baseUrl = 'https://www.googleapis.com/youtube/v3/search';

  final String _apiKey;

  YouTubeCcSource(this._apiKey);

  @override
  Future<List<StudyResource>> search(String query, http.Client client) async {
    if (_apiKey.isEmpty) {
      return const [];
    }

    final uri = Uri.parse(_baseUrl).replace(queryParameters: {
      'key': _apiKey,
      'q': query,
      'part': 'snippet',
      'type': 'video',
      'videoLicense': 'creativeCommon',
      'videoEmbeddable': 'true',
      'maxResults': kMaxPerSource.toString(),
      'safeSearch': 'strict',
    });

    final response = await client.get(uri, headers: {'User-Agent': kUserAgent});

    if (response.statusCode != 200) {
      throw SourceException('YouTube CC HTTP ${response.statusCode}');
    }

    final Map<String, dynamic> data;
    try {
      data = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw SourceException('YouTube CC: invalid JSON');
    }

    final items = data['items'] as List<dynamic>?;
    if (items == null) {
      return const [];
    }

    final results = <StudyResource>[];
    for (final item in items) {
      final idMap = item['id'] as Map<String, dynamic>?;
      final videoId = idMap?['videoId'] as String?;
      if (videoId == null || videoId.isEmpty) continue;

      final snippet = item['snippet'] as Map<String, dynamic>?;
      if (snippet == null) continue;

      final title = _decodeHtmlEntities(snippet['title'] as String? ?? '');
      if (title.isEmpty) continue;

      final channelTitle = snippet['channelTitle'] as String? ?? '';

      final thumbnails = snippet['thumbnails'] as Map<String, dynamic>?;
      final mediumThumb = thumbnails?['medium'] as Map<String, dynamic>?;
      final thumbnailUrl = mediumThumb?['url'] as String?;

      results.add(StudyResource(
        id: 'yt-$videoId',
        title: title,
        source: name,
        license: 'CC BY',
        licenseUrl: 'https://creativecommons.org/licenses/by/3.0/',
        type: ResourceType.video,
        url: 'https://www.youtube.com/watch?v=$videoId',
        thumbnailUrl: thumbnailUrl,
        creator: channelTitle.isNotEmpty ? channelTitle : null,
      ));

      if (results.length >= kMaxPerSource) break;
    }

    return results;
  }

  /// Decodes common HTML entities.
  String _decodeHtmlEntities(String input) {
    return input
        .replaceAll('\u0026quot;', '"')
        .replaceAll('\u0026#39;', "'")
        .replaceAll('\u0026#039;', "'")
        .replaceAll('\u0026lt;', '<')
        .replaceAll('\u0026gt;', '>')
        .replaceAll('\u0026amp;', '&');
  }
}