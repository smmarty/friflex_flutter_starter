import 'package:friflex_starter/features/update/presentation/screens/hard_update_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class UpdateRoutes {
  /// Название роута главной страницы
  static const String hardUpdateScreenName = 'update_screen';

  /// Путь роута страницы профиля пользователя
  static const String _hardUpdateScreenPath = '/update';

  /// Метод для построения роутов по Update
  ///
  /// Принимает:
  /// - [routes] - вложенные роуты
  static GoRoute buildRoutes({List<RouteBase> routes = const []}) => GoRoute(
    path: _hardUpdateScreenPath,
    name: hardUpdateScreenName,
    builder: (context, state) => const HardUpdateScreen(),
  );
}
