import 'package:auto_route/auto_route.dart';
import 'package:effective_rick_and_morty/core/routes/app_routes.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => AppRoutes.routes;

  @override
  List<AutoRouteGuard> get guards => [];
}
