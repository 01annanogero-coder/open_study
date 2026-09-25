import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/course.dart';
import '../services/local_store.dart';
import '../theme/app_theme.dart';
import 'document_viewer_screen.dart';
import 'lesson_screen.dart';

/// A built-in course: its chapters, each opening to show its lessons.
class CourseScreen extends StatelessWidget {
  final Course course;
  final LocalStore store;
  const CourseScreen({super.key, required this.course, required this.store});

  void _openLesson(BuildContext context, int index) {
    final lesson = course.allLessons[index].lesson;
    final Widget screen;
    if (course.isOnline && lesson.url != null) {
      // Online courses: the publisher's own page, with source and licence.
      store.setLastLesson(course.id, lesson.id);
      screen = DocumentViewerScreen(resource: course.resourceFor(lesson), store: store);
    } else {
      screen = LessonScreen(course: course, store: store, index: index);
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final lessons = course.allLessons;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            pinned: true,
            expandedHeight: 176,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsetsDirectional.only(start: 56, bottom: 14, end: 16),
              title: Text(
                course.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
              ),
              background: DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primaryDark, AppColors.primaryLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 72, 20, 44),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '${course.author} · ${course.edition}\n'
                      '${course.chapters.length} chapters · ${course.lessonCount} lessons · ${course.license}',
                      style: const TextStyle(color: Colors.white70, fontSize: 12.5, height: 1.45),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(course.description,
                  style: const TextStyle(fontSize: 13.5, height: 1.45, color: AppColors.textPrimary)),
            ),
          ),
          SliverToBoxAdapter(
            child: ListenableBuilder(
              listenable: store,
              builder: (context, _) {
                final lastId = store.lastLesson(course.id);
                final i = lastId == null ? -1 : lessons.indexWhere((e) => e.lesson.id == lastId);
                final resume = i < 0 ? 0 : i;
                final e = lessons[resume];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: FilledButton.icon(
                    onPressed: () => _openLesson(context, resume),
                    icon: Icon(i < 0 ? Icons.play_arrow_rounded : Icons.bookmark_rounded),
                    label: Text(
                      i < 0 ? 'Start with lesson 1' : 'Continue: ${_ref(course, e.lesson)}${e.lesson.title}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            sliver: SliverList.separated(
              itemCount: course.chapters.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) => _ChapterCard(
                course: course,
                chapter: course.chapters[i],
                onOpen: (lesson) => _openLesson(context, lessons.indexWhere((e) => e.lesson.id == lesson.id)),
              ),
            ),
          ),
          SliverToBoxAdapter(child: _SourceNote(course: course)),
        ],
      ),
    );
  }
}

/// '§17 ' or '1.1 ', or nothing for unnumbered lessons such as introductions.
String _ref(Course course, Lesson lesson) =>
    lesson.sectionRef.isEmpty ? '' : '${course.sectionPrefix}${lesson.sectionRef} ';

class _ChapterCard extends StatefulWidget {
  final Course course;
  final CourseChapter chapter;
  final void Function(Lesson) onOpen;
  const _ChapterCard({required this.course, required this.chapter, required this.onOpen});

  @override
  State<_ChapterCard> createState() => _ChapterCardState();
}

class _ChapterCardState extends State<_ChapterCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final chapter = widget.chapter;
    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: AppColors.divider),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10)),
                    child: Text(chapter.number,
                        style: const TextStyle(color: AppColors.gold, fontWeight: FontWeight.w800, fontSize: 14)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(chapter.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14.5, color: AppColors.textPrimary)),
                        const SizedBox(height: 2),
                        Text(
                            [
                              '${chapter.lessons.length} lessons',
                              if (chapter.pageRange.isNotEmpty) 'pp. ${chapter.pageRange}',
                            ].join(' · '),
                            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      ],
                    ),
                  ),
                  Icon(_expanded ? Icons.expand_less_rounded : Icons.expand_more_rounded,
                      color: AppColors.textSecondary),
                ],
              ),
            ),
          ),
          if (_expanded) ...[
            const Divider(height: 1, color: AppColors.divider),
            if (chapter.overview.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 6),
                child: Text(chapter.overview,
                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.45)),
              ),
            for (final lesson in chapter.lessons)
              _LessonRow(course: widget.course, lesson: lesson, onTap: () => widget.onOpen(lesson)),
            const SizedBox(height: 6),
          ],
        ],
      ),
    );
  }
}

class _LessonRow extends StatelessWidget {
  final Course course;
  final Lesson lesson;
  final VoidCallback onTap;
  const _LessonRow({required this.course, required this.lesson, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 52,
              child: Text('${course.sectionPrefix}${lesson.sectionRef}',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primaryLight)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lesson.title,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  if (lesson.summary.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(lesson.summary,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.35)),
                  ],
                ],
              ),
            ),
            Icon(course.isOnline ? Icons.language_rounded : Icons.chevron_right_rounded,
                size: course.isOnline ? 17 : 20, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}

/// Credits the book and points to where the complete text can be read.
class _SourceNote extends StatelessWidget {
  final Course course;
  const _SourceNote({required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${course.title}, ${course.author} (${course.edition}). ${course.sourceNote}',
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.45),
          ),
          if (course.licenseUrl != null)
            TextButton.icon(
              onPressed: () => launchUrl(Uri.parse(course.licenseUrl!), mode: LaunchMode.externalApplication),
              icon: const Icon(Icons.gavel_rounded, size: 16),
              label: Text('Licence: ${course.license}'),
            ),
          if (course.fullTextUrl != null)
            TextButton.icon(
              onPressed: () => launchUrl(Uri.parse(course.fullTextUrl!), mode: LaunchMode.externalApplication),
              icon: const Icon(Icons.open_in_new_rounded, size: 16),
              label: Text('The complete book, free at ${Uri.parse(course.fullTextUrl!).host}'),
            ),
        ],
      ),
    );
  }
}
