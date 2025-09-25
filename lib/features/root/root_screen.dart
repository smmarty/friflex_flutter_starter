import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/app_env.dart';
import 'package:friflex_starter/features/debug/debug_routes.dart';
import 'package:friflex_starter/features/update/domain/state/cubit/update_cubit.dart';
import 'package:friflex_starter/features/update/presentation/components/soft_modal_sheet.dart';
import 'package:friflex_starter/features/update/update_const.dart';
import 'package:go_router/go_router.dart';

/// {@template root_screen}
/// Корневой экран приложения с навигационной структурой.
///
/// Отвечает за:
/// - Отображение основного навигационного интерфейса
/// - Управление переключением между основными разделами приложения
/// - Отображение кнопки отладки в не-продакшн окружениях
/// - Интеграцию с GoRouter для навигации
/// {@endtemplate}
class RootScreen extends StatefulWidget {
  /// {@macro root_screen}
  const RootScreen({required this.navigationShell, super.key});

  /// Текущая ветка навигации от GoRouter
  /// Содержит информацию о текущем состоянии навигации
  final StatefulNavigationShell navigationShell;

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    super.initState();
    // После построения виджета, проверяем состояние кубита обновлений
    // и если есть обновление, то показываем модальное окно
    _checkSoftUpdate();
  }

  /// Проверяет состояние кубита обновлений и показывает модальное окно при наличии мягкого обновления
  void _checkSoftUpdate() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final updateState = context.read<UpdateCubit>().state;

      // Проверяем только состояние успеха с доступной информацией об обновлении
      if (updateState is UpdateSuccessState &&
          updateState.updateInfo?.updateType == UpdateConst.updateTypeSoft &&
          updateState.updateInfo != null) {
        SoftUpdateModal.show(
          context,
          updateEntity: updateState.updateInfo!,
          onUpdate: () {
            // TODO(yura): реализовать логику обновления приложения
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: context.di.env != AppEnv.prod
          ? FloatingActionButton(
              child: const Icon(Icons.bug_report),
              onPressed: () {
                context.pushNamed(DebugRoutes.debugScreenName);
              },
            )
          : null,
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
        currentIndex: widget.navigationShell.currentIndex,
        onTap: widget.navigationShell.goBranch,
      ),
    );
  }
}
