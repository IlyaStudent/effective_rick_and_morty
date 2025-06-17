part of '../../settings.dart';

@RoutePage()
class SettingsPage extends StatelessWidget implements AutoRouteWrapper {
  const SettingsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return SwitchListTile(
                  title: AppText.cofosansTitleLarge(
                    'Light theme \\ Dark theme',
                  ),
                  value: themeProvider.isDark,
                  onChanged: (_) => context.themeProvider.toggleTheme(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
