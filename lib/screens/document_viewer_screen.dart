import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/study_resource.dart';
import '../services/local_store.dart';
import '../theme/app_theme.dart';
import '../widgets/bookmark_button.dart';

/// Shows a resource's own page (or the provider's official viewer) inside the
/// app, exactly as the provider serves it. Nothing on the page is modified:
/// no scripts are injected, no overlays are removed, nothing is downloaded or
/// re-hosted. Licence and source are always shown so the student can credit
/// the author properly.
class DocumentViewerScreen extends StatefulWidget {
  final StudyResource resource;
  final LocalStore store;
  const DocumentViewerScreen({super.key, required this.resource, required this.store});

  @override
  State<DocumentViewerScreen> createState() => _DocumentViewerScreenState();
}

class _DocumentViewerScreenState extends State<DocumentViewerScreen> {
  double _progress = 0;

  Future<void> _open(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null || !(uri.scheme == 'http' || uri.scheme == 'https')) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.resource;
    return Scaffold(
      appBar: AppBar(
        title: Text(r.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        actions: [
          BookmarkButton(store: widget.store, resource: r),
          IconButton(
            icon: const Icon(Icons.open_in_browser_rounded),
            tooltip: 'Open original page in browser',
            onPressed: () => _open(r.url),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_progress < 1.0)
            LinearProgressIndicator(
              value: _progress == 0 ? null : _progress,
              color: AppColors.accent,
              minHeight: 2,
            ),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri(r.url)),
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                supportZoom: true,
                builtInZoomControls: true,
                displayZoomControls: false,
                useShouldOverrideUrlLoading: true,
                useOnDownloadStart: true,
              ),
              onProgressChanged: (controller, progress) {
                setState(() => _progress = progress / 100);
              },
              // Only ordinary web pages load inside the app. Links that try to
              // open other apps (intent:, market:, etc.) are blocked. PDFs are
              // handed to the phone's own browser/viewer, because the in-app
              // web view cannot display them.
              shouldOverrideUrlLoading: (controller, action) async {
                final target = action.request.url?.toString() ?? '';
                final uri = Uri.tryParse(target);
                final scheme = uri?.scheme ?? '';
                if (scheme == 'http' || scheme == 'https') {
                  if (action.isForMainFrame &&
                      (uri?.path.toLowerCase().endsWith('.pdf') ?? false)) {
                    await _open(target);
                    return NavigationActionPolicy.CANCEL;
                  }
                  return NavigationActionPolicy.ALLOW;
                }
                if (scheme == 'about') return NavigationActionPolicy.ALLOW;
                return NavigationActionPolicy.CANCEL;
              },
              // Files the page asks the browser to download (for example PDFs
              // served as attachments) also go to the phone's own browser.
              onDownloadStartRequest: (controller, request) async {
                await _open(request.url.toString());
              },
            ),
          ),
          _AttributionBar(resource: r, onOpen: _open),
        ],
      ),
    );
  }
}

/// Source, author and licence for the item being viewed.
class _AttributionBar extends StatelessWidget {
  final StudyResource resource;
  final Future<void> Function(String url) onOpen;
  const _AttributionBar({required this.resource, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    final r = resource;
    final textStyle = Theme.of(context).textTheme.bodySmall;
    return Material(
      color: AppColors.surface,
      elevation: 4,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  [
                    if (r.creator != null && r.creator!.isNotEmpty) 'By ${r.creator}',
                    'Source: ${r.source}',
                  ].join('  ·  '),
                  style: textStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: r.licenseUrl == null ? null : () => onOpen(r.licenseUrl!),
                child: Text(
                  r.license,
                  style: textStyle?.copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                    decoration:
                        r.licenseUrl == null ? null : TextDecoration.underline,
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
