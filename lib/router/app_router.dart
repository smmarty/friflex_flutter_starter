import 'package:flutter/cupertino.dart';
import 'package:friflex_starter/features/debug/debug_routes.dart';
import 'package:friflex_starter/features/debug/i_debug_service.dart';
import 'package:friflex_starter/features/main/presentation/main_routes.dart';
import 'package:friflex_starter/features/profile/presentation/profile_routes.dart';
import 'package:friflex_starter/features/root/root_screen.dart';
import 'package:friflex_starter/features/splash/splash_screen.dart';
import 'package:friflex_starter/features/update/update_routes.dart';
import 'package:go_router/go_router.dart';

/// {@template app_router}
///  AppRouter - класс для управления навигацией в приложении
///  [createRouter] - метод для создания экземпляра GoRouter
/// {@endtemplate}
class AppRouter {
  /// {@macro app_router}
  const AppRouter();

  /// Ключ для доступа к корневому навигатору приложения
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Начальный роут приложения
  static String get initialLocation => '/main';

  /// Метод для создания экземпляра GoRouter
  static GoRouter createRouter(IDebugService debugService) {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: initialLocation,
      observers: [debugService.routeObserver],
      routes: [
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state, navigationShell) =>
              RootScreen(navigationShell: navigationShell),
          branches: [
            MainRoutes.buildShellBranch(),
            ProfileRoutes.buildShellBranch(),
          ],
        ),
        DebugRoutes.buildRoutes(),
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),
        UpdateRoutes.buildRoutes(),
      ],
    );
  }
}
