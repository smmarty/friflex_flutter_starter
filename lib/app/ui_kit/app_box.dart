import 'package:flutter/widgets.dart';

/// {@template h_box}
///  HBox виджет для вертикального отступа (Надстройка над SizedBox)
/// {@endtemplate}
class HBox extends SizedBox {
  /// {@macro h_box}
  const HBox(double height, {super.key}) : super(height: height);
}

/// {@template w_box}
/// WBox виджет для вертикального отступа (Надстройка над SizedBox)
/// {@endtemplate}
class WBox extends SizedBox {
  /// {@macro w_box}
  const WBox(double width, {super.key}) : super(width: width);
}
