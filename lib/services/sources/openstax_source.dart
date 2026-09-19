/// OpenStax source using the official CMS API.
library;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'open_source.dart'
    show OpenSource, SourceException, kUserAgent;
import '../../models/study_resource.dart';

class OpenStaxSource implements OpenSource {
  @override
  final String name = 'OpenStax';

  static const String _catalogUrl =
      'https://openstax.org/apps/cms/api/v2/pages/?type=books.Book&fields=title,cover_url,book_state,license_name,license_url&format=json&limit=100';

  List<_Book>? _cachedBooks;

  @override
  Future<List<StudyResource>> search(String query, http.Client client) async {
    final books = await _fetchCatalog(client);
    final queryWords = _extractQueryWords(query);

    final matches = <_Book>[];
    for (final book in books) {
      if (book.state != 'live') continue;
      if (!_matchesQuery(book.title, queryWords)) continue;
      matches.add(book);
      if (matches.length >= 3) break; // At most 3 results
    }

    return matches.map((book) => _toResource(book)).toList();
  }

  Future<List<_Book>> _fetchCatalog(http.Client client) async {
    if (_cachedBooks != null) {
      return _cachedBooks!;
    }

    final uri = Uri.parse(_catalogUrl);
    final response = await client.get(uri, headers: {'User-Agent': kUserAgent});

    if (response.statusCode != 200) {
      throw SourceException('OpenStax HTTP ${response.statusCode}');
    }

    final Map<String, dynamic> data;
    try {
      data = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw SourceException('OpenStax: invalid JSON');
    }

    final items = data['items'] as List<dynamic>?;
    if (items == null) {
      _cachedBooks = const [];
      return _cachedBooks!;
    }

    final books = <_Book>[];
    for (final item in items) {
      final meta = item['meta'] as Map<String, dynamic>?;
      final title = item['title'] as String?;
      final slug = (meta?['slug'] ?? item['slug']) as String?;
      final coverUrl = item['cover_url'] as String?;
      final bookState = item['book_state'] as String?;
      final licenseName = item['license_name'] as String?;
      final licenseUrl = item['license_url'] as String?;

      if (title == null || title.isEmpty) continue;
      if (slug == null || slug.isEmpty) continue;
      if (bookState == null) continue;

      final htmlUrl = meta?['html_url'] as String?;

      books.add(_Book(
        id: slug,
        title: title,
        slug: slug,
        coverUrl: coverUrl,
        state: bookState,
        licenseName: licenseName ?? '',
        licenseUrl: licenseUrl,
        htmlUrl: htmlUrl,
      ));
    }

    _cachedBooks = books;
    return books;
  }

  /// Extracts words of 3+ letters from the query, lowercased.
  List<String> _extractQueryWords(String query) {
    return query
        .toLowerCase()
        .split(RegExp(r'\W+'))
        .where((w) => w.length >= 3)
        .toSet()
        .toList();
  }

  /// Checks if the title contains any of the query words.
  bool _matchesQuery(String title, List<String> queryWords) {
    final lowerTitle = title.toLowerCase();
    for (final word in queryWords) {
      if (lowerTitle.contains(word)) return true;
    }
    return false;
  }

  StudyResource _toResource(_Book book) {
    final url = book.htmlUrl ??
        'https://openstax.org/details/books/${book.slug}';
    final license = _simplifyLicense(book.licenseName);

    return StudyResource(
      id: 'openstax-${book.id}',
      title: book.title,
      source: name,
      license: license,
      licenseUrl: book.licenseUrl,
      type: ResourceType.article,
      url: url,
      thumbnailUrl: book.coverUrl,
    );
  }

  /// Simplifies the license name to a short label.
  String _simplifyLicense(String licenseName) {
    final lower = licenseName.toLowerCase();
    if (lower.contains('noncommercial') && lower.contains('sharealike')) {
      return 'CC BY-NC-SA';
    }
    if (lower.contains('attribution') && !lower.contains('noncommercial')) {
      return 'CC BY';
    }
    if (lower.contains('noncommercial') && lower.contains('noderivs')) {
      return 'CC BY-NC-ND';
    }
    if (lower.contains('noncommercial')) {
      return 'CC BY-NC';
    }
    if (lower.contains('sharealike')) {
      return 'CC BY-SA';
    }
    if (lower.contains('noderivs') || lower.contains('no derivatives')) {
      return 'CC BY-ND';
    }
    if (lower.contains('cc0') || lower.contains('public domain')) {
      return 'CC0';
    }
    return licenseName;
  }
}

class _Book {
  final String id;
  final String title;
  final String slug;
  final String? coverUrl;
  final String state;
  final String licenseName;
  final String? licenseUrl;
  final String? htmlUrl;

  _Book({
    required this.id,
    required this.title,
    required this.slug,
    this.coverUrl,
    required this.state,
    required this.licenseName,
    this.licenseUrl,
    this.htmlUrl,
  });
}