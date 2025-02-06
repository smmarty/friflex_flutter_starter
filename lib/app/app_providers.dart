import 'package:flutter/material.dart';
import 'package:friflex_starter/app/theme/theme_notifier.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/l10n/localization_notifier.dart';
import 'package:provider/provider.dart';

/// Класс для реализации провайдеров приложения
final class AppProviders extends StatelessWidget {
  const AppProviders({
    super.key,
    required this.child,
    required this.diContainer,
  });

  final Widget child;
  final DiContainer diContainer;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: diContainer), // Передаем контейнер зависимостей
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
