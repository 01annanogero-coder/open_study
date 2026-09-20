import 'package:flutter/material.dart';
import '../models/study_resource.dart';
import '../services/local_store.dart';
import '../theme/app_theme.dart';

/// Star-style button that saves or un-saves a result on this phone only.
class BookmarkButton extends StatelessWidget {
  final LocalStore store;
  final StudyResource resource;
  const BookmarkButton({super.key, required this.store, required this.resource});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        final saved = store.isSaved(resource.url);
        return IconButton(
          tooltip: saved ? 'Remove from Saved' : 'Save for later',
          icon: Icon(
            saved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
            color: saved ? AppColors.primary : null,
          ),
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            await store.toggleSaved(resource);
            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(saved ? 'Removed from Saved' : 'Saved on this phone'),
                ),
              );
          },
        );
      },
    );
  }
}
