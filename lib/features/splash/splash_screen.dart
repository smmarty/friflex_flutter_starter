import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:friflex_starter/gen/assets.gen.dart';

/// {@template SplashScreen}
/// Экран загрузки приложения.
/// {@endtemplate}
class SplashScreen extends StatelessWidget {
  /// {@macro SplashScreen}
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Assets.lottie.splash.lottie());
  }
}
