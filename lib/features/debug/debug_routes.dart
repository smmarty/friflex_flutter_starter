import 'package:flutter/widgets.dart';
import 'package:friflex_starter/features/debug/debug_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class DebugRoutes {
  /// Название роута страницы профиля пользователя
  static const String debugScreenName = 'debug_screen';

  /// Путь роута страницы профиля пользователя
  static const String _debugScreenPath = '/debug';

  /// Метод для построения ветки роутов по фиче профиля пользователя
  ///
  /// Принимает:
  /// - [routes] - вложенные роуты
  static StatefulShellBranch buildShellBranch({
    List<RouteBase> routes = const [],
    List<NavigatorObserver>? observers,
  }) =>
      StatefulShellBranch(
        initialLocation: _debugScreenPath,
        observers: observers,
        routes: [
          GoRoute(
            path: _debugScreenPath,
            name: debugScreenName,
            builder: (context, state) => const DebugScreen(),
            routes: routes,
          ),
        ],
      );
}
