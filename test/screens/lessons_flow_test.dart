import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_study_app/data/course_catalog.dart';
import 'package:open_study_app/main.dart';
import 'package:open_study_app/screens/lesson_screen.dart';
import 'package:open_study_app/services/local_store.dart';
import 'package:open_study_app/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<LocalStore> freshStore() async {
  SharedPreferences.setMockInitialValues({});
  return LocalStore.open();
}

void useTallPhone(WidgetTester tester) {
  tester.view.physicalSize = const Size(400, 2400);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

void main() {
  testWidgets('Mathematics opens lessons and search tabs, and a lesson can be read', (tester) async {
    useTallPhone(tester);
    final store = await freshStore();
    await tester.pumpWidget(OpenStudyApp(store: store, checkForUpdates: false));

    // Tiles on Home with lessons carry the badge: Mathematics, Computer
    // Science, Business & Economics, Engineering and Social Sciences.
    expect(find.byTooltip('Has built-in lessons'), findsNWidgets(5));
    await tester.tap(find.text('Mathematics').first);
    await tester.pumpAndSettle();

    expect(find.text('Lessons'), findsOneWidget);
    expect(find.text('Search results'), findsOneWidget);
    expect(find.text('Calculus Volume 1'), findsOneWidget);

    // Show just the Pure Mathematics shelf (its chip is at the end of the
    // sideways row), then open Hardy.
    final chip = find.widgetWithText(ChoiceChip, 'Pure Mathematics');
    await tester.scrollUntilVisible(
      chip,
      200,
      scrollable: find.descendant(
        of: find.byWidgetPredicate((w) => w is ListView && w.scrollDirection == Axis.horizontal),
        matching: find.byType(Scrollable),
      ),
    );
    await tester.ensureVisible(chip);
    await tester.pumpAndSettle();
    await tester.tap(chip);
    await tester.pumpAndSettle();
    expect(find.text('Calculus Volume 1'), findsNothing);
    await tester.tap(find.text('A Course of Pure Mathematics'));
    await tester.pumpAndSettle();
    expect(find.text('Start with lesson 1'), findsOneWidget);

    // Open chapter I and its first lesson.
    await tester.tap(find.text('Real Variables'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Rational numbers'));
    await tester.pumpAndSettle();

    expect(find.text('Chapter I · Lesson 1 of 133'), findsOneWidget);
    expect(find.textContaining('§1–2 · page 1'), findsOneWidget);
    expect(find.byType(Math), findsWidgets);
    expect(store.lastLesson('hardy-pure-mathematics'), 'ch1-t1');

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('Chapter I · Lesson 2 of 133'), findsOneWidget);
    expect(find.text('Irrational numbers'), findsOneWidget);
    expect(store.lastLesson('hardy-pure-mathematics'), 'ch1-t2');

    // Back on the course page, reading can resume where it stopped.
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.textContaining('Continue: §3–7 Irrational numbers'), findsOneWidget);
  });

  testWidgets('Computer Science lists the OpenStax course, opening sections online', (tester) async {
    useTallPhone(tester);
    final store = await freshStore();
    await tester.pumpWidget(OpenStudyApp(store: store, checkForUpdates: false));

    await tester.tap(find.text('Computer\nScience'));
    await tester.pumpAndSettle();
    expect(find.text('Introduction to Computer Science'), findsOneWidget);
    expect(find.text('Introduction to Python Programming'), findsOneWidget);
    expect(find.text('CC BY-NC-SA 4.0'), findsWidgets);
    expect(find.text('openstax.org'), findsWidgets);

    await tester.tap(find.text('Introduction to Computer Science'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Data Structures and Algorithms'));
    await tester.pumpAndSettle();
    expect(find.text('Algorithm Design and Discovery'), findsOneWidget);
    expect(find.text('3.2'), findsOneWidget);
  });

  test('an online lesson opens as its publisher page with source and licence', () {
    final cs = allCourses.firstWhere((c) => c.id == 'openstax-introduction-computer-science');
    final lesson = cs.allLessons.firstWhere((e) => e.lesson.sectionRef == '3.2').lesson;
    final r = cs.resourceFor(lesson);
    expect(r.url, 'https://openstax.org/books/introduction-computer-science/pages/3-2-algorithm-design-and-discovery');
    expect(r.title, '3.2 Algorithm Design and Discovery');
    expect(r.source, 'OpenStax');
    expect(r.license, 'CC BY-NC-SA 4.0');
    expect(r.licenseUrl, 'https://creativecommons.org/licenses/by-nc-sa/4.0/');
    expect(cs.resourceFor(cs.allLessons.first.lesson).title, 'Ch. 1 · Introduction');
  });

  testWidgets('Engineering lists the Engineering Statics course', (tester) async {
    useTallPhone(tester);
    final store = await freshStore();
    await tester.pumpWidget(OpenStudyApp(store: store, checkForUpdates: false));
    await tester.tap(find.text('Engineering'));
    await tester.pumpAndSettle();
    expect(find.text('Engineering Statics: Open and Interactive'), findsOneWidget);
    expect(find.text('engineeringstatics.org'), findsOneWidget);
  });

  testWidgets('a subject without lessons still goes straight to search', (tester) async {
    useTallPhone(tester);
    final store = await freshStore();
    await tester.pumpWidget(OpenStudyApp(store: store, checkForUpdates: false));
    await tester.tap(find.text('Languages'));
    await tester.pump();
    // The Search tab's own app bar title is showing, not a subject page.
    expect(find.widgetWithText(AppBar, 'Search'), findsOneWidget);
    expect(find.text('Lessons'), findsNothing);
  });

  testWidgets('every lesson renders without errors', (tester) async {
    // Tall enough that each whole lesson is laid out, not just its top.
    tester.view.physicalSize = const Size(320, 12000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final store = await freshStore();
    for (final course in allCourses.where((c) => !c.isOnline)) {
      for (var i = 0; i < course.allLessons.length; i++) {
        await tester.pumpWidget(MaterialApp(
          theme: AppTheme.light,
          home: LessonScreen(key: ValueKey(i), course: course, store: store, index: i),
        ));
        expect(tester.takeException(), isNull, reason: course.allLessons[i].lesson.id);
        expect(find.text(course.allLessons[i].lesson.title), findsWidgets);
      }
    }
  });
}
