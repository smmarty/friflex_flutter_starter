import 'package:flutter/widgets.dart';
import 'package:friflex_starter/features/main/presentation/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class MainRoutes {
  /// Название роута главной страницы
  static const String mainScreenName = 'main_screen';

  /// Путь роута страницы профиля пользователя
  static const String _mainScreenPath = '/main';

  /// Метод для построения ветки роутов по фиче профиля пользователя
  ///
  /// Принимает:
  /// - [routes] - вложенные роуты
  static StatefulShellBranch buildShellBranch({
    List<RouteBase> routes = const [],
    List<NavigatorObserver>? observers,
  }) =>
      StatefulShellBranch(
        initialLocation: _mainScreenPath,
        observers: observers,
        routes: [
          GoRoute(
            path: _mainScreenPath,
            name: mainScreenName,
            builder: (context, state) => const MainScreen(),
            routes: routes,
          ),
        ],
      );
}
