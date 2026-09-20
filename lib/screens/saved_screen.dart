import 'package:flutter/material.dart';
import '../models/study_resource.dart';
import '../services/local_store.dart';
import '../theme/app_theme.dart';
import '../widgets/resource_card.dart';
import 'open_resource.dart';

/// Bookmarks and recent searches. Everything here is stored only on this phone.
class SavedScreen extends StatelessWidget {
  final LocalStore store;
  final void Function(String query) onSearch;
  const SavedScreen({super.key, required this.store, required this.onSearch});

  Future<void> _confirmClear(
    BuildContext context, {
    required String title,
    required String message,
    required Future<void> Function() onConfirm,
  }) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Clear')),
        ],
      ),
    );
    if (ok == true) await onConfirm();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
        titleTextStyle: theme.textTheme.headlineSmall,
      ),
      body: ListenableBuilder(
        listenable: store,
        builder: (context, _) {
          final saved = store.saved;
          final recent = store.recentSearches;
          return ListView(
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: Row(
                  children: [
                    const Icon(Icons.lock_outline_rounded, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Stored only on this phone. Nothing is sent anywhere.',
                        style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12.5),
                      ),
                    ),
                  ],
                ),
              ),
              _SectionHeader(
                title: 'Recent searches',
                actionLabel: recent.isEmpty ? null : 'Clear',
                onAction: () => _confirmClear(
                  context,
                  title: 'Clear recent searches?',
                  message: 'This removes your search history from this phone.',
                  onConfirm: store.clearRecentSearches,
                ),
              ),
              if (recent.isEmpty)
                const _Hint('Words you search for will appear here.')
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      for (final q in recent)
                        InputChip(
                          label: Text(q),
                          labelStyle: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          backgroundColor: AppColors.surface,
                          avatar: const Icon(Icons.history_rounded, size: 18),
                          onPressed: () => onSearch(q),
                          onDeleted: () => store.removeRecentSearch(q),
                          deleteIconColor: AppColors.textSecondary,
                        ),
                    ],
                  ),
                ),
              const SizedBox(height: 16),
              _SectionHeader(
                title: 'Bookmarks',
                actionLabel: saved.isEmpty ? null : 'Clear all',
                onAction: () => _confirmClear(
                  context,
                  title: 'Remove all bookmarks?',
                  message: 'This removes every saved result from this phone.',
                  onConfirm: store.clearSaved,
                ),
              ),
              if (saved.isEmpty)
                const _Hint('Tap the bookmark icon on a result to keep it here.')
              else
                for (final StudyResource r in saved)
                  Dismissible(
                    key: ValueKey(r.url),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 28),
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.pdfBadge.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.delete_outline_rounded, color: AppColors.pdfBadge),
                    ),
                    onDismissed: (_) => store.toggleSaved(r),
                    child: ResourceCard(
                      resource: r,
                      onTap: () => openResource(context, r, store),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback onAction;
  const _SectionHeader({required this.title, required this.actionLabel, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 12, 4),
      child: Row(
        children: [
          Expanded(child: Text(title, style: Theme.of(context).textTheme.titleMedium)),
          if (actionLabel != null) TextButton(onPressed: onAction, child: Text(actionLabel!)),
        ],
      ),
    );
  }
}

class _Hint extends StatelessWidget {
  final String text;
  const _Hint(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
      child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
