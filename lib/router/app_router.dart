import 'package:flutter/cupertino.dart';
import 'package:friflex_starter/features/debug/debug_routes.dart';
import 'package:friflex_starter/features/debug/i_debug_service.dart';
import 'package:friflex_starter/features/main/presentation/main_routes.dart';
import 'package:friflex_starter/features/root/root_screen.dart';
import 'package:go_router/go_router.dart';

/// Класс, реализующий роутер приложения и все поля классов
class AppRouter {
  /// Конструктор для инициализации роутера
  const AppRouter();

  /// Ключ для доступа к корневому навигатору приложения
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Начальный роут приложения
  static String get initialLocation => '/debug';

  /// Метод для создания экземпляра GoRouter
  static GoRouter createRouter(IDebugService debugService) {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: initialLocation,
      routes: [
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state, navigationShell) =>
              RootScreen(navigationShell: navigationShell),
          branches: [
            MainRoutes.buildShellBranch(),
            DebugRoutes.buildShellBranch(),
          ],
        ),
      ],
    );
  }
}
