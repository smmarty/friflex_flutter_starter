import 'package:flutter/material.dart';
import 'package:friflex_starter/app/theme/app_colors_scheme.dart';

/// Класс для конфигурации светлой/темной темы приложения
abstract class AppTheme {
  /// Геттер для получения светлой темы
  static ThemeData get light => ThemeData.light().copyWith(
    extensions: <ThemeExtension<Object?>>[AppColors.light],
  );

  /// Геттер для получения темной темы
  static ThemeData get dark => ThemeData.dark().copyWith(
    extensions: <ThemeExtension<Object?>>[AppColors.dark],
  );
}
