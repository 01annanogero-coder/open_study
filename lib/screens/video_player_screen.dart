import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/study_resource.dart';
import '../theme/app_theme.dart';

/// Plays a Creative Commons YouTube video with YouTube's official embedded
/// player, unmodified and with its controls and branding intact. The app never
/// extracts, downloads or proxies video streams.
class VideoPlayerScreen extends StatefulWidget {
  final StudyResource resource;
  const VideoPlayerScreen({super.key, required this.resource});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    final id = YoutubePlayer.convertUrlToId(widget.resource.url);
    if (id != null) {
      _controller = YoutubePlayerController(
        initialVideoId: id,
        flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _open(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null || !(uri.scheme == 'http' || uri.scheme == 'https')) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.resource;
    final controller = _controller;

    Widget details() => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(r.title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              if (r.creator != null && r.creator!.isNotEmpty)
                Text('Channel: ${r.creator}',
                    style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: r.licenseUrl == null ? null : () => _open(r.licenseUrl!),
                child: Text(
                  'Licence: ${r.license}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.accent,
                        decoration: r.licenseUrl == null
                            ? null
                            : TextDecoration.underline,
                      ),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => _open(r.url),
                icon: const Icon(Icons.open_in_new_rounded),
                label: const Text('Watch on YouTube'),
              ),
            ],
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(r.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: controller == null
          ? ListView(children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('This video cannot be played inside the app.'),
              ),
              details(),
            ])
          : YoutubePlayerBuilder(
              player: YoutubePlayer(controller: controller),
              builder: (context, player) => ListView(children: [player, details()]),
            ),
    );
  }
}
