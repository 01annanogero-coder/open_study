import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

/// Explains where results come from, the terms they are shared under, and how
/// the app treats the student's privacy.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('About Open Study')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('What this app is', style: theme.textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(
            'Open Study is a search tool. It does not host, copy or resell any material. '
            'Every result is a link to the original provider, opened as the provider serves it. '
            'The app does not remove paywalls, log-in walls or adverts, and does not download or re-share videos or files.',
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
            'Open Study has no accounts, no servers and no analytics, and it does not store your searches. '
            'When you search, your device sends the search words directly to the providers above, which can see your IP address and your search words under their own privacy policies. '
            'Videos are played by YouTube, which is subject to the YouTube Terms of Service and the Google Privacy Policy.',
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
