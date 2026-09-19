import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:open_study_app/services/sources/sources.dart';
import 'package:open_study_app/services/sources/open_source.dart';
import 'package:open_study_app/models/study_resource.dart';

void main() {
  group('licenseLabelFromUrl', () {
    test('CC BY 4.0', () {
      expect(
        licenseLabelFromUrl('https://creativecommons.org/licenses/by/4.0/'),
        'CC BY 4.0',
      );
    });

    test('CC BY-SA 3.0', () {
      expect(
        licenseLabelFromUrl('https://creativecommons.org/licenses/by-sa/3.0/'),
        'CC BY-SA 3.0',
      );
    });

    test('CC BY-NC 4.0', () {
      expect(
        licenseLabelFromUrl('https://creativecommons.org/licenses/by-nc/4.0/'),
        'CC BY-NC 4.0',
      );
    });

    test('CC BY-NC-SA 4.0', () {
      expect(
        licenseLabelFromUrl(
            'https://creativecommons.org/licenses/by-nc-sa/4.0/'),
        'CC BY-NC-SA 4.0',
      );
    });

    test('CC BY-ND 4.0', () {
      expect(
        licenseLabelFromUrl('https://creativecommons.org/licenses/by-nd/4.0/'),
        'CC BY-ND 4.0',
      );
    });

    test('CC BY-NC-ND 4.0', () {
      expect(
        licenseLabelFromUrl(
            'https://creativecommons.org/licenses/by-nc-nd/4.0/'),
        'CC BY-NC-ND 4.0',
      );
    });

    test('CC0 1.0', () {
      expect(
        licenseLabelFromUrl(
            'https://creativecommons.org/publicdomain/zero/1.0/'),
        'CC0 1.0',
      );
    });

    test('Public Domain Mark', () {
      expect(
        licenseLabelFromUrl(
            'https://creativecommons.org/publicdomain/mark/1.0/'),
        'Public Domain Mark',
      );
    });

    test('Unknown URL returns See licence', () {
      expect(
        licenseLabelFromUrl('https://example.com/license'),
        'See licence',
      );
    });
  });

  group('licenseLabelFromCode', () {
    test('cc-by', () => expect(licenseLabelFromCode('cc-by'), 'CC BY'));
    test('cc-by-sa', () => expect(licenseLabelFromCode('cc-by-sa'), 'CC BY-SA'));
    test('cc0', () => expect(licenseLabelFromCode('cc0'), 'CC0'));
    test('public-domain', () =>
        expect(licenseLabelFromCode('public-domain'), 'Public domain'));
    test('cc-by-nc', () => expect(licenseLabelFromCode('cc-by-nc'), 'CC BY-NC'));
    test('cc-by-nc-sa',
        () => expect(licenseLabelFromCode('cc-by-nc-sa'), 'CC BY-NC-SA'));
    test('cc-by-nd', () => expect(licenseLabelFromCode('cc-by-nd'), 'CC BY-ND'));
    test('cc-by-nc-nd',
        () => expect(licenseLabelFromCode('cc-by-nc-nd'), 'CC BY-NC-ND'));
    test('unknown', () => expect(licenseLabelFromCode('unknown'), 'See licence'));
    test('case insensitive', () =>
        expect(licenseLabelFromCode('CC-BY'), 'CC BY'));
  });

  group('InternetArchiveSource', () {
    final source = InternetArchiveSource();

    test('maps response to StudyResource correctly', () async {
      final responseBody = jsonEncode({
        'response': {
          'docs': [
            {
              'identifier': 'test123',
              'title': 'Test Book',
              'mediatype': 'texts',
              'licenseurl': 'https://creativecommons.org/licenses/by/4.0/',
              'creator': 'John Doe',
            },
            {
              'identifier': 'test456',
              'title': ['Movie Title'],
              'mediatype': 'movies',
              'licenseurl': 'https://creativecommons.org/publicdomain/zero/1.0/',
              'creator': ['Jane Smith', 'Bob Wilson'],
            },
          ]
        }
      });

      final client = MockClient((request) async {
        expect(request.headers['User-Agent'], kUserAgent);
        return http.Response(responseBody, 200);
      });

      final results = await source.search('test query', client);

      expect(results.length, 2);
      expect(results[0].id, 'ia-test123');
      expect(results[0].title, 'Test Book');
      expect(results[0].type, ResourceType.article);
      expect(results[0].license, 'CC BY 4.0');
      expect(results[0].licenseUrl,
          'https://creativecommons.org/licenses/by/4.0/');
      expect(results[0].url, 'https://archive.org/details/test123');
      expect(results[0].thumbnailUrl,
          'https://archive.org/services/img/test123');
      expect(results[0].creator, 'John Doe');

      expect(results[1].id, 'ia-test456');
      expect(results[1].title, 'Movie Title');
      expect(results[1].type, ResourceType.video);
      expect(results[1].license, 'CC0 1.0');
      expect(results[1].creator, 'Jane Smith, Bob Wilson');
    });

    test('skips docs without CC or public domain licenseurl', () async {
      final responseBody = jsonEncode({
        'response': {
          'docs': [
            {
              'identifier': 'nocclicense',
              'title': 'No CC License',
              'mediatype': 'texts',
              'licenseurl': 'https://example.com/license',
              'creator': 'Author',
            },
            {
              'identifier': 'hascc',
              'title': 'Has CC',
              'mediatype': 'texts',
              'licenseurl': 'https://creativecommons.org/licenses/by/4.0/',
              'creator': 'Author',
            },
          ]
        }
      });

      final client = MockClient((request) async {
        return http.Response(responseBody, 200);
      });

      final results = await source.search('test', client);
      expect(results.length, 1);
      expect(results[0].id, 'ia-hascc');
    });

    test('throws SourceException on non-200', () async {
      final client = MockClient((request) async => http.Response('Not Found', 404));
      expect(() => source.search('test', client), throwsA(isA<SourceException>()));
    });

    test('throws SourceException on invalid JSON', () async {
      final client = MockClient((request) async => http.Response('not json', 200));
      expect(() => source.search('test', client), throwsA(isA<SourceException>()));
    });
  });

  group('WikipediaSource', () {
    final source = WikipediaSource();

    test('maps response to StudyResource correctly', () async {
      final responseBody = jsonEncode({
        'query': {
          'search': [
            {
              'pageid': 12345,
              'title': 'Software Engineering',
              'snippet': '<span class="searchmatch">Software</span> engineering is the <b>study</b> of...',
            },
          ]
        }
      });

      final client = MockClient((request) async {
        expect(request.headers['User-Agent'], kUserAgent);
        return http.Response(responseBody, 200);
      });

      final results = await source.search('software engineering', client);

      expect(results.length, 1);
      expect(results[0].id, 'wiki-12345');
      expect(results[0].title, 'Software Engineering');
      expect(results[0].type, ResourceType.article);
      expect(results[0].license, 'CC BY-SA 4.0');
      expect(results[0].licenseUrl, 'https://creativecommons.org/licenses/by-sa/4.0/');
      expect(results[0].url, 'https://en.wikipedia.org/wiki/Software_Engineering');
      expect(results[0].description, 'Software engineering is the study of...');
    });

    test('decodes HTML entities in snippet', () async {
      final responseBody = jsonEncode({
        'query': {
          'search': [
            {
              'pageid': 1,
              'title': 'Test & Entity',
              'snippet': 'This \u0026quot;quoted\u0026quot; and &#039;apostrophe&#039; \u0026amp; more',
            },
          ]
        }
      });

      final client = MockClient((request) async => http.Response(responseBody, 200));
      final results = await source.search('test', client);

      expect(results[0].description, 'This "quoted" and \'apostrophe\' & more');
    });

    test('throws SourceException on non-200', () async {
      final client = MockClient((request) async => http.Response('Error', 500));
      expect(() => source.search('test', client), throwsA(isA<SourceException>()));
    });
  });

  group('ArxivSource', () {
    final source = ArxivSource();

    test('parses Atom feed and maps to StudyResource', () async {
      final atomXml = '''<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <entry>
    <id>https://arxiv.org/abs/2301.12345</id>
    <title>Attention Is All You Need</title>
    <summary>We propose a new simple network architecture, the Transformer, based solely on attention mechanisms.</summary>
    <author><name>Ashish Vaswani</name></author>
    <author><name>Noam Shazeer</name></author>
  </entry>
  <entry>
    <id>https://arxiv.org/abs/2302.56789</id>
    <title>BERT: Pre-training of Deep Bidirectional Transformers</title>
    <summary>We introduce BERT, a method for pre-training bidirectional transformers.</summary>
    <author><name>Jacob Devlin</name></author>
  </entry>
</feed>''';

      final client = MockClient((request) async {
        expect(request.headers['User-Agent'], kUserAgent);
        expect(request.headers['Accept'], 'application/xml, text/xml');
        return http.Response(atomXml, 200);
      });

      final results = await source.search('transformer', client);

      expect(results.length, 2);
      expect(results[0].id, 'arxiv-2301.12345');
      expect(results[0].title, 'Attention Is All You Need');
      expect(results[0].type, ResourceType.article);
      expect(results[0].license, 'Free to read (arXiv)');
      expect(results[0].licenseUrl, isNull);
      expect(results[0].url, 'https://arxiv.org/abs/2301.12345');
      expect(results[0].creator, 'Ashish Vaswani, Noam Shazeer');
      expect(results[0].description!.length, lessThanOrEqualTo(200));

      expect(results[1].id, 'arxiv-2302.56789');
      expect(results[1].creator, 'Jacob Devlin');
    });

    test('does not invent a licence', () async {
      final atomXml = '''<?xml version="1.0"?><feed xmlns="http://www.w3.org/2005/Atom"><entry><id>https://arxiv.org/abs/123</id><title>Test</title><summary>Summary</summary></entry></feed>''';

      final client = MockClient((request) async => http.Response(atomXml, 200));
      final results = await source.search('test', client);

      expect(results[0].license, 'Free to read (arXiv)');
      expect(results[0].licenseUrl, isNull);
    });

    test('throws SourceException on non-200', () async {
      final client = MockClient((request) async => http.Response('Error', 403));
      expect(() => source.search('test', client), throwsA(isA<SourceException>()));
    });

    test('throws SourceException on invalid XML', () async {
      final client = MockClient((request) async => http.Response('not xml', 200));
      expect(() => source.search('test', client), throwsA(isA<SourceException>()));
    });
  });

  group('OpenAlexSource', () {
    final source = OpenAlexSource();

    test('maps response to StudyResource correctly', () async {
      final responseBody = jsonEncode({
        'results': [
          {
            'id': 'https://openalex.org/W123456789',
            'title': 'Open Access Paper',
            'best_oa_location': {
              'license': 'cc-by',
              'landing_page_url': 'https://example.com/paper',
              'pdf_url': 'https://example.com/paper.pdf',
            },
            'authorships': [
              {'author': {'display_name': 'Author One'}},
              {'author': {'display_name': 'Author Two'}},
              {'author': {'display_name': 'Author Three'}},
              {'author': {'display_name': 'Author Four'}},
            ],
          },
          {
            'id': 'https://openalex.org/W987654321',
            'title': 'Another Paper',
            'best_oa_location': {
              'license': 'cc-by-sa',
              'landing_page_url': null,
              'pdf_url': 'https://example.com/another.pdf',
            },
            'authorships': [
              {'author': {'display_name': 'Solo Author'}},
            ],
          },
        ]
      });

      final client = MockClient((request) async {
        expect(request.headers['User-Agent'], kUserAgent);
        return http.Response(responseBody, 200);
      });

      final results = await source.search('machine learning', client);

      expect(results.length, 2);
      expect(results[0].id, 'openalex-W123456789');
      expect(results[0].license, 'CC BY');
      expect(results[0].url, 'https://example.com/paper');
      expect(results[0].creator, 'Author One, Author Two, Author Three');

      expect(results[1].id, 'openalex-W987654321');
      expect(results[1].license, 'CC BY-SA');
      expect(results[1].url, 'https://example.com/another.pdf');
      expect(results[1].creator, 'Solo Author');
    });

    test('drops works without a license', () async {
      final responseBody = jsonEncode({
        'results': [
          {
            'id': 'https://openalex.org/W1',
            'title': 'No License',
            'best_oa_location': {
              'license': null,
              'landing_page_url': 'https://example.com/1',
            },
            'authorships': [],
          },
          {
            'id': 'https://openalex.org/W2',
            'title': 'Has License',
            'best_oa_location': {
              'license': 'cc-by',
              'landing_page_url': 'https://example.com/2',
            },
            'authorships': [],
          },
        ]
      });

      final client = MockClient((request) async => http.Response(responseBody, 200));
      final results = await source.search('test', client);

      expect(results.length, 1);
      expect(results[0].id, 'openalex-W2');
    });

    test('drops works without a URL', () async {
      final responseBody = jsonEncode({
        'results': [
          {
            'id': 'https://openalex.org/W1',
            'title': 'No URL',
            'best_oa_location': {
              'license': 'cc-by',
              'landing_page_url': null,
              'pdf_url': null,
            },
            'authorships': [],
          },
        ]
      });

      final client = MockClient((request) async => http.Response(responseBody, 200));
      final results = await source.search('test', client);

      expect(results.length, 0);
    });

    test('throws SourceException on non-200', () async {
      final client = MockClient((request) async => http.Response('Error', 502));
      expect(() => source.search('test', client), throwsA(isA<SourceException>()));
    });
  });

  group('DoajSource', () {
    final source = DoajSource();

    test('maps response to StudyResource correctly', () async {
      final responseBody = jsonEncode({
        'results': [
          {
            'id': 'abc123',
            'bibjson': {
              'title': 'Open Access Article',
              'author': [
                {'name': 'Author One'},
                {'name': 'Author Two'},
              ],
              'link': [
                {'type': 'fulltext', 'url': 'https://journal.example/article'},
                {'type': 'other', 'url': 'https://journal.example/other'},
              ],
              'journal': {
                'license': [{'type': 'cc-by'}],
              },
            },
          },
          {
            'id': 'def456',
            'bibjson': {
              'title': 'Another Article',
              'author': [{'name': 'Solo Author'}],
              'link': [
                {'type': 'other', 'url': 'http://journal.example/another'},
              ],
            },
          },
        ]
      });

      final client = MockClient((request) async {
        expect(request.headers['User-Agent'], kUserAgent);
        return http.Response(responseBody, 200);
      });

      final results = await source.search('biology', client);

      expect(results.length, 2);
      expect(results[0].id, 'doaj-abc123');
      expect(results[0].title, 'Open Access Article');
      expect(results[0].license, 'Open access (see article)');
      expect(results[0].url, 'https://journal.example/article');
      expect(results[0].creator, 'Author One, Author Two');

      expect(results[1].id, 'doaj-def456');
      expect(results[1].url, 'https://journal.example/another'); // converted to https
    });

    test('skips results without a URL', () async {
      final responseBody = jsonEncode({
        'results': [
          {
            'id': 'nourl',
            'bibjson': {
              'title': 'No URL',
              'author': [],
              'link': [],
            },
          },
        ]
      });

      final client = MockClient((request) async => http.Response(responseBody, 200));
      final results = await source.search('test', client);

      expect(results.length, 0);
    });

    test('throws SourceException on non-200', () async {
      final client = MockClient((request) async => http.Response('Error', 429));
      expect(() => source.search('test', client), throwsA(isA<SourceException>()));
    });
  });

  group('OpenStaxSource', () {
    late OpenStaxSource source;

    setUp(() {
      source = OpenStaxSource();
    });

    final catalogResponse = jsonEncode({
      'items': [
        {
          'title': 'Introduction to Software Engineering',
          'slug': 'intro-software-engineering',
          'cover_url': 'https://openstax.org/covers/se.jpg',
          'book_state': 'live',
          'license_name': 'Creative Commons Attribution License 4.0',
          'license_url': 'https://creativecommons.org/licenses/by/4.0/',
          'meta': {'html_url': 'https://openstax.org/books/se'},
        },
        {
          'title': 'College Physics',
          'slug': 'college-physics',
          'cover_url': 'https://openstax.org/covers/physics.jpg',
          'book_state': 'live',
          'license_name': 'Creative Commons Attribution NonCommercial ShareAlike',
          'license_url': 'https://creativecommons.org/licenses/by-nc-sa/4.0/',
          'meta': {},
        },
        {
          'title': 'Draft Book',
          'slug': 'draft-book',
          'cover_url': null,
          'book_state': 'draft',
          'license_name': 'CC BY',
          'license_url': null,
          'meta': {},
        },
        {
          'title': 'No Slug Book',
          'slug': '',
          'cover_url': null,
          'book_state': 'live',
          'license_name': 'CC BY',
          'license_url': null,
          'meta': {},
        },
      ],
    });

    test('filters by query words and caches catalog', () async {
      var callCount = 0;
      final client = MockClient((request) async {
        callCount++;
        expect(request.headers['User-Agent'], kUserAgent);
        return http.Response(catalogResponse, 200);
      });

      // First search - should fetch catalog
      final results1 = await source.search('software engineering', client);
      expect(callCount, 1);
      expect(results1.length, 1);
      expect(results1[0].title, 'Introduction to Software Engineering');
      expect(results1[0].license, 'CC BY');

      // Second search - should use cache
      final results2 = await source.search('physics', client);
      expect(callCount, 1); // Still 1, cached
      expect(results2.length, 1);
      expect(results2[0].title, 'College Physics');
      expect(results2[0].license, 'CC BY-NC-SA');
    });

    test('returns at most 3 results', () async {
      // Create a source with many matching books
      final manyBooks = jsonEncode({
        'items': List.generate(10, (i) => {
          'title': 'Software Book $i',
          'slug': 'software-book-$i',
          'cover_url': null,
          'book_state': 'live',
          'license_name': 'CC BY',
          'license_url': null,
          'meta': {},
        }),
      });

      final client = MockClient((request) async => http.Response(manyBooks, 200));
      final results = await source.search('software', client);

      expect(results.length, 3);
    });

    test('skips draft books and books without slug', () async {
      final client = MockClient((request) async => http.Response(catalogResponse, 200));
      // Query "software physics" matches both "Introduction to Software Engineering"
      // (contains "software") and "College Physics" (contains "physics")
      // "Draft Book" is draft, "No Slug Book" has empty slug - both should be skipped
      final results = await source.search('software physics', client);

      expect(results.length, 2);
      for (final r in results) {
        expect(r.id, isNot(contains('draft-book')));
        expect(r.id, isNot(contains('no-slug')));
      }
    });

    test('throws SourceException on non-200', () async {
      final client = MockClient((request) async => http.Response('Error', 500));
      expect(() => source.search('test', client), throwsA(isA<SourceException>()));
    });
  });

  group('YouTubeCcSource', () {
    test('returns empty list when API key is empty without network call', () async {
      var called = false;
      final client = MockClient((request) async {
        called = true;
        return http.Response('', 200);
      });

      final source = YouTubeCcSource('');
      final results = await source.search('test', client);

      expect(results, isEmpty);
      expect(called, isFalse);
    });

    test('maps response to StudyResource correctly', () async {
      final responseBody = jsonEncode({
        'items': [
          {
            'id': {'videoId': 'abc123'},
            'snippet': {
              'title': 'Software Engineering & Design',
              'channelTitle': 'EduChannel',
              'thumbnails': {
                'medium': {'url': 'https://i.ytimg.com/vi/abc123/mqdefault.jpg'},
              },
            },
          },
        ]
      });

      final client = MockClient((request) async {
        expect(request.headers['User-Agent'], kUserAgent);
        // Verify key is sent as query parameter
        expect(request.url.queryParameters['key'], 'test-key');
        return http.Response(responseBody, 200);
      });

      final source = YouTubeCcSource('test-key');
      final results = await source.search('software', client);

      expect(results.length, 1);
      expect(results[0].id, 'yt-abc123');
      expect(results[0].title, 'Software Engineering & Design');
      expect(results[0].type, ResourceType.video);
      expect(results[0].license, 'CC BY');
      expect(results[0].licenseUrl, 'https://creativecommons.org/licenses/by/3.0/');
      expect(results[0].url, 'https://www.youtube.com/watch?v=abc123');
      expect(results[0].thumbnailUrl, 'https://i.ytimg.com/vi/abc123/mqdefault.jpg');
      expect(results[0].creator, 'EduChannel');
    });

    test('decodes HTML entities in title', () async {
      final responseBody = jsonEncode({
        'items': [
          {
            'id': {'videoId': 'xyz789'},
            'snippet': {
              'title': 'Software \u0026amp; Design \u0026quot;quoted\u0026quot;',
              'channelTitle': 'TestChannel',
              'thumbnails': {
                'medium': {'url': 'https://i.ytimg.com/vi/xyz789/mqdefault.jpg'},
              },
            },
          },
        ]
      });

      final client = MockClient((request) async => http.Response(responseBody, 200));
      final source = YouTubeCcSource('test-key');
      final results = await source.search('software', client);

      expect(results.length, 1);
      expect(results[0].title, 'Software & Design "quoted"');
    });

    test('throws SourceException on non-200', () async {
      final client = MockClient((request) async => http.Response('Quota exceeded', 403));
      final source = YouTubeCcSource('test-key');
      expect(() => source.search('test', client), throwsA(isA<SourceException>()));
    });
  });
}