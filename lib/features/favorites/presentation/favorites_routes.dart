part of '../favorites.dart';

abstract class FavoritesRoutes {
  const FavoritesRoutes._();

  static final routes = <AutoRoute>[
    AutoRoute(page: FavoritesRoute.page, initial: true),
  ];
}
