import 'package:flutter/material.dart';
import 'screens/app_shell.dart';
import 'services/local_store.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await LocalStore.open();
  runApp(OpenStudyApp(store: store));
}

class OpenStudyApp extends StatelessWidget {
  final LocalStore store;
  const OpenStudyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Study',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: AppShell(store: store),
    );
  }
}
