import 'package:flutter/widgets.dart';
import 'package:friflex_starter/features/profile/presentation/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class ProfileRoutes {
  /// Название роута главной страницы
  static const String profileScreenName = 'profile_screen';

  /// Путь роута страницы профиля пользователя
  static const String _profileScreenPath = '/profile';

  /// Метод для построения ветки роутов по фиче профиля пользователя
  ///
  /// Принимает:
  /// - [routes] - вложенные роуты
  static StatefulShellBranch buildShellBranch({
    List<RouteBase> routes = const [],
    List<NavigatorObserver>? observers,
  }) =>
      StatefulShellBranch(
        initialLocation: _profileScreenPath,
        observers: observers,
        routes: [
          GoRoute(
            path: _profileScreenPath,
            name: profileScreenName,
            builder: (context, state) => const ProfileScreen(),
            routes: routes,
          ),
        ],
      );
}
