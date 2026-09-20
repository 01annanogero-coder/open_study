import 'package:flutter/material.dart';
import '../services/local_store.dart';
import 'about_screen.dart';
import 'home_screen.dart';
import 'saved_screen.dart';
import 'search_screen.dart';

/// Bottom navigation: Home, Search, Saved, About. No accounts and no sign-in.
class AppShell extends StatefulWidget {
  final LocalStore store;
  const AppShell({super.key, required this.store});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  static const int _tabHome = 0, _tabSearch = 1, _tabAbout = 3;

  int _index = _tabHome;
  final ValueNotifier<SearchRequest?> _requests = ValueNotifier<SearchRequest?>(null);

  @override
  void dispose() {
    _requests.dispose();
    super.dispose();
  }

  /// Switch to the Search tab and run [query] there.
  void _runSearch(String query) {
    setState(() => _index = _tabSearch);
    _requests.value = SearchRequest(query);
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
          ),
          SearchScreen(store: widget.store, requests: _requests),
          SavedScreen(store: widget.store, onSearch: _runSearch),
          const AboutScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_rounded),
            selectedIcon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border_rounded),
            selectedIcon: Icon(Icons.bookmark_rounded),
            label: 'Saved',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline_rounded),
            selectedIcon: Icon(Icons.info_rounded),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
