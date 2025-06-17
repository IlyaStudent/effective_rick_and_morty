part of '../settings.dart';

abstract class SettingsRoutes {
  SettingsRoutes._();

  static final routes = <AutoRoute>[
    AutoRoute(page: SettingsRoute.page, initial: true),
  ];
}
