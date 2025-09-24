import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/features/update/domain/state/cubit/update_cubit.dart';
import 'package:provider/provider.dart';

/// Класс для внедрения глобальных зависимостей
final class DependsProviders extends StatelessWidget {
  const DependsProviders({
    required this.child,
    required this.diContainer,
    super.key,
  });

  final Widget child;
  final DiContainer diContainer;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Сюда добавляем глобальные блоки, inherited и т.д.
        Provider.value(value: diContainer), // Передаем контейнер зависимостей
        BlocProvider(
          create: (_) => UpdateCubit(diContainer.repositories.updatesRepository)
            ..checkForUpdates(
              versionCode:
                  '1.0.0', // TODO(yura): заменить на получение из diContainer
              platform: 'android',
            ),
        ),
      ],
      child: child,
    );
  }
}
