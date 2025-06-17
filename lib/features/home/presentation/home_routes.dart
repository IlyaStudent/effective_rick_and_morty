part of '../home.dart';

abstract class HomeRoutes {
  HomeRoutes._();

  static final routes = <AutoRoute>[
    AutoRoute(page: HomeRoute.page, initial: true),
  ];
}
