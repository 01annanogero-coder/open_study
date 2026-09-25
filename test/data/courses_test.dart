import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/tex.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_study_app/data/course_catalog.dart';

/// Every formula in a lesson text: `$$...$$` paragraphs and `$...$` runs.
List<String> formulasIn(String text) {
  final out = <String>[];
  for (final p in text.trim().split(RegExp(r'\n\s*\n'))) {
    final t = p.trim();
    if (t.startsWith(r'$$') && t.endsWith(r'$$') && t.length > 4) {
      out.add(t.substring(2, t.length - 2));
      continue;
    }
    final parts = t.split(r'$');
    for (var i = 1; i < parts.length - 1; i += 2) {
      out.add(parts[i]);
    }
  }
  return out;
}

void main() {
  test('catalogue: subjects match Home, ids are unique, no empty shelves', () {
    // Subject ids of the tiles on Home and in its "All subjects" sheet.
    const homeSubjects = {
      'mathematics', 'computer-science', 'business-economics', 'health-sciences', 'engineering',
      'languages', 'social-sciences', 'physics', 'chemistry', 'biology', 'geography', 'history', 'law',
      'education', 'agriculture', 'environment', 'arts-design', 'music', 'psychology',
    };
    expect(homeSubjects, containsAll(shelvesBySubject.keys));
    final ids = allCourses.map((c) => c.id).toList();
    expect(ids.toSet().length, ids.length);
    for (final shelves in shelvesBySubject.values) {
      for (final s in shelves) {
        expect(s.courses, isNotEmpty, reason: s.title);
      }
    }
    // A book can sit in several subjects: Principles of Data Science is in three.
    final dataScience = allCourses.firstWhere((c) => c.id == 'openstax-principles-data-science');
    for (final subject in ['business-economics', 'mathematics', 'computer-science']) {
      expect(coursesForSubject(subject), contains(dataScience), reason: subject);
    }
  });

  for (final course in allCourses) {
    group(course.title, () {
      test('ids are unique and every lesson can be opened', () {
        final ids = course.allLessons.map((e) => e.lesson.id).toList();
        expect(ids.toSet().length, ids.length);
        expect(course.chapters.map((c) => c.id).toSet().length, course.chapters.length);
        if (course.isOnline) {
          // Every lesson links to a distinct https page of the publisher.
          final urls = course.allLessons.map((e) => course.urlFor(e.lesson)).toList();
          for (final e in course.allLessons) {
            final uri = Uri.tryParse(course.urlFor(e.lesson) ?? '');
            expect(uri?.scheme, 'https', reason: e.lesson.id);
            expect(uri?.host, isNotEmpty, reason: e.lesson.id);
          }
          expect(urls.toSet().length, urls.length);
          expect(course.licenseUrl, isNotNull);
          expect(course.publisher, isNotNull);
        } else {
          for (final id in ids) {
            expect(course.lessonTexts[id]?.trim(), isNotEmpty, reason: id);
          }
          expect(course.lessonTexts.keys.toSet(), ids.toSet());
        }
      });

      test('pages increase through the book', () {
        var last = 0;
        for (final e in course.allLessons) {
          final page = e.lesson.page;
          if (page == null) continue;
          expect(page, greaterThanOrEqualTo(last), reason: e.lesson.id);
          last = page;
        }
      });

      test('has a description and a licence', () {
        expect(course.description, isNotEmpty);
        expect(course.license, isNotEmpty);
        expect(course.sourceNote, isNotEmpty);
      });

      test('every formula renders', skip: course.isOnline ? 'lessons are web pages' : false, () {
        final failures = <String>[];
        var count = 0;
        for (final e in course.allLessons) {
          final text = course.lessonTexts[e.lesson.id]!;
          expect(r'$'.allMatches(text).length.isEven, isTrue, reason: '${e.lesson.id}: unpaired \$');
          for (final f in formulasIn(text)) {
            count++;
            try {
              TexParser(f, const TexParserSettings()).parse();
            } on ParseException catch (err) {
              failures.add('${e.lesson.id}: ${err.message}\n    $f');
            }
          }
        }
        expect(count, greaterThan(0));
        expect(failures, isEmpty, reason: '${failures.length} of $count formulas failed:\n${failures.join('\n')}');
      });
    });
  }
}
