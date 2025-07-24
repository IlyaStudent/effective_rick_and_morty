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
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.cofosansTitleLarge('Light theme \\ Dark theme'),
                      Switch(
                        key: SettingsWidgetKeys.switchThemeToggle,
                        value: themeProvider.isDark,
                        onChanged: (_) => context.themeProvider.toggleTheme(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
