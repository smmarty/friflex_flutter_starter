import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// {@template app_colors}
/// Класс, реализующий расширение для добавления токенов в цветовую схему
/// {@endtemplate}
class AppColors extends ThemeExtension<AppColors> with DiagnosticableTreeMixin {
  /// {@macro app_colors}
  ///
  /// Принимает:
  ///
  /// * [testColor] - цвет тестового текста
  /// * [errorSnackbarBackground] - цвет фона снекбара ошибки
  /// * [successSnackbarBackground] - цвет фона снекбара успеха
  /// * [infoSnackbarBackground] - цвет фона снекбара информации
  const AppColors({
    required this.testColor,
    required this.errorSnackbarBackground,
    required this.successSnackbarBackground,
    required this.infoSnackbarBackground,
  });

  /// Цвет тестового текста
  final Color testColor;

  /// Цвет фона снекбара ошибки
  final Color errorSnackbarBackground;

  /// Цвет фона снекбара успеха
  final Color successSnackbarBackground;

  /// Цвет фона снекбара информации
  final Color infoSnackbarBackground;

  /// Цвета светлой темы
  static final AppColors light = AppColors(
    testColor: Colors.red,
    errorSnackbarBackground: const Color(0xFFD24720),
    successSnackbarBackground: const Color(0xFF6FB62C),
    infoSnackbarBackground: const Color.fromARGB(255, 220, 108, 77),
  );

  /// Цвета тёмной темы
  static final AppColors dark = AppColors(
    testColor: Colors.red,
    errorSnackbarBackground: const Color(0xFFD24720),
    successSnackbarBackground: const Color(0xFF6FB62C),
    infoSnackbarBackground: const Color.fromARGB(255, 220, 108, 77),
  );

  @override
  ThemeExtension<AppColors> copyWith({
    Color? testColor,
    Color? errorSnackbarBackground,
    Color? successSnackbarBackground,
    Color? infoSnackbarBackground,
  }) => AppColors(
    testColor: testColor ?? this.testColor,
    errorSnackbarBackground: errorSnackbarBackground ?? this.errorSnackbarBackground,
    successSnackbarBackground: successSnackbarBackground ?? this.successSnackbarBackground,
    infoSnackbarBackground: infoSnackbarBackground ?? this.infoSnackbarBackground,
  );

  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(
      testColor: Color.lerp(testColor, other.testColor, t)!,
      errorSnackbarBackground: Color.lerp(
        errorSnackbarBackground,
        other.errorSnackbarBackground,
        t,
      )!,
      successSnackbarBackground: Color.lerp(
        successSnackbarBackground,
        other.successSnackbarBackground,
        t,
      )!,
      infoSnackbarBackground: Color.lerp(infoSnackbarBackground, other.infoSnackbarBackground, t)!,
    );
  }
}
