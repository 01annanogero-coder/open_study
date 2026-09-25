import 'package:flutter/material.dart';
import '../app_info.dart';
import '../services/update_manager.dart';

/// First launch after an automatic update.
void showUpdated(BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(const SnackBar(content: Text('Open Study was updated to version $appVersion.')));
}

/// An update is downloaded but Android needs the student to confirm it.
Future<void> showReadyToInstall(BuildContext context, UpdateManager updates) {
  final version = updates.ready?.version ?? '';
  return showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      icon: const Icon(Icons.system_update_rounded),
      title: Text('Open Study $version is ready'),
      content: const Text(
        'The update is downloaded and checked. Tap Install, then confirm. '
        'Your bookmarks and recent searches are kept.',
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Later')),
        FilledButton(
          onPressed: () {
            Navigator.pop(ctx);
            updates.installNow();
          },
          child: const Text('Install'),
        ),
      ],
    ),
  );
}

/// Explains the one-time "Install unknown apps" permission that lets updates
/// install by themselves.
Future<void> showAllowAutoUpdates(BuildContext context, UpdateManager updates) {
  final version = updates.ready?.version ?? '';
  return showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      icon: const Icon(Icons.system_update_rounded),
      title: Text('Open Study $version is ready'),
      content: const Text(
        'To install updates by itself when you leave the app, Open Study needs the '
        '"Install unknown apps" permission. Android asks for this once. '
        'Open Study only ever installs its own updates, signed with its own key.',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(ctx);
            updates.installNow();
          },
          child: const Text('Install once'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(ctx);
            updates.platform.openInstallSettings();
          },
          child: const Text('Allow'),
        ),
      ],
    ),
  );
}

/// Shown after a manual check that found nothing newer.
void showUpToDate(BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(const SnackBar(content: Text('You have the latest version ($appVersion).')));
}
