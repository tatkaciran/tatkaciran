// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme_repository/theme_repository.dart';

class ThemeManager extends ChangeNotifier {
  bool _isThemeLight = false;
  bool get isThemeLight => _isThemeLight;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  late ThemeRepository _themeRepository;
  ThemeRepository get themeRepository => _themeRepository;
  void setThemeRepository(ThemeRepository themeRepository) {
    _themeRepository = themeRepository;
  }

  void initializeTheme() {
    _isThemeLight = _themeRepository.theme();

    !_isThemeLight ? _themeDark() : _themeLight();

    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isThemeLight = !_isThemeLight;
    await _themeRepository.updateTheme(theme: _isThemeLight);
    initializeTheme();
    print('toggle Theme ' + _isThemeLight.toString());

    notifyListeners();
  }

  _themeDark() {
    _themeMode = ThemeMode.dark;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  _themeLight() {
    _themeMode = ThemeMode.light;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
