import 'package:flutter/material.dart';

/// Класс, реализующий расширение для добавления токенов в цветовую схему
extension AppColorsScheme on ColorScheme {
  bool get _isDark => brightness == Brightness.dark;

  // Тестовый цвет
  Color get testColor => _isDark ? Colors.green : Colors.red;

  /// Цвет заднего фона снекбара с ошибкой
  Color get errorSnackbarBackground => const Color(0xFFD24720);

  /// Цвет заднего фона снекбара с успехом
  Color get successSnackbarBackground => const Color(0xFF6FB62C);
}
