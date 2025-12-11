import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/app_providers.dart';
import 'package:friflex_starter/app/theme/app_theme.dart';
import 'package:friflex_starter/app/theme/theme_notifier.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/l10n/gen/app_localizations.dart';
import 'package:friflex_starter/l10n/localization_notifier.dart';
import 'package:go_router/go_router.dart';

/// {@template app}
/// Главный виджет приложения, отображающий основной интерфейс приложения
///
/// Отвечает за:
/// - Настройку провайдеров для темы и локализации
/// {@endtemplate}
class AppInternal extends StatelessWidget {
  /// {@macro app_internal}
  const AppInternal({
    required this.diContainer,
    required this.router,
    super.key,
  });

  /// Контейнер зависимостей
  final DiContainer diContainer;

  /// Роутер приложения
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      diContainer: diContainer,
      child: LocalizationConsumer(
        builder: (localizationContext) {
          return ThemeConsumer(
            builder: (themeContext) => MediaQuery(
              key: const ValueKey('prevent_rebuild'),
              data: MediaQuery.of(
                themeContext,
              ).copyWith(textScaler: TextScaler.noScaling, boldText: false),
              child: MaterialApp.router(
                darkTheme: AppTheme.dark,
                theme: AppTheme.light,
                themeMode: themeContext.theme.themeMode,
                locale: localizationContext.localization.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: router,
              ),
            ),
          );
        },
      ),
    );
  }
}
