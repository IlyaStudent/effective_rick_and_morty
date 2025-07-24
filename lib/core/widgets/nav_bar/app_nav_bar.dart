part of '../widgets.dart';

class AppNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const AppNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: currentIndex,
    onTap: onTap,
    items: [
      BottomNavigationBarItem(
        key: WidgetsKeys.homeNavBarItem,
        label: context.localization.home,
        icon: Icon(Icons.home_rounded),
      ),

      BottomNavigationBarItem(
        key: WidgetsKeys.favoriteNavBarItem,
        label: context.localization.favorites,
        icon: Icon(Icons.star_rounded),
      ),

      BottomNavigationBarItem(
        key: WidgetsKeys.settingsNavBarItem,
        label: context.localization.settings,
        icon: Icon(Icons.settings_rounded),
      ),
    ],
  );
}
