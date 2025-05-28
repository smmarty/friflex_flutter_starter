import 'package:flutter/material.dart';
import 'package:friflex_starter/app/theme/theme_notifier.dart';
import 'package:friflex_starter/l10n/localization_notifier.dart';
import 'package:provider/provider.dart';

/// Класс для добавления провайдеров темы и локализации
final class AppProviders extends StatelessWidget {
  const AppProviders({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeNotifier(),
        ), // Провайдер для темы
        ChangeNotifierProvider(
          create: (_) => LocalizationNotifier(),
        ), // Провайдер для локализации
      ],
      child: child,
    );
  }
}
