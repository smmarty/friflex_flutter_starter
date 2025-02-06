import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/theme/app_theme.dart';
import 'package:friflex_starter/app/theme/theme_notifier.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/l10n/gen/app_localizations.dart';
import 'package:friflex_starter/l10n/localization_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// Класс для реализации объекта приложения
class App extends StatelessWidget {
  /// Создает экземпляр приложения
  ///
  /// Принимает:
  /// - [diContainer] - набор зависимостей приложения
  /// - [router] - экземпляр роутера приложения
  const App({
    super.key,
    required this.diContainer,
    required this.router,
  });

  /// Набор зависимостей приложения
  final DiContainer diContainer;

  /// Экземпляр роутера приложения
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      diContainer: diContainer,
      child: LocalizationConsumer(
        builder: () => ThemeConsumer(
          builder: () => _App(router: router),
        ),
      ),
    );
  }
}

/// Класс для реализации объекта приложения
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

/// Класс для реализации провайдеров приложения
final class AppProviders extends StatelessWidget {
  const AppProviders({
    super.key,
    required this.child,
    required this.diContainer,
  });

  final Widget child;
  final DiContainer diContainer;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: diContainer), // Передаем контейнер зависимостей
        ChangeNotifierProvider(
          create: (_) => ThemeNotifier(),
        ), // Провайдер для темы
        ChangeNotifierProvider(
          create: (_) => LocalizationNotifier(),
        ), // Провайдер для локализации
      ],
      child: child,
    );
  }
}
