import 'package:flutter/material.dart';

/// Класс для конфигурации светлой/темной темы приложения
abstract class AppTheme {
  /// Геттер для получения светлой темы
  static ThemeData get light => ThemeData.light();

  /// Геттер для получения темной темы
  static ThemeData get dark => ThemeData.dark();
}
