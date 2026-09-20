import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Landing screen: a search bar, subject shortcuts and hand-picked topics.
/// Every tile just starts a normal search across the open sources; nothing here
/// is invented data (no ratings, lesson counts or "trending" claims).
class HomeScreen extends StatefulWidget {
  final void Function(String query) onSearch;
  final VoidCallback onOpenAbout;
  const HomeScreen({super.key, required this.onSearch, required this.onOpenAbout});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _Subject {
  final String label;
  final String query;
  final IconData icon;
  const _Subject(this.label, this.query, this.icon);
}

class _Topic {
  final String title;
  final String query;
  final IconData icon;
  const _Topic(this.title, this.query, this.icon);
}

const _subjects = <_Subject>[
  _Subject('Mathematics', 'mathematics', Icons.calculate_rounded),
  _Subject('Sciences', 'science', Icons.science_rounded),
  _Subject('Technology', 'technology', Icons.laptop_chromebook_rounded),
  _Subject('Engineering', 'engineering', Icons.settings_rounded),
  _Subject('Geography', 'geography', Icons.public_rounded),
  _Subject('Business', 'business', Icons.bar_chart_rounded),
];

const _topics = <_Topic>[
  _Topic('Artificial Intelligence', 'artificial intelligence', Icons.memory_rounded),
  _Topic('Human Brain', 'neuroscience brain', Icons.psychology_rounded),
  _Topic('Climate Science', 'climate change', Icons.eco_rounded),
  _Topic('Software Engineering', 'software engineering', Icons.code_rounded),
  _Topic('Data Science', 'data science', Icons.query_stats_rounded),
  _Topic('World History', 'world history', Icons.history_edu_rounded),
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            Row(
              children: [
                const Icon(Icons.school_rounded, size: 36, color: AppColors.primary),
                const SizedBox(width: 10),
                Text.rich(
                  TextSpan(
                    style: theme.textTheme.headlineSmall?.copyWith(fontSize: 28),
                    children: const [
                      TextSpan(text: 'Open '),
                      TextSpan(text: 'Study', style: TextStyle(color: AppColors.primary)),
                    ],
                  ),
                ),
                const Spacer(),
                Material(
                  color: AppColors.tint,
                  shape: const CircleBorder(),
                  child: IconButton(
                    tooltip: 'About, sources and licences',
                    icon: const Icon(Icons.info_outline_rounded, color: AppColors.primary),
                    onPressed: widget.onOpenAbout,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Text('Welcome', style: theme.textTheme.headlineSmall),
                const SizedBox(width: 8),
                const Icon(Icons.waving_hand_rounded, color: Color(0xFFF2B233), size: 26),
              ],
            ),
            const SizedBox(height: 4),
            Text('What would you like to learn today?', style: theme.textTheme.headlineMedium),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              onSubmitted: _submit,
              decoration: InputDecoration(
                hintText: 'Search for topics, books, videos...',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: IconButton(
                  tooltip: 'Search',
                  icon: const Icon(Icons.arrow_forward_rounded),
                  onPressed: () => _submit(_controller.text),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Text('Explore subjects', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 14),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.92,
              children: [
                for (final s in _subjects)
                  _SubjectTile(subject: s, onTap: () => widget.onSearch(s.query)),
              ],
            ),
            const SizedBox(height: 28),
            Text('Popular starting points', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 14),
            SizedBox(
              height: 240,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _topics.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, i) => _TopicCard(
                  topic: _topics[i],
                  onTap: () => widget.onSearch(_topics[i].query),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubjectTile extends StatelessWidget {
  final _Subject subject;
  final VoidCallback onTap;
  const _SubjectTile({required this.subject, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: AppColors.divider),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.tint,
                child: Icon(subject.icon, size: 32, color: AppColors.primary),
              ),
              const SizedBox(height: 10),
              Text(
                subject.label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14),
              ),
            ],
          ),
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
    final theme = Theme.of(context);
    return SizedBox(
      width: 230,
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: AppColors.divider),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 88,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [AppColors.tint, Color(0xFFDCD6FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Icon(topic.icon, size: 52, color: AppColors.primary),
                ),
                const SizedBox(height: 10),
                Text(
                  topic.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium?.copyWith(fontSize: 17, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 2),
                Text('Free books, papers and videos', maxLines: 1, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12.5)),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  decoration: BoxDecoration(
                    color: AppColors.tint,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Explore',
                          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward_rounded, size: 18, color: AppColors.primary),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
