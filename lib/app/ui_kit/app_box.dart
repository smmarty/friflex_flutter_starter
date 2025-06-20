import 'package:flutter/widgets.dart';

/// {@template h_box}
/// Виджет для создания вертикального отступа.
///
/// Надстройка над SizedBox, предназначенная для создания
/// отступов по вертикали с более понятным названием.
/// {@endtemplate}
class HBox extends SizedBox {
  /// {@macro h_box}
  const HBox(double height, {super.key}) : super(height: height);
}

/// {@template w_box}
/// Виджет для создания горизонтального отступа.
///
/// Надстройка над SizedBox, предназначенная для создания
/// отступов по горизонтали с более понятным названием.
/// {@endtemplate}
class WBox extends SizedBox {
  /// {@macro w_box}
  const WBox(double width, {super.key}) : super(width: width);
}
