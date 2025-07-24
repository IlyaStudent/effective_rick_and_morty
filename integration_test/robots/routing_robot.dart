import 'package:effective_rick_and_morty/core/widgets/widgets_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class RoutingRobot {
  final WidgetTester tester;

  RoutingRobot({required this.tester});

  Future<void> goToHomeScreen() async {
    final homeNavBarItem = find.byKey(WidgetsKeys.homeNavBarItem);
    await _navigateToScreen(homeNavBarItem);
  }

  Future<void> goToFavoritesScreen() async {
    final favoriteNavBarItem = find.byKey(WidgetsKeys.favoriteNavBarItem);
    await _navigateToScreen(favoriteNavBarItem);
  }

  Future<void> goToSettingsScreen() async {
    final settingsNavBarItem = find.byKey(WidgetsKeys.settingsNavBarItem);
    await _navigateToScreen(settingsNavBarItem);
  }

  Future<void> _navigateToScreen(Finder navBarItem) async {
    await tester.ensureVisible(navBarItem);
    await tester.tap(navBarItem);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }
}
