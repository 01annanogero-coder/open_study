import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../models/study_resource.dart';
import '../services/search_service.dart';
import '../theme/app_theme.dart';
import '../widgets/resource_card.dart';
import '../widgets/subcategory_chips.dart';
import 'about_screen.dart';
import 'document_viewer_screen.dart';
import 'video_player_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

enum _LoadState { idle, loading, loaded, error }

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final _api = SearchService();

  _LoadState _state = _LoadState.idle;
  String? _errorMessage;
  String? _selectedSubcategory;
  SearchResult? _result;
  String _lastQuery = '';

  Future<void> _runSearch({String? subcategory}) async {
    final query = _controller.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _state = _LoadState.loading;
      _selectedSubcategory = subcategory;
      _lastQuery = query;
    });

    try {
      final result = await _api.search(query, subcategory: subcategory);
      if (!mounted) return;
      setState(() {
        _result = result;
        _state = _LoadState.loaded;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString();
        _state = _LoadState.error;
      });
    }
  }

  void _openResource(StudyResource resource) {
    if (resource.isYouTube) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => VideoPlayerScreen(resource: resource)),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) => DocumentViewerScreen(resource: resource)),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _api.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Study'),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            tooltip: 'About, sources and licences',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AboutScreen()),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: TextField(
                controller: _controller,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => _runSearch(),
                decoration: InputDecoration(
                  hintText: 'Search e.g. "BA Kiswahili notes"',
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.arrow_forward_rounded),
                    onPressed: () => _runSearch(),
                  ),
                ),
              ),
            ),
            if (_result != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SubcategoryChips(
                  subcategories: _result!.subcategories,
                  selected: _selectedSubcategory,
                  onSelected: (sub) {
                    _controller.text = _lastQuery;
                    _runSearch(subcategory: sub);
                  },
                ),
              ),
            if (_result != null && _result!.failedSources.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  'Did not respond: ${_result!.failedSources.join(', ')}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_state) {
      case _LoadState.idle:
        return _EmptyState();
      case _LoadState.loading:
        return _LoadingList();
      case _LoadState.error:
        return _ErrorState(
          message: _errorMessage ?? 'Something went wrong.',
          onRetry: () => _runSearch(subcategory: _selectedSubcategory),
        );
      case _LoadState.loaded:
        final resources = _result!.resources;
        if (resources.isEmpty) {
          return const _EmptyState(
            message: 'No open-licensed results found for that search. Try different words.',
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(top: 4, bottom: 24),
          itemCount: resources.length,
          itemBuilder: (context, index) => ResourceCard(
            resource: resources[index],
            onTap: () => _openResource(resources[index]),
          ),
        );
    }
  }
}

class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({this.message = 'Search for free, open study material —\ntextbooks, notes, and videos.'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.school_outlined, size: 56, color: AppColors.textSecondary.withOpacity(0.5)),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off_rounded, size: 48, color: AppColors.pdfBadge),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 12),
            FilledButton(onPressed: onRetry, child: const Text('Try again')),
          ],
        ),
      ),
    );
  }
}

class _LoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.divider,
      highlightColor: AppColors.surface,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 4),
        itemCount: 6,
        itemBuilder: (_, __) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          height: 88,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
