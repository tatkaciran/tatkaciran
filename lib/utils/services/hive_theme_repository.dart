// ignore_for_file: avoid_print

import 'dart:async';

import 'package:hive/hive.dart';

import 'package:theme_repository/theme_repository.dart';

class HiveThemeRepository implements ThemeRepository {
  // final userCollection = FirebaseFirestore.instance.collection('users');
  final String _theme = 'theme';
  final Box _userBox = Hive.box('users');

  @override
  Future<void> updateTheme({required bool theme}) {
    return _userBox.put(_theme, theme);
  }

  @override
  bool theme() {
    bool theme = _userBox.get(_theme, defaultValue: false);
    return theme;
  }
}
