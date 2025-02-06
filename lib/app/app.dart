import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/app_providers.dart';
import 'package:friflex_starter/app/theme/app_theme.dart';
import 'package:friflex_starter/app/theme/theme_notifier.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/features/error/error_screen.dart';
import 'package:friflex_starter/features/splash/splash_screen.dart';
import 'package:friflex_starter/l10n/gen/app_localizations.dart';
import 'package:friflex_starter/l10n/localization_notifier.dart';
import 'package:go_router/go_router.dart';

/// Класс для реализации объекта приложения
class App extends StatelessWidget {
  /// Создает экземпляр приложения
  ///
  /// Принимает:
  /// - [router] - экземпляр роутера приложения
  const App({
    super.key,
    // required this.diContainer,
    required this.router,
    required this.initDependencies,
  });

  // /// Набор зависимостей приложения
  // final DiContainer diContainer;

  /// Экземпляр роутера приложения
  final GoRouter router;

  /// Функция инициализации зависимостей
  final Function() initDependencies;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initDependencies(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen(
            error: snapshot.error,
            stackTrace: snapshot.stackTrace,
          );
        } else if (snapshot.hasData && snapshot.data is DiContainer) {
          return AppProviders(
            diContainer: snapshot.data as DiContainer,
            child: LocalizationConsumer(
              builder: () => ThemeConsumer(
                builder: () => _App(router: router),
              ),
            ),
          );
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}

/// Класс для реализации объекта приложения
class _App extends StatefulWidget {
  const _App({required this.router});

  final GoRouter router;

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: widget.router,
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      themeMode: context.theme.themeMode,
      locale: context.localization.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
