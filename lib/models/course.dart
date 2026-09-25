/// Built-in courses: whole public-domain or openly licensed books, split into
/// the lessons a learner works through.
///
/// A course either carries its own lesson texts (read offline, e.g. Hardy),
/// or links each lesson to the publisher's free web page for that section
/// (e.g. OpenStax), which keeps the app small.
///
/// A [Course] is made of ordered [CourseChapter]s, each made of ordered
/// [Lesson]s. This mirrors how the source book is organised (chapter, then
/// numbered sections), so every lesson stays traceable to the original.
///
/// To add a course for another subject, create a data file like
/// `lib/data/courses/hardy_pure_mathematics.dart` and list it in
/// `lib/data/course_catalog.dart`.
library;

import 'study_resource.dart';

class Lesson {
  /// Stable id, e.g. 'ch1-t1'. Unique within its course.
  final String id;

  /// Section number(s) in the source, e.g. '1–2' or '17'.
  final String sectionRef;

  final String title;

  /// One or two sentence plain-language summary of what the lesson covers.
  /// May be empty.
  final String summary;

  /// Printed page on which the lesson begins in the source edition, if known.
  final int? page;

  /// The publisher's own web page for this section, for courses that link
  /// out instead of carrying the text: a full https address, or a page name
  /// joined to [Course.webBase]. Use [Course.urlFor] to read it.
  final String? url;

  /// Named results or sub-topics the book's contents list for this lesson.
  final List<String> highlights;

  const Lesson({
    required this.id,
    required this.sectionRef,
    required this.title,
    this.summary = '',
    this.page,
    this.url,
    this.highlights = const [],
  });
}

class CourseChapter {
  /// Stable id, e.g. 'ch1'.
  final String id;

  /// Chapter number as printed, e.g. 'I', 'II'.
  final String number;

  final String title;

  /// Printed pages the chapter covers, e.g. '1–37'. May be empty.
  final String pageRange;

  /// One-paragraph overview of the chapter. May be empty.
  final String overview;

  final List<Lesson> lessons;

  const CourseChapter({
    required this.id,
    required this.number,
    required this.title,
    required this.lessons,
    this.pageRange = '',
    this.overview = '',
  });
}

class Course {
  /// Stable id, e.g. 'hardy-pure-mathematics'. Which subjects show the
  /// course is decided in `course_catalog.dart`, so one book can sit in
  /// several subjects.
  final String id;

  final String title;
  final String author;
  final String edition;

  /// Licence of the source text, e.g. 'Public domain' or 'CC BY-NC-SA 4.0'.
  /// Never claim a licence the source does not have.
  final String license;

  /// Link to the licence text, when there is one.
  final String? licenseUrl;

  /// Who publishes the text, e.g. 'OpenStax'. Shown as the source of linked
  /// lessons.
  final String? publisher;

  /// Credit and scope note shown at the end of the course page, e.g. what is
  /// left out or where the text comes from.
  final String sourceNote;

  /// Put before section numbers, e.g. '§' for '§17'.
  final String sectionPrefix;

  /// Short description shown on the course card.
  final String description;

  /// Where the complete book can be read for free.
  final String? fullTextUrl;

  /// Prefix for lesson pages given as a bare page name, e.g.
  /// 'https://openstax.org/books/calculus-volume-1/pages/'.
  final String? webBase;

  final List<CourseChapter> chapters;

  /// Reading text for each lesson, keyed by [Lesson.id]. See
  /// `hardy_pure_mathematics_text.dart` for the format. Empty for courses
  /// whose lessons link to the publisher's pages.
  final Map<String, String> lessonTexts;

  const Course({
    required this.id,
    required this.title,
    required this.author,
    required this.edition,
    required this.license,
    required this.description,
    required this.chapters,
    required this.sourceNote,
    this.lessonTexts = const {},
    this.fullTextUrl,
    this.webBase,
    this.licenseUrl,
    this.publisher,
    this.sectionPrefix = '',
  });

  /// True when the lessons are read on the publisher's website, so they need
  /// an internet connection.
  bool get isOnline => lessonTexts.isEmpty;

  int get lessonCount => chapters.fold(0, (sum, c) => sum + c.lessons.length);

  /// Every lesson in reading order, with its chapter.
  List<({CourseChapter chapter, Lesson lesson})> get allLessons => [
        for (final c in chapters)
          for (final l in c.lessons) (chapter: c, lesson: l),
      ];

  String? textFor(Lesson lesson) => lessonTexts[lesson.id]?.trim();

  /// Full address of a linked lesson's page, or null for built-in text.
  String? urlFor(Lesson lesson) {
    final url = lesson.url;
    if (url == null) return null;
    return url.startsWith('https://') || webBase == null ? url : '$webBase$url';
  }

  /// A linked lesson as a result the in-app viewer can open and bookmark,
  /// carrying this course's source and licence.
  StudyResource resourceFor(Lesson lesson) {
    // Unnumbered lessons ('Introduction', 'Chapter summary') name their
    // chapter so the title makes sense on its own, e.g. in Saved.
    final chapter = chapters.firstWhere((c) => c.lessons.any((l) => l.id == lesson.id));
    final ref = lesson.sectionRef.isEmpty ? 'Ch. ${chapter.number} · ' : '$sectionPrefix${lesson.sectionRef} ';
    return StudyResource(
      id: '$id/${lesson.id}',
      title: '$ref${lesson.title}',
      source: publisher ?? title,
      license: license,
      licenseUrl: licenseUrl,
      type: ResourceType.article,
      url: urlFor(lesson)!,
      creator: author,
      description: title,
    );
  }
}
