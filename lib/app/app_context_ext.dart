import 'package:flutter/material.dart';
import 'package:friflex_starter/app/theme/theme_notifier.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/l10n/gen/app_localizations.dart';
import 'package:friflex_starter/l10n/localization_notifier.dart';
import 'package:provider/provider.dart';

/// Класс, реализующий расширение для контекста приложения
extension AppContextExt on BuildContext {
  /// Метод для получения экземпляра DIContainer
  DiContainer get di => read<DiContainer>();

  /// Геттер для получения темы
  ThemeNotifier get theme => read<ThemeNotifier>();

  /// Геттер для получения локализации
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  /// Геттер для получения управления локализацией
  LocalizationNotifier get localization => read<LocalizationNotifier>();
}
