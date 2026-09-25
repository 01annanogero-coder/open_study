import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_info.dart';
import '../data/course_catalog.dart';
import '../services/local_store.dart';
import '../services/update_manager.dart';
import '../theme/app_theme.dart';
import '../widgets/update_dialog.dart';

/// Explains where results come from, the terms they are shared under, and how
/// the app treats the student's privacy.
class AboutScreen extends StatelessWidget {
  final LocalStore store;

  /// The app's updater; null in tests, in which case "Check now" makes one.
  final UpdateManager? updates;

  const AboutScreen({super.key, required this.store, this.updates});

  static const _sources = <_SourceInfo>[
    _SourceInfo(
      'Internet Archive',
      'Only items whose uploader chose a Creative Commons or public-domain licence. Each item keeps its own licence, shown on the result.',
      'https://archive.org',
    ),
    _SourceInfo(
      'Wikipedia',
      'Text is available under CC BY-SA 4.0. Authors are credited in each article\'s history.',
      'https://en.wikipedia.org',
    ),
    _SourceInfo(
      'OpenStax',
      'Free textbooks from Rice University. Each book states its own Creative Commons licence, shown on the result.',
      'https://openstax.org',
    ),
    _SourceInfo(
      'OpenAlex',
      'Open-access research whose licence is a Creative Commons or public-domain licence. Search data from OpenAlex is CC0.',
      'https://openalex.org',
    ),
    _SourceInfo(
      'arXiv',
      'Free-to-read research papers. Authors choose their own terms, so this app does not claim a licence for them. Thank you to arXiv for use of its open access interoperability.',
      'https://arxiv.org',
    ),
    _SourceInfo(
      'DOAJ',
      'Articles from open-access journals. Check each article for its exact licence.',
      'https://doaj.org',
    ),
    _SourceInfo(
      'YouTube (Creative Commons)',
      'Only videos their creators published under the Creative Commons Attribution licence, played with YouTube\'s official player. Uses YouTube API Services.',
      'https://www.youtube.com',
    ),
  ];

  static List<({String title, String subtitle, String url})> _lessonSources() {
    final openstax = allCourses.where((c) => c.publisher == 'OpenStax').toList();
    final licences = {for (final c in openstax) c.license}.join(' or ');
    return [
      if (openstax.isNotEmpty)
        (
          title: 'OpenStax, Rice University',
          subtitle: '${openstax.length} free textbooks, licensed $licences (shown on each course). '
              'Each lesson opens its section on openstax.org. Access for free at openstax.org.',
          url: 'https://openstax.org',
        ),
      for (final c in allCourses.where((c) => c.publisher != 'OpenStax'))
        (
          title: '${c.title}, ${c.author}',
          subtitle: '${c.edition}. ${c.license}. ${c.sourceNote}',
          url: c.fullTextUrl ?? c.licenseUrl ?? '',
        ),
    ];
  }

  /// Looks for a newer version now and downloads it, showing progress, then
  /// offers to install it.
  Future<void> _checkNow(BuildContext context) async {
    final updates = this.updates ?? UpdateManager(store: store);
    final progress = ValueNotifier<double?>(null);
    final navigator = Navigator.of(context);
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('Checking for updates'),
        content: ValueListenableBuilder<double?>(
          valueListenable: progress,
          builder: (_, p, __) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(p == null ? 'Asking GitHub for the latest version…' : 'Downloading… ${(p * 100).round()}%'),
              const SizedBox(height: 14),
              LinearProgressIndicator(value: p),
            ],
          ),
        ),
      ),
    );
    final result = await updates.checkNow(onProgress: (p) => progress.value = p);
    navigator.pop();
    if (!context.mounted) return;
    if (result.update == null && !result.failed) {
      showUpToDate(context);
    } else if (result.failed || updates.ready == null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(const SnackBar(content: Text('Could not download the update. Check your connection and try again.')));
    } else {
      await showReadyToInstall(context, updates);
    }
  }

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Open Study'),
        titleTextStyle: theme.textTheme.headlineSmall,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('What this app is', style: theme.textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(
            'Open Study is a search tool with a small library of built-in lessons. '
            'Search results are links to the original provider, opened as the provider serves it; the app does not host, copy or resell them. '
            'The app does not remove paywalls, log-in walls or adverts, and does not download or re-share videos or files. '
            'The lessons come from free textbooks: public-domain books are included in the app and work offline, '
            'and openly licensed books open each section on the publisher\'s own website.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Text('Where results come from', style: theme.textTheme.titleMedium),
          const SizedBox(height: 6),
          for (final s in _sources)
            Card(
              child: ListTile(
                title: Text(s.name),
                subtitle: Text(s.description),
                trailing: const Icon(Icons.open_in_new_rounded, size: 18),
                onTap: () => _open(s.url),
              ),
            ),
          const SizedBox(height: 20),
          Text('Lessons', style: theme.textTheme.titleMedium),
          const SizedBox(height: 6),
          // One card per publisher (OpenStax has many books); single books
          // from other sources get their own card.
          for (final group in _lessonSources())
            Card(
              child: ListTile(
                title: Text(group.title),
                subtitle: Text(group.subtitle),
                trailing: const Icon(Icons.open_in_new_rounded, size: 18),
                onTap: () => _open(group.url),
              ),
            ),
          const SizedBox(height: 20),
          Text('Using and crediting material', style: theme.textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(
            'The licence shown on each result comes from the provider. Read the licence before you copy, share or adapt anything, and credit the author as the licence requires. '
            'Some open licences forbid commercial use or changes. If a result seems wrongly licensed, please tell the provider that hosts it, because that is where the content lives.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Text('Privacy', style: theme.textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(
            'Open Study has no accounts, no servers and no analytics. '
            'Your saved results and recent searches are kept only on this phone, and you can clear them any time from the Saved tab. '
            'When you search, your device sends the search words directly to the providers above, which can see your IP address and your search words under their own privacy policies. '
            'Videos are played by YouTube, which is subject to the YouTube Terms of Service and the Google Privacy Policy. '
            'If automatic updates are on, the app asks GitHub about once a day for the latest version and downloads new versions from GitHub; '
            'GitHub can see your IP address under its own privacy policy. Downloads are checked against the release\'s published checksum before they are installed.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              TextButton(
                onPressed: () => _open('https://www.youtube.com/t/terms'),
                child: const Text('YouTube Terms of Service'),
              ),
              TextButton(
                onPressed: () => _open('https://policies.google.com/privacy'),
                child: const Text('Google Privacy Policy'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('Updates', style: theme.textTheme.titleMedium),
          const SizedBox(height: 6),
          ListenableBuilder(
            listenable: store,
            builder: (context, _) => Card(
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Update automatically'),
                    subtitle: const Text('Download new versions and install them when you leave the app'),
                    value: store.checkForUpdates,
                    onChanged: store.setCheckForUpdates,
                  ),
                  SwitchListTile(
                    title: const Text('Download on Wi-Fi only'),
                    subtitle: const Text('Don\'t use mobile data for updates'),
                    value: store.updateOnWifiOnly,
                    onChanged: store.checkForUpdates ? store.setUpdateOnWifiOnly : null,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text('This is version $appVersion.', style: theme.textTheme.bodyMedium),
              ),
              TextButton.icon(
                onPressed: () => _checkNow(context),
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('Check now'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Search results are provided for study and are not legal, academic or professional advice.',
            style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _SourceInfo {
  final String name;
  final String description;
  final String url;
  const _SourceInfo(this.name, this.description, this.url);
}
