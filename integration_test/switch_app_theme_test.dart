import 'package:effective_rick_and_morty/core/di/dependencies.dart';
import 'package:effective_rick_and_morty/rick_and_morty_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'robots/routing_robot.dart';
import 'robots/settings_screen_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Switch app theme', (tester) async {
    final settingsScreen = SettingsScreenRobot(tester: tester);
    final routing = RoutingRobot(tester: tester);

    await initTestDependencies();

    await tester.pumpWidget(RickAndMortyApp());
    await tester.pumpAndSettle();

    await routing.goToSettingsScreen();
    await settingsScreen.toggleTheme();
    await settingsScreen.assertThemeSwitched();
  });
}
