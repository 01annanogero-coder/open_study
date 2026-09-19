import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:open_study_app/services/sources/openstax_source.dart';
import 'package:open_study_app/models/study_resource.dart';

/// Uses the exact shape the real OpenStax CMS API returns (slug and html_url
/// live inside "meta", there is no top-level "slug"). An earlier version of the
/// source assumed a top-level slug, passed its mocked tests, and returned
/// nothing against the real API.
void main() {
  final realShape = {
    'items': [
      {
        'id': 1,
        'meta': {
          'slug': 'college-algebra-2e',
          'type': 'books.Book',
          'html_url': 'https://openstax.org/details/books/college-algebra-2e',
        },
        'title': 'College Algebra 2e',
        'book_state': 'live',
        'cover_url': 'https://assets.openstax.org/cover.svg',
        'license_name':
            'Creative Commons Attribution License',
        'license_url': 'https://creativecommons.org/licenses/by/4.0/',
      },
      {
        'id': 2,
        'meta': {
          'slug': 'college-algebra',
          'type': 'books.Book',
          'html_url': 'https://openstax.org/details/books/college-algebra',
        },
        'title': 'College Algebra',
        'book_state': 'retired',
        'cover_url': 'https://assets.openstax.org/cover2.svg',
        'license_name': 'Creative Commons Attribution License',
        'license_url': 'https://creativecommons.org/licenses/by/4.0/',
      },
    ],
  };

  test('OpenStax works with the real API response shape', () async {
    final client = MockClient((request) async {
      expect(request.url.host, 'openstax.org');
      return http.Response(jsonEncode(realShape), 200);
    });

    final results = await OpenStaxSource().search('algebra', client);

    expect(results, hasLength(1)); // the retired edition is skipped
    expect(results.first.title, 'College Algebra 2e');
    expect(results.first.url,
        'https://openstax.org/details/books/college-algebra-2e');
    expect(results.first.license, 'CC BY');
    expect(results.first.licenseUrl, 'https://creativecommons.org/licenses/by/4.0/');
    expect(results.first.type, ResourceType.article);
  });
}
