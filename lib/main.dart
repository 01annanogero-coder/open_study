import 'package:flutter/material.dart';
import 'screens/search_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const OpenStudyApp());
}

class OpenStudyApp extends StatelessWidget {
  const OpenStudyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Study',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const SearchScreen(),
    );
  }
}
