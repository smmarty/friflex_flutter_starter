import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/app_providers.dart';
import 'package:friflex_starter/app/depends_providers.dart';
import 'package:friflex_starter/app/theme/app_theme.dart';
import 'package:friflex_starter/app/theme/theme_notifier.dart';
import 'package:friflex_starter/di/di_container.dart';

import 'package:friflex_starter/features/error/error_screen.dart';
import 'package:friflex_starter/features/splash/splash_screen.dart';
import 'package:friflex_starter/l10n/gen/app_localizations.dart';
import 'package:friflex_starter/l10n/localization_notifier.dart';
import 'package:go_router/go_router.dart';

/// Класс приложения
class App extends StatefulWidget {
  const App({required this.router, required this.initDependencies, super.key});

  /// Роутер приложения
  final GoRouter router;

  /// Функция для инициализации зависимостей
  final Future<DiContainer> Function() initDependencies;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// Мутабельная Future для инициализации зависимостей
  late Future<DiContainer> _initFuture;

  @override
  void initState() {
    super.initState();
    _initFuture = widget.initDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      // Consumer для локализации добавляем выше чем DependsProviders
      // чтобы при изменении локализации перестраивался весь виджет
      // Но, это не обязательно, можно добавить в DependsProviders
      child: LocalizationConsumer(
        builder: () => FutureBuilder<DiContainer>(
          future: _initFuture,
          builder: (_, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                // Пока инициализация показываем Splash
                return const SplashScreen();
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return ErrorScreen(
                    error: snapshot.error,
                    stackTrace: snapshot.stackTrace,
                    onRetry: _retryInit,
                  );
                }

                final diContainer = snapshot.data;
                if (diContainer == null) {
                  return ErrorScreen(
                    error:
                        'Ошибка инициализации зависимостей, diContainer = null',
                    stackTrace: null,
                    onRetry: _retryInit,
                  );
                }
                return DependsProviders(
                  diContainer: diContainer,
                  child: ThemeConsumer(
                    builder: () => _App(router: widget.router),
                  ),
                );
            }
          },
        ),
      ),
    );
  }

  void _retryInit() {
    setState(() {
      _initFuture = widget.initDependencies();
    });
  }
}

class _App extends StatelessWidget {
  const _App({required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      themeMode: context.theme.themeMode,
      locale: context.localization.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
