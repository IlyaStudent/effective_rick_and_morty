import 'package:effective_rick_and_morty/core/extensions/extensions.dart';
import 'package:effective_rick_and_morty/features/settings/settings_widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class SettingsScreenRobot {
  final WidgetTester tester;

  SettingsScreenRobot({required this.tester});

  Future<void> toggleTheme() async {
    final toggleThemeWidget = find.byKey(SettingsWidgetKeys.switchThemeToggle);
    await tester.ensureVisible(toggleThemeWidget);
    await tester.tap(toggleThemeWidget);
    await tester.tap(toggleThemeWidget);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }

  Future<void> assertThemeSwitched() async {
    final context = tester.element(find.byType(MaterialApp));
    final isDark = context.themeProvider.isDark;
    expect(
      isDark,
      equals(isDark),
      reason: 'Theme should be "dark"  but was "light"',
    );
  }
}
