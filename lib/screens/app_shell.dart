import 'package:flutter/material.dart';
import '../data/course_catalog.dart';
import '../services/local_store.dart';
import '../services/update_manager.dart';
import '../theme/app_theme.dart';
import '../widgets/update_dialog.dart';
import 'about_screen.dart';
import 'home_screen.dart';
import 'saved_screen.dart';
import 'search_screen.dart';
import 'subject_screen.dart';

/// Bottom navigation: Home, Search, Saved, About. No accounts and no sign-in.
class AppShell extends StatefulWidget {
  final LocalStore store;

  /// Keeps the app up to date; null in tests, which never reach the network.
  final UpdateManager? updates;

  const AppShell({super.key, required this.store, this.updates});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> with WidgetsBindingObserver {
  static const int _tabHome = 0, _tabSearch = 1, _tabSaved = 2, _tabAbout = 3;

  int _index = _tabHome;
  final ValueNotifier<SearchRequest?> _requests = ValueNotifier<SearchRequest?>(null);

  @override
  void initState() {
    super.initState();
    if (widget.updates != null) {
      WidgetsBinding.instance.addObserver(this);
      WidgetsBinding.instance.addPostFrameCallback((_) => _onLaunch());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _requests.dispose();
    super.dispose();
  }

  /// Leaving the app is when a downloaded update gets installed, so the
  /// next launch runs the new version.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) widget.updates?.onBackground();
  }

  Future<void> _onLaunch() async {
    final updates = widget.updates!;
    final notice = await updates.onLaunch();
    if (!mounted) return;
    switch (notice) {
      case UpdateNotice.updated:
        showUpdated(context);
      case UpdateNotice.readyToInstall:
        await showReadyToInstall(context, updates);
      case UpdateNotice.needsPermission:
        await showAllowAutoUpdates(context, updates);
      case UpdateNotice.none:
        break;
    }
  }

  /// Switch to the Search tab and run [query] there.
  void _runSearch(String query) {
    setState(() => _index = _tabSearch);
    _requests.value = SearchRequest(query);
  }

  /// Subjects with built-in lessons open their own page (lessons and search
  /// results); the rest go straight to search.
  void _openSubject(String name, String subjectId, String query) {
    if (coursesForSubject(subjectId).isEmpty) {
      _runSearch(query);
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => SubjectScreen(store: widget.store, title: name, subjectId: subjectId, query: query),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          HomeScreen(
            onSearch: _runSearch,
            onOpenAbout: () => setState(() => _index = _tabAbout),
            onOpenSaved: () => setState(() => _index = _tabSaved),
            onOpenSearch: () => setState(() => _index = _tabSearch),
            onOpenSubject: _openSubject,
          ),
          SearchScreen(store: widget.store, requests: _requests),
          SavedScreen(store: widget.store, onSearch: _runSearch),
          AboutScreen(store: widget.store, updates: widget.updates),
        ],
      ),
      bottomNavigationBar: BottomTabBar(
        selectedIndex: _index,
        onSelected: (i) => setState(() => _index = i),
        tabs: const [
          BottomTab(Icons.home_outlined, Icons.home_rounded, 'Home'),
          BottomTab(Icons.search_rounded, Icons.search_rounded, 'Search'),
          BottomTab(Icons.bookmark_border_rounded, Icons.bookmark_rounded, 'Saved'),
          BottomTab(Icons.info_outline_rounded, Icons.info_rounded, 'About'),
        ],
      ),
    );
  }
}

class BottomTab {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  const BottomTab(this.icon, this.selectedIcon, this.label);
}

/// White bottom bar with a short gold underline beneath the selected tab.
class BottomTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final List<BottomTab> tabs;
  const BottomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 66,
          child: Row(
            children: [
              for (var i = 0; i < tabs.length; i++)
                Expanded(child: _tab(tabs[i], i == selectedIndex, () => onSelected(i))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tab(BottomTab tab, bool selected, VoidCallback onTap) {
    final color = selected ? AppColors.primary : AppColors.textSecondary;
    return Semantics(
      selected: selected,
      button: true,
      child: InkResponse(
        onTap: onTap,
        radius: 36,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(selected ? tab.selectedIcon : tab.icon, size: 26, color: color),
            const SizedBox(height: 3),
            Text(
              tab.label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: selected ? 30 : 0,
              height: 3,
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
