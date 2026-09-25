import 'package:flutter/material.dart';
import 'screens/app_shell.dart';
import 'services/local_store.dart';
import 'services/update_manager.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await LocalStore.open();
  runApp(OpenStudyApp(store: store));
}

class OpenStudyApp extends StatelessWidget {
  final LocalStore store;

  /// Off in tests, so they never reach the network.
  final bool checkForUpdates;

  const OpenStudyApp({super.key, required this.store, this.checkForUpdates = true});

  static UpdateManager? _updates;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Study',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: AppShell(
        store: store,
        updates: checkForUpdates ? (_updates ??= UpdateManager(store: store)) : null,
      ),
    );
  }
}
