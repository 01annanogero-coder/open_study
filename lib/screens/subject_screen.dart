import 'package:flutter/material.dart';
import '../data/course_catalog.dart';
import '../models/course.dart';
import '../services/local_store.dart';
import '../theme/app_theme.dart';
import 'course_screen.dart';
import 'search_screen.dart';

/// A subject from Home. Two ways to study it: the built-in lessons, and live
/// results from the open sources. The search only runs once its tab is opened.
class SubjectScreen extends StatelessWidget {
  final LocalStore store;
  final String title;
  final String subjectId;

  /// Words searched for on the "Search results" tab.
  final String query;

  const SubjectScreen({
    super.key,
    required this.store,
    required this.title,
    required this.subjectId,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          titleTextStyle: Theme.of(context).textTheme.headlineSmall,
          bottom: const TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.gold,
            indicatorWeight: 3,
            labelStyle: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w700),
            tabs: [
              Tab(icon: Icon(Icons.menu_book_rounded, size: 20), text: 'Lessons', iconMargin: EdgeInsets.only(bottom: 2)),
              Tab(icon: Icon(Icons.travel_explore_rounded, size: 20), text: 'Search results', iconMargin: EdgeInsets.only(bottom: 2)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _ShelfList(shelves: shelvesForSubject(subjectId), store: store),
            SearchScreen(store: store, initialQuery: query, embedded: true),
          ],
        ),
      ),
    );
  }
}

/// The subject's courses, grouped into shelves, with chips to show one shelf.
class _ShelfList extends StatefulWidget {
  final List<Shelf> shelves;
  final LocalStore store;
  const _ShelfList({required this.shelves, required this.store});

  @override
  State<_ShelfList> createState() => _ShelfListState();
}

class _ShelfListState extends State<_ShelfList> {
  /// Shelf shown on its own, or null for all.
  String? _only;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shelves = widget.shelves;
    final shown = _only == null ? shelves : shelves.where((s) => s.title == _only).toList();
    final total = {for (final s in shelves) ...s.courses}.length;
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
          child: Text(
            '$total free textbooks, organised into lessons.',
            style: theme.textTheme.bodyMedium,
          ),
        ),
        if (shelves.length > 1)
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: shelves.length + 1,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final label = i == 0 ? 'All' : shelves[i - 1].title;
                final selected = i == 0 ? _only == null : _only == label;
                return ChoiceChip(
                  label: Text(label),
                  selected: selected,
                  showCheckmark: false,
                  labelStyle: TextStyle(color: selected ? Colors.white : AppColors.textPrimary),
                  onSelected: (_) => setState(() => _only = i == 0 ? null : label),
                );
              },
            ),
          ),
        for (final shelf in shown) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(shelf.title,
                      style: theme.textTheme.titleMedium?.copyWith(fontSize: 17, fontWeight: FontWeight.w800)),
                ),
                Text('${shelf.courses.length} ${shelf.courses.length == 1 ? 'book' : 'books'}',
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12.5)),
              ],
            ),
          ),
          for (final c in shelf.courses)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: CourseCard(course: c, store: widget.store),
            ),
        ],
      ],
    );
  }
}

/// One course: title, authors, size, licence and whether it needs internet.
/// Opens the course page; shows "Continue" once reading has started.
class CourseCard extends StatelessWidget {
  final Course course;
  final LocalStore store;
  const CourseCard({super.key, required this.course, required this.store});

  @override
  Widget build(BuildContext context) {
    final host = course.isOnline ? Uri.parse(course.urlFor(course.allLessons.first.lesson)!).host : null;
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => CourseScreen(course: course, store: store)),
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.divider),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // A small book cover: navy with a gold spine.
              Container(
                width: 46,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(6),
                  border: const Border(left: BorderSide(color: AppColors.gold, width: 5)),
                ),
                child: const Icon(Icons.auto_stories_rounded, color: Colors.white70, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course.title,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.textPrimary, height: 1.25)),
                    const SizedBox(height: 3),
                    Text(course.author,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        _Tag(Icons.list_alt_rounded, '${course.chapters.length} ch · ${course.lessonCount} lessons'),
                        _Tag(Icons.gavel_rounded, course.license),
                        _Tag(course.isOnline ? Icons.language_rounded : Icons.offline_pin_rounded,
                            course.isOnline ? host! : 'Offline'),
                      ],
                    ),
                  ],
                ),
              ),
              ListenableBuilder(
                listenable: store,
                builder: (context, _) => store.lastLesson(course.id) == null
                    ? const Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: Icon(Icons.chevron_right_rounded, color: AppColors.textSecondary),
                      )
                    : Container(
                        margin: const EdgeInsets.only(top: 14, left: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: AppColors.cream, borderRadius: BorderRadius.circular(8)),
                        child: const Text('Continue',
                            style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: AppColors.primary)),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Tag(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: AppColors.tint, borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: AppColors.textSecondary),
          const SizedBox(width: 4),
          Flexible(
            child: Text(label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
          ),
        ],
      ),
    );
  }
}
