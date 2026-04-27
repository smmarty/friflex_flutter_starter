import 'package:flutter/widgets.dart';
import 'package:friflex_starter/features/main/presentation/screens/main_detail_screen.dart';
import 'package:friflex_starter/features/main/presentation/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class MainRoutes {
  /// Название роута главной страницы
  static const String mainScreenName = 'main_screen';

  /// Название роута экрана с деталями
  static const String mainDetailScreenName = 'main_detail_screen';

  /// Путь роута страницы профиля пользователя
  static const String _mainScreenPath = '/main';

  /// Путь роута экрана с деталями
  static const String _mainDetailScreenPath = '/main/detail';

  /// Метод для построения ветки роутов по фиче профиля пользователя
  ///
  /// Принимает:
  /// - [routes] - вложенные роуты
  static StatefulShellBranch buildShellBranch({
    List<RouteBase> routes = const [],
    List<NavigatorObserver>? observers,
  }) => StatefulShellBranch(
    initialLocation: _mainScreenPath,
    observers: observers,
    routes: [
      ...routes,
      GoRoute(
        path: _mainScreenPath,
        name: mainScreenName,
        builder: (context, state) => const MainScreen(),
        routes: [
          // Пример вложенного роута для главного экрана
          GoRoute(
            path: _mainDetailScreenPath,
            name: mainDetailScreenName,
            builder: (context, state) => const MainDetailScreen(),
          ),
        ],
      ),
    ],
  );
}
