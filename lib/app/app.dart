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

/// {@template app}
/// Главный виджет приложения, управляющий инициализацией зависимостей
/// и отображением основного интерфейса приложения.
///
/// Отвечает за:
/// - Инициализацию зависимостей приложения
/// - Отображение экрана загрузки во время инициализации
/// - Обработку ошибок инициализации
/// - Настройку провайдеров для темы и локализации
/// {@endtemplate}
class App extends StatefulWidget {
  /// {@macro app}
  const App({required this.router, required this.initDependencies, super.key});

  /// Роутер приложения для навигации между экранами
  final GoRouter router;

  /// Функция для инициализации зависимостей приложения
  /// Возвращает Future с контейнером зависимостей
  final Future<DiContainer> Function() initDependencies;

  @override
  State<App> createState() => _AppState();
}

/// {@template app_state}
/// Состояние главного виджета приложения.
///
/// Управляет процессом инициализации зависимостей и отображением
/// соответствующих экранов в зависимости от состояния инициализации.
/// {@endtemplate}
class _AppState extends State<App> {
  /// {@macro app_state}
  _AppState();

  /// Мутабельная Future для инициализации зависимостей
  /// Позволяет перезапускать инициализацию при ошибках
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
                    builder: () => MediaQuery(
                      key: ValueKey('prevent_rebuild'),
                      data: MediaQuery.of(context).copyWith(
                        textScaler: TextScaler.noScaling,
                        boldText: false,
                      ),
                      child: _App(router: widget.router),
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }

  /// Метод для перезапуска инициализации зависимостей
  /// Вызывается при ошибках инициализации для повторной попытки
  void _retryInit() {
    setState(() {
      _initFuture = widget.initDependencies();
    });
  }
}

/// {@template app_internal}
/// Внутренний виджет приложения, отображающий основной интерфейс
/// после успешной инициализации зависимостей.
///
/// Настраивает MaterialApp с роутером, темами и локализацией.
/// {@endtemplate}
class _App extends StatelessWidget {
  /// {@macro app_internal}
  const _App({required this.router});

  /// Роутер приложения для навигации
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
