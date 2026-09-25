import 'package:flutter/material.dart';
import '../models/course.dart';
import '../services/local_store.dart';
import '../theme/app_theme.dart';
import '../widgets/lesson_text.dart';

/// Reads one lesson of a built-in course, with previous/next buttons to move
/// through the whole course in order.
class LessonScreen extends StatefulWidget {
  final Course course;
  final LocalStore store;

  /// Position in [Course.allLessons].
  final int index;

  const LessonScreen({super.key, required this.course, required this.store, required this.index});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late final _lessons = widget.course.allLessons;
  late int _index = widget.index.clamp(0, _lessons.length - 1);
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _remember();
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _remember() => widget.store.setLastLesson(widget.course.id, _lessons[_index].lesson.id);

  void _go(int delta) {
    setState(() => _index += delta);
    _remember();
    if (_scroll.hasClients) _scroll.jumpTo(0);
  }

  @override
  Widget build(BuildContext context) {
    final entry = _lessons[_index];
    final lesson = entry.lesson;
    final chapter = entry.chapter;
    final text = widget.course.textFor(lesson);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF8),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        titleSpacing: 0,
        title: Text(
          'Chapter ${chapter.number} · Lesson ${_index + 1} of ${_lessons.length}',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        controller: _scroll,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
        children: [
          Text(chapter.title.toUpperCase(),
              style: const TextStyle(
                  fontSize: 11.5, letterSpacing: 0.8, fontWeight: FontWeight.w700, color: AppColors.primaryLight)),
          const SizedBox(height: 6),
          Text(lesson.title,
              style: const TextStyle(
                  fontSize: 23, fontWeight: FontWeight.w800, color: AppColors.textPrimary, height: 1.25)),
          const SizedBox(height: 6),
          Text(
              [
                if (lesson.sectionRef.isNotEmpty) '${widget.course.sectionPrefix}${lesson.sectionRef}',
                if (lesson.page != null) 'page ${lesson.page}',
              ].join(' · '),
              style: const TextStyle(fontSize: 12.5, color: AppColors.textSecondary)),
          const SizedBox(height: 14),
          if (lesson.summary.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.tint,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.lightbulb_outline_rounded, size: 18, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(lesson.summary,
                        style: const TextStyle(fontSize: 13.5, height: 1.45, color: AppColors.textPrimary)),
                  ),
                ],
              ),
            ),
          if (lesson.highlights.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final h in lesson.highlights)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.gold.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.gold.withValues(alpha: 0.45)),
                    ),
                    child: Text(h,
                        style: const TextStyle(fontSize: 11.5, color: AppColors.primary, fontWeight: FontWeight.w600)),
                  ),
              ],
            ),
          ],
          const SizedBox(height: 20),
          const Divider(height: 1, color: AppColors.divider),
          const SizedBox(height: 20),
          if (text == null || text.isEmpty)
            const Text('The text for this lesson is not available yet.',
                style: TextStyle(color: AppColors.textSecondary))
          else
            LessonText(text),
          const SizedBox(height: 8),
          Text(
            'From ${widget.course.author}, "${widget.course.title}" (${widget.course.edition}), '
            '${widget.course.license.toLowerCase()}. Examples, figures and footnotes are left out.',
            style: const TextStyle(fontSize: 11.5, fontStyle: FontStyle.italic, color: AppColors.textSecondary),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _index > 0 ? () => _go(-1) : null,
                  icon: const Icon(Icons.arrow_back_rounded, size: 18),
                  label: const Text('Previous'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    minimumSize: const Size.fromHeight(46),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _index < _lessons.length - 1 ? () => _go(1) : null,
                  icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                  label: const Text('Next'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size.fromHeight(46),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
