import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/study_resource.dart';

class LocalStore extends ChangeNotifier {
  static const String _savedKey = 'saved_resources_v1';
  static const String _recentKey = 'recent_searches_v1';
  static const int _maxSaved = 200;
  static const int _maxRecent = 10;

  final SharedPreferences _prefs;
  final List<StudyResource> _saved = [];
  final List<String> _recent = [];

  LocalStore._(this._prefs);

  /// Loads saved data. [prefs] may be passed in tests.
  static Future<LocalStore> open({SharedPreferences? prefs}) async {
    final sp = prefs ?? await SharedPreferences.getInstance();
    final store = LocalStore._(sp);
    await store._load();
    return store;
  }

  Future<void> _load() async {
    // Load saved resources
    final savedJson = _prefs.getString(_savedKey);
    if (savedJson != null && savedJson.isNotEmpty) {
      try {
        final List<dynamic> decoded = jsonDecode(savedJson);
        for (final item in decoded) {
          if (item is Map<String, dynamic>) {
            try {
              final resource = StudyResource.fromJson(item);
              _saved.add(resource);
            } catch (_) {
              // Skip corrupt entries
            }
          }
        }
      } catch (_) {
        // Skip corrupt JSON entirely
      }
    }

    // Load recent searches
    final recentList = _prefs.getStringList(_recentKey);
    if (recentList != null) {
      _recent.addAll(recentList);
    }
  }

  String _encodeSaved() {
    final List<Map<String, dynamic>> jsonList =
        _saved.map((r) => r.toJson()).toList();
    return jsonEncode(jsonList);
  }

  Future<void> _persistSaved() async {
    await _prefs.setString(_savedKey, _encodeSaved());
  }

  Future<void> _persistRecent() async {
    await _prefs.setStringList(_recentKey, _recent);
  }

  /// Bookmarked results, newest first.
  List<StudyResource> get saved => List.unmodifiable(_saved);

  bool isSaved(String url) => _saved.any((r) => r.url == url);

  /// Adds the resource if its url is not saved yet, otherwise removes it.
  Future<void> toggleSaved(StudyResource resource) async {
    final index = _saved.indexWhere((r) => r.url == resource.url);
    if (index >= 0) {
      _saved.removeAt(index);
    } else {
      _saved.insert(0, resource);
      if (_saved.length > _maxSaved) {
        _saved.removeLast();
      }
    }
    await _persistSaved();
    notifyListeners();
  }

  Future<void> clearSaved() async {
    _saved.clear();
    await _persistSaved();
    notifyListeners();
  }

  /// Recent searches, newest first, at most 10, no duplicates ignoring upper/lower case.
  List<String> get recentSearches => List.unmodifiable(_recent);

  /// Trims the text, ignores empty text, moves an existing entry to the front.
  Future<void> addRecentSearch(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    final lower = trimmed.toLowerCase();
    final existingIndex = _recent.indexWhere(
      (s) => s.toLowerCase() == lower,
    );

    if (existingIndex >= 0) {
      _recent.removeAt(existingIndex);
    }
    _recent.insert(0, trimmed);
    if (_recent.length > _maxRecent) {
      _recent.removeLast();
    }
    await _persistRecent();
    notifyListeners();
  }

  Future<void> removeRecentSearch(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    final lower = trimmed.toLowerCase();
    _recent.removeWhere((s) => s.toLowerCase() == lower);
    await _persistRecent();
    notifyListeners();
  }

  Future<void> clearRecentSearches() async {
    _recent.clear();
    await _persistRecent();
    notifyListeners();
  }
}