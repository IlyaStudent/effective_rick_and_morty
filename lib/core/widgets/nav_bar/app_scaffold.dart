part of '../widgets.dart';

@RoutePage()
class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
    routes: const [
      HomeWrapperRoute(),
      FavoritesWrapperRoute(),
      SettingsWrapperRoute(),
    ],

    bottomNavigationBuilder:
        (_, tabsRouter) => AppNavBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        ),
  );
}
