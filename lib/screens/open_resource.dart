import 'package:flutter/material.dart';
import '../models/study_resource.dart';
import '../services/local_store.dart';
import 'document_viewer_screen.dart';
import 'video_player_screen.dart';

/// Opens a result the same way from every screen: YouTube videos in YouTube's
/// official player, everything else as the provider's own page.
void openResource(BuildContext context, StudyResource resource, LocalStore store) {
  final Widget screen = resource.isYouTube
      ? VideoPlayerScreen(resource: resource, store: store)
      : DocumentViewerScreen(resource: resource, store: store);
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
}
