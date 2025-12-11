import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_colors_scheme.tailor.dart';

/// {@template app_colors}
/// Класс, реализующий расширение для добавления токенов в цветовую схему
/// {@endtemplate}
@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class AppColors extends ThemeExtension<AppColors> with _$AppColorsTailorMixin {
  /// {@macro app_colors}
  ///
  /// Принимает:
  ///
  /// * [testColor] - цвет тестового текста
  /// * [errorSnackbarBackground] - цвет фона снекбара ошибки
  /// * [successSnackbarBackground] - цвет фона снекбара успеха
  /// * [infoSnackbarBackground] - цвет фона снекбара информации
  /// * [itemTextColor] - цвет элемента текста
  const AppColors({
    required this.testColor,
    required this.itemTextColor,
    required this.errorSnackbarBackground,
    required this.successSnackbarBackground,
    required this.infoSnackbarBackground,
  });

  /// Цвет тестовый
  @override
  final Color testColor;

  /// Цвет элемента текста
  @override
  final Color itemTextColor;

  /// Цвет фона снекбара ошибки
  @override
  final Color errorSnackbarBackground;

  /// Цвет фона снекбара успеха
  @override
  final Color successSnackbarBackground;

  /// Цвет фона снекбара информации
  @override
  final Color infoSnackbarBackground;

  /// Цвета светлой темы
  static const AppColors light = AppColors(
    testColor: Colors.red,
    errorSnackbarBackground: Color(0xFFD24720),
    successSnackbarBackground: Color(0xFF6FB62C),
    infoSnackbarBackground: .fromARGB(255, 220, 108, 77),
    itemTextColor: Color(0xFFFAF3EB),
  );

  /// Цвета тёмной темы
  static const AppColors dark = AppColors(
    testColor: Colors.green,
    errorSnackbarBackground: Color(0xFF638B8B),
    successSnackbarBackground: Color(0xFF93C499),
    infoSnackbarBackground: .fromARGB(255, 35, 147, 178),
    itemTextColor: Colors.white,
  );
}
