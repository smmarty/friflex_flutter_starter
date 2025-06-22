import 'package:friflex_starter/features/debug/screens/components_screen.dart';
import 'package:friflex_starter/features/debug/screens/debug_screen.dart';
import 'package:friflex_starter/features/debug/screens/icons_screen.dart';
import 'package:friflex_starter/features/debug/screens/lang_screen.dart';
import 'package:friflex_starter/features/debug/screens/path_provider_screen.dart';
import 'package:friflex_starter/features/debug/screens/secure_storage_screen.dart';
import 'package:friflex_starter/features/debug/screens/theme_screen.dart';
import 'package:friflex_starter/features/debug/screens/tokens_screen.dart';
import 'package:friflex_starter/features/debug/screens/ui_kit_screen.dart';
import 'package:friflex_starter/features/debug/screens/url_launcher_screen.dart';
import 'package:go_router/go_router.dart';

/// {@template debug_routes}
///  Роуты для отладки приложения
/// [buildRoutes] - метод для создания роутов
/// {@endtemplate}
abstract final class DebugRoutes {
  /// Название экранов
  static const String debugScreenName = 'debug_screen';
  static const String tokensScreenName = 'tokens_screen';
  static const String uiKitScreenName = 'ui_kit_screen';
  static const String iconsScreenName = 'icons_screen';
  static const String themeScreenName = 'theme_screen';
  static const String langScreenName = 'lang_screen';
  static const String componentsScreenName = 'components_screen';
  static const String pathProviderScreenName = 'path_provider_screen';
  static const String secureStorageScreenName = 'secure_storage_screen';
  static const String urlLauncherScreenName = 'url_launcher_screen';

  /// Пути к экранам
  static const String debugScreenPath = '/debug';
  static const String tokensScreenPath = 'debug/tokens';
  static const String uiKitScreenPath = 'debug/ui_kit';
  static const String iconsScreenPath = 'debug/icons';
  static const String themeScreenPath = 'debug/theme';
  static const String langScreenPath = 'debug/lang';
  static const String componentsScreenPath = 'debug/components';
  static const String pathProviderScreenPath = 'debug/path_provider';
  static const String secureStorageScreenPath = 'debug/secure_storage';
  static const String urlLauncherScreenPath = 'debug/url_launcher';

  /// Метод для создания роутов для отладки
  ///
  /// Принимает:
  /// - [routes] - вложенные роуты
  static GoRoute buildRoutes({List<RouteBase> routes = const []}) => GoRoute(
    path: debugScreenPath,
    name: debugScreenName,
    builder: (context, state) => const DebugScreen(),
    routes: [
      ...routes,
      GoRoute(
        path: tokensScreenPath,
        name: tokensScreenName,
        builder: (context, state) => const TokensScreen(),
      ),
      GoRoute(
        path: uiKitScreenPath,
        name: uiKitScreenName,
        builder: (context, state) => const UiKitScreen(),
      ),
      GoRoute(
        path: iconsScreenPath,
        name: iconsScreenName,
        builder: (context, state) => const IconsScreen(),
      ),
      GoRoute(
        path: themeScreenPath,
        name: themeScreenName,
        builder: (context, state) => const ThemeScreen(),
      ),
      GoRoute(
        path: langScreenPath,
        name: langScreenName,
        builder: (context, state) => const LangScreen(),
      ),
      GoRoute(
        path: componentsScreenPath,
        name: componentsScreenName,
        builder: (context, state) => const ComponentsScreen(),
      ),
      GoRoute(
        path: pathProviderScreenPath,
        name: pathProviderScreenName,
        builder: (context, state) => const PathProviderScreen(),
      ),
      GoRoute(
        path: secureStorageScreenPath,
        name: secureStorageScreenName,
        builder: (context, state) => const SecureStorageScreen(),
      ),
      GoRoute(
        path: urlLauncherScreenPath,
        name: urlLauncherScreenName,
        builder: (context, state) => const UrlLauncherScreen(),
      ),
    ],
  );
}
