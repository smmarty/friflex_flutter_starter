import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/app/theme/theme_notifier.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/features/update/domain/state/cubit/update_cubit.dart';
import 'package:friflex_starter/l10n/localization_notifier.dart';
import 'package:provider/provider.dart';

/// {@template app_providers}
/// Класс для добавления зависимостей приложения
/// {@endtemplate}
final class AppProviders extends StatelessWidget {
  /// {@macro app_providers}
  const AppProviders({
    required this.child,
    required this.diContainer,
    super.key,
  });

  /// Виджет, который будет отображаться внутри провайдеров
  final Widget child;

  /// Контейнер зависимостей
  final DiContainer diContainer;

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
        Provider.value(value: diContainer), // Передаем контейнер зависимостей
        BlocProvider(
          create: (_) => UpdateCubit(diContainer.repositories.updateRepository),
        ),
      ],
      child: child,
    );
  }
}
