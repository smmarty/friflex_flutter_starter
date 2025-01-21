import 'package:flutter/material.dart';

/// Класс, реализующий расширение для добавления токенов в цветовую схему
extension AppColorsScheme on ColorScheme {
  bool get _isDark => brightness == Brightness.dark;

  // Тестовый цвет
  Color get testColor => _isDark ? Colors.green : Colors.red;
}
