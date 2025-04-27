import 'package:flutter/widgets.dart';

/// {@template HBox}
///  HBox виджет для вертикального отступа (Надстройка над SizedBox)
/// [height] - высота отступа
/// [key] - ключ виджета
/// {@endtemplate}
class HBox extends SizedBox {
  /// {@macro HBox}
  const HBox(double height, {super.key}) : super(height: height);
}

/// {@template WBox}
/// WBox виджет для вертикального отступа (Надстройка над SizedBox)
/// [width] - ширина отступа
/// [key] - ключ виджета
/// {@endtemplate}
class WBox extends SizedBox {
  /// {@macro WBox}
  const WBox(double width, {super.key}) : super(width: width);
}
