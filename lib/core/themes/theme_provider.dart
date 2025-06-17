import 'package:flutter/material.dart';

part 'dark_theme.dart';
part 'light_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void toggleTheme() {
    setTheme(_themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }

  bool get isDark => _themeMode == ThemeMode.dark;

  bool get isLight => _themeMode == ThemeMode.light;
}
