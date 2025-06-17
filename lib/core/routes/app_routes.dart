import 'package:auto_route/auto_route.dart';
import 'package:effective_rick_and_morty/core/routes/app_router.gr.dart';
import 'package:effective_rick_and_morty/features/favorites/favorites.dart';
import 'package:effective_rick_and_morty/features/home/home.dart';
import 'package:effective_rick_and_morty/features/settings/settings.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const String main = '/';

  static const String homeWrppaer = 'homeWrppaer';
  static const String favoritesWrapper = 'favoritesWrapper';
  static const String settingsWrapper = 'settingsWrapper';

  static final routes = <AutoRoute>[
    AutoRoute(
      page: AppScaffold.page,
      path: AppRoutes.main,
      initial: true,
      children: [
        AutoRoute(
          page: HomeWrapperRoute.page,
          path: AppRoutes.homeWrppaer,
          children: HomeRoutes.routes,
        ),

        AutoRoute(
          page: FavoritesWrapperRoute.page,
          path: AppRoutes.favoritesWrapper,
          children: FavoritesRoutes.routes,
        ),

        AutoRoute(
          page: SettingsWrapperRoute.page,
          path: AppRoutes.settingsWrapper,
          children: SettingsRoutes.routes,
        ),
      ],
    ),
  ];
}
