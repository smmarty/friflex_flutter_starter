import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/app_providers.dart';
import 'package:friflex_starter/app/theme/app_theme.dart';
import 'package:friflex_starter/app/theme/theme_notifier.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/l10n/gen/app_localizations.dart';
import 'package:friflex_starter/l10n/localization_notifier.dart';
import 'package:friflex_starter/router/app_router.dart';
import 'package:go_router/go_router.dart';

/// {@template app}
/// Главный виджет приложения, отображающий основной интерфейс приложения
///
/// Отвечает за:
/// - Настройку провайдеров для темы и локализации
/// {@endtemplate}
class AppRoot extends StatelessWidget {
  /// {@macro app_root}
  const AppRoot({required this.diContainer, super.key});

  /// Контейнер зависимостей
  final DiContainer diContainer;

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
              child: _Internal(
                diContainer: diContainer,
                theme: themeContext.theme,
                localization: localizationContext.localization,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Internal extends StatefulWidget {
  const _Internal({
    required this.theme,
    required this.diContainer,
    required this.localization,
  });
  final ThemeNotifier theme;

  final DiContainer diContainer;

  final LocalizationNotifier localization;
  @override
  State<_Internal> createState() => _InternalState();
}

class _InternalState extends State<_Internal> {
  /// Роутер приложения
  late final GoRouter router;

  @override
  void initState() {
    super.initState();
    router = AppRouter.createRouter(widget.diContainer.debugService);
  }

  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    darkTheme: AppTheme.dark,
    theme: AppTheme.light,
    themeMode: widget.theme.themeMode,
    locale: widget.localization.locale,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    routerConfig: router,
  );
}
