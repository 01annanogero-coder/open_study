import 'dart:async';

import 'package:flutter/material.dart';
import '../data/course_catalog.dart';
import '../theme/app_theme.dart';

/// Landing screen: a search bar, a hero carousel, subject shortcuts and
/// hand-picked topics. Every tile just starts a normal search across the open
/// sources; nothing here is invented data (no ratings, lesson counts or
/// "trending" claims).
///
/// Background pictures are read from `assets/images/`. Until a file exists,
/// the matching slide or card falls back to a navy gradient with an icon.
class HomeScreen extends StatefulWidget {
  final void Function(String query) onSearch;
  final VoidCallback onOpenAbout;
  final VoidCallback onOpenSaved;
  final VoidCallback onOpenSearch;

  /// Opens a subject: its built-in lessons (if any) and its search results.
  final void Function(String name, String subjectId, String query) onOpenSubject;
  const HomeScreen({
    super.key,
    required this.onSearch,
    required this.onOpenAbout,
    required this.onOpenSaved,
    required this.onOpenSearch,
    required this.onOpenSubject,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _Subject {
  final String label;
  final String query;
  final IconData icon;
  const _Subject(this.label, this.query, this.icon);

  /// Name on one line, e.g. 'Computer Science'.
  String get name => label.replaceAll('\n', ' ');

  /// Matches [Course.subjectId], e.g. 'mathematics', 'computer-science'.
  String get id => name.toLowerCase().replaceAll(RegExp(r'[^a-z]+'), '-');
}

class _Slide {
  final String eyebrow;
  final String title;
  final String highlight;
  final String body;
  final List<(IconData, String)> sources;
  final String image;
  final (IconData, String, String) primary;
  final (IconData, String, String) secondary;
  const _Slide({
    required this.eyebrow,
    required this.title,
    required this.highlight,
    required this.body,
    required this.sources,
    required this.image,
    required this.primary,
    required this.secondary,
  });
}

class _Topic {
  final String title;
  final String category;
  final String query;
  final IconData icon;
  final String image;
  final List<(IconData, String)> formats;
  const _Topic(this.title, this.category, this.query, this.icon, this.image, this.formats);
}

const _subjects = <_Subject>[
  _Subject('Mathematics', 'mathematics', Icons.calculate_outlined),
  _Subject('Computer\nScience', 'computer science', Icons.code_rounded),
  _Subject('Business &\nEconomics', 'business economics', Icons.insights_rounded),
  _Subject('Health\nSciences', 'health sciences', Icons.medical_services_outlined),
  _Subject('Engineering', 'engineering', Icons.settings_outlined),
  _Subject('Languages', 'languages', Icons.menu_book_outlined),
  _Subject('Social\nSciences', 'social sciences', Icons.groups_outlined),
];

/// Shown in the "See all" sheet in addition to [_subjects].
const _moreSubjects = <_Subject>[
  _Subject('Physics', 'physics', Icons.bolt_outlined),
  _Subject('Chemistry', 'chemistry', Icons.science_outlined),
  _Subject('Biology', 'biology', Icons.biotech_outlined),
  _Subject('Geography', 'geography', Icons.public_rounded),
  _Subject('History', 'history', Icons.history_edu_outlined),
  _Subject('Law', 'law', Icons.gavel_rounded),
  _Subject('Education', 'education', Icons.school_outlined),
  _Subject('Agriculture', 'agriculture', Icons.agriculture_outlined),
  _Subject('Environment', 'environmental science', Icons.eco_outlined),
  _Subject('Arts & Design', 'art design', Icons.palette_outlined),
  _Subject('Music', 'music theory', Icons.music_note_outlined),
  _Subject('Psychology', 'psychology', Icons.psychology_outlined),
];

const _video = (Icons.play_circle_outline_rounded, 'Video');
const _notes = (Icons.sticky_note_2_outlined, 'Notes');
const _pdf = (Icons.picture_as_pdf_outlined, 'PDF');

const _slides = <_Slide>[
  _Slide(
    eyebrow: 'Your Goals. Our Resources.',
    title: 'Study smarter,\nnot ',
    highlight: 'harder.',
    body: 'Access free learning materials from 7 open sources — all in one place.',
    sources: [
      (Icons.smart_display_rounded, 'YouTube'),
      (Icons.language_rounded, 'Wikipedia'),
      (Icons.account_balance_outlined, 'Internet Archive'),
    ],
    image: 'assets/images/hero_1.jpg',
    primary: (Icons.menu_book_outlined, 'Browse Materials', ''),
    secondary: (Icons.play_circle_outline_rounded, 'Watch Tutorials', 'video tutorial'),
  ),
  _Slide(
    eyebrow: 'Open textbooks.',
    title: 'Whole books,\n',
    highlight: 'free to read.',
    body: 'Peer-reviewed textbooks and scanned classics you can open right in the app.',
    sources: [
      (Icons.auto_stories_outlined, 'OpenStax'),
      (Icons.account_balance_outlined, 'Internet Archive'),
    ],
    image: 'assets/images/hero_2.jpg',
    primary: (Icons.auto_stories_outlined, 'Find Textbooks', 'textbook'),
    secondary: (Icons.calculate_outlined, 'Maths Books', 'mathematics textbook'),
  ),
  _Slide(
    eyebrow: 'Research, open access.',
    title: 'Papers without\n',
    highlight: 'paywalls.',
    body: 'Search millions of open papers and journals for projects and revision.',
    sources: [
      (Icons.article_outlined, 'arXiv'),
      (Icons.hub_outlined, 'OpenAlex'),
      (Icons.library_books_outlined, 'DOAJ'),
    ],
    image: 'assets/images/hero_3.jpg',
    primary: (Icons.search_rounded, 'Find Papers', 'research paper'),
    secondary: (Icons.memory_rounded, 'AI Research', 'machine learning'),
  ),
];

const _topics = <_Topic>[
  _Topic('Python for Beginners', 'Programming', 'python programming beginners', Icons.terminal_rounded,
      'assets/images/topic_python.jpg', [_video, _notes]),
  _Topic('Calculus I', 'Mathematics', 'calculus', Icons.functions_rounded, 'assets/images/topic_calculus.jpg',
      [_pdf, _notes]),
  _Topic('Artificial Intelligence', 'Computer Science', 'artificial intelligence', Icons.memory_rounded,
      'assets/images/topic_ai.jpg', [_video, _pdf]),
  _Topic('Human Anatomy', 'Health Sciences', 'human anatomy', Icons.monitor_heart_outlined,
      'assets/images/topic_anatomy.jpg', [_pdf, _notes]),
  _Topic('Climate Science', 'Environment', 'climate change', Icons.eco_outlined, 'assets/images/topic_climate.jpg',
      [_video, _pdf]),
  _Topic('World History', 'History', 'world history', Icons.history_edu_outlined, 'assets/images/topic_history.jpg',
      [_notes, _video]),
];

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit(String text) {
    final q = text.trim();
    if (q.isEmpty) return;
    _controller.clear();
    widget.onSearch(q);
  }

  void _showAllSubjects() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: AppColors.background,
      builder: (ctx) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('All subjects', style: Theme.of(ctx).textTheme.headlineSmall),
              const SizedBox(height: 16),
              _SubjectGrid(
                subjects: const [..._subjects, ..._moreSubjects],
                onTap: (s) {
                  Navigator.pop(ctx);
                  widget.onOpenSubject(s.name, s.id, s.query);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const side = EdgeInsets.symmetric(horizontal: 20);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 24),
          children: [
            Padding(
              padding: side,
              child: _Header(onOpenAbout: widget.onOpenAbout, onOpenSaved: widget.onOpenSaved),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: side,
              child: TextField(
                controller: _controller,
                textInputAction: TextInputAction.search,
                onSubmitted: _submit,
                decoration: InputDecoration(
                  hintText: 'Search for study materials, topics or sources',
                  prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textPrimary),
                  suffixIcon: IconButton(
                    tooltip: 'Browse by subject',
                    icon: const Icon(Icons.tune_rounded, color: AppColors.textPrimary),
                    onPressed: _showAllSubjects,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            _HeroCarousel(
              onAction: (query) => query.isEmpty ? widget.onOpenSearch() : widget.onSearch(query),
            ),
            const SizedBox(height: 26),
            Padding(
              padding: side,
              child: _SectionTitle(title: 'Popular Subjects', action: 'See all', onAction: _showAllSubjects),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: side,
              child: _SubjectGrid(
                subjects: _subjects,
                onTap: (s) => widget.onOpenSubject(s.name, s.id, s.query),
                trailing: _SubjectTile(
                  label: 'More\nSubjects',
                  icon: Icons.grid_view_rounded,
                  onTap: _showAllSubjects,
                ),
              ),
            ),
            const SizedBox(height: 28),
            const Padding(
              padding: side,
              child: _SectionTitle(title: 'Recommended for you'),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 262,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: side,
                itemCount: _topics.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, i) => _TopicCard(
                  topic: _topics[i],
                  onTap: () => widget.onSearch(_topics[i].query),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: side,
              child: _SavedBanner(onTap: widget.onOpenSaved),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onOpenAbout;
  final VoidCallback onOpenSaved;
  const _Header({required this.onOpenAbout, required this.onOpenSaved});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        const Icon(Icons.school_rounded, size: 44, color: AppColors.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Open Study', style: theme.textTheme.headlineSmall?.copyWith(fontSize: 23, height: 1.1)),
              const SizedBox(height: 2),
              Text('Learn  •  Grow  •  Build your future',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13)),
            ],
          ),
        ),
        IconButton(
          tooltip: 'About, sources and licences',
          icon: const Icon(Icons.info_outline_rounded, size: 27, color: AppColors.primary),
          onPressed: onOpenAbout,
        ),
        IconButton(
          tooltip: 'Saved',
          icon: const Icon(Icons.bookmarks_outlined, size: 26, color: AppColors.primary),
          onPressed: onOpenSaved,
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onAction;
  const _SectionTitle({required this.title, this.action, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
        if (action != null)
          TextButton(
            onPressed: onAction,
            style: TextButton.styleFrom(foregroundColor: AppColors.textSecondary),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(action!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(width: 6),
                const Icon(Icons.arrow_forward_rounded, size: 18),
              ],
            ),
          ),
      ],
    );
  }
}

/// A navy card with an optional background picture, auto-advancing with dots.
class _HeroCarousel extends StatefulWidget {
  final void Function(String query) onAction;
  const _HeroCarousel({required this.onAction});

  @override
  State<_HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<_HeroCarousel> {
  final _pages = PageController();
  Timer? _timer;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 6), (_) {
      if (!_pages.hasClients) return;
      _pages.animateToPage((_page + 1) % _slides.length,
          duration: const Duration(milliseconds: 450), curve: Curves.easeOut);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 290,
          child: PageView.builder(
            controller: _pages,
            itemCount: _slides.length,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _HeroSlide(slide: _slides[i], onAction: widget.onAction),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < _slides.length; i++)
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: i == _page ? 18 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: i == _page ? AppColors.primary : AppColors.divider,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _HeroSlide extends StatelessWidget {
  final _Slide slide;
  final void Function(String query) onAction;
  const _HeroSlide({required this.slide, required this.onAction});

  @override
  Widget build(BuildContext context) {
    const white = Colors.white;
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            slide.image,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const _NavyFallback(icon: Icons.school_rounded, iconSize: 150),
          ),
          // Keeps the text readable over any picture.
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xE6141C4D), Color(0x80141C4D), Color(0x00141C4D)],
                stops: [0, 0.55, 1],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shrinks the text instead of overflowing on small screens or large text.
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, box) => FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: box.maxWidth,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(slide.eyebrow, style: const TextStyle(color: white, fontSize: 13.5)),
                            const SizedBox(height: 6),
                            Text.rich(
                              TextSpan(
                                style: const TextStyle(
                                    color: white, fontSize: 29, fontWeight: FontWeight.w800, height: 1.12),
                                children: [
                                  TextSpan(text: slide.title),
                                  TextSpan(text: slide.highlight, style: const TextStyle(color: AppColors.gold)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 250,
                              child: Text(slide.body,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: white, fontSize: 13, height: 1.4)),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                for (final (icon, name) in slide.sources) ...[
                                  Icon(icon, size: 17, color: white),
                                  const SizedBox(width: 5),
                                  Flexible(
                                    child: Text(name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            const TextStyle(color: white, fontSize: 12.5, fontWeight: FontWeight.w500)),
                                  ),
                                  const SizedBox(width: 14),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => onAction(slide.primary.$3),
                        icon: Icon(slide.primary.$1, size: 20),
                        label: Text(slide.primary.$2, maxLines: 1, overflow: TextOverflow.ellipsis),
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.cream,
                          foregroundColor: AppColors.primary,
                          minimumSize: const Size.fromHeight(46),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => onAction(slide.secondary.$3),
                        icon: Icon(slide.secondary.$1, size: 20),
                        label: Text(slide.secondary.$2, maxLines: 1, overflow: TextOverflow.ellipsis),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: white,
                          side: const BorderSide(color: white, width: 1.3),
                          minimumSize: const Size.fromHeight(46),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Stand-in for a missing background picture.
class _NavyFallback extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  const _NavyFallback({required this.icon, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryDark, AppColors.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Align(
        alignment: const Alignment(0.9, -0.3),
        child: Icon(icon, size: iconSize, color: Colors.white.withValues(alpha: 0.14)),
      ),
    );
  }
}

class _SubjectGrid extends StatelessWidget {
  final List<_Subject> subjects;
  final void Function(_Subject) onTap;
  final Widget? trailing;
  const _SubjectGrid({required this.subjects, required this.onTap, this.trailing});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.82,
      children: [
        for (final s in subjects)
          _SubjectTile(
            label: s.label,
            icon: s.icon,
            hasLessons: coursesForSubject(s.id).isNotEmpty,
            onTap: () => onTap(s),
          ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class _SubjectTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  /// Shows a small book badge when the subject has built-in lessons.
  final bool hasLessons;
  const _SubjectTile({required this.label, required this.icon, required this.onTap, this.hasLessons = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.tint,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, size: 32, color: AppColors.primary),
                    const SizedBox(height: 10),
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12, height: 1.25, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
                    ),
                  ],
                ),
              ),
            ),
            if (hasLessons)
              const Positioned(
                top: 6,
                right: 6,
                child: Tooltip(
                  message: 'Has built-in lessons',
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: AppColors.gold,
                    child: Icon(Icons.menu_book_rounded, size: 11, color: AppColors.primary),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _TopicCard extends StatelessWidget {
  final _Topic topic;
  final VoidCallback onTap;
  const _TopicCard({required this.topic, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        elevation: 1.5,
        shadowColor: const Color(0x331F2A6B),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 92,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      topic.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _NavyFallback(icon: topic.icon, iconSize: 64),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.lock_open_rounded, size: 13, color: AppColors.primary),
                            SizedBox(width: 4),
                            Text('Open sources',
                                style: TextStyle(
                                    fontSize: 10.5, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        topic.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                      ),
                      const SizedBox(height: 4),
                      Text(topic.category, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          for (final (icon, label) in topic.formats) ...[
                            _FormatChip(icon: icon, label: label),
                            const SizedBox(width: 6),
                          ],
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Expanded(
                            child: Text('Free',
                                style:
                                    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                          ),
                          FilledButton(
                            onPressed: onTap,
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              minimumSize: const Size(80, 34),
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            child: const Text('View'),
                          ),
                        ],
                      ),
                    ],
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

class _FormatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FormatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.tint,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.textPrimary),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

/// Points to Saved; replaces the design's "Get more with an account" banner,
/// since Open Study has no accounts.
class _SavedBanner extends StatelessWidget {
  final VoidCallback onTap;
  const _SavedBanner({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFEDEFFA),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.fromLTRB(14, 12, 10, 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Color(0xFFDCE0F5),
                child: Icon(Icons.bookmark_added_outlined, color: AppColors.primary),
              ),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Keep what you find',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                    SizedBox(height: 2),
                    Text('Bookmark materials and see recent searches. Saved only on this phone, no account needed.',
                        style: TextStyle(fontSize: 11.5, height: 1.35, color: AppColors.textSecondary)),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: AppColors.textPrimary),
            ],
          ),
        ),
      ),
    );
  }
}
