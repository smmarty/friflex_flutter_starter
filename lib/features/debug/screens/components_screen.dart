import 'package:flutter/material.dart';
import 'package:friflex_starter/app/ui_kit/app_box.dart';
import 'package:friflex_starter/app/ui_kit/app_snackbar.dart';
import 'package:friflex_starter/features/update/domain/state/cubit/update_cubit.dart';
import 'package:friflex_starter/features/update/presentation/components/soft_modal_sheet.dart';
import 'package:friflex_starter/features/update/update_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// {@template components_screen}
/// Экран для демонстрации и тестирования компонентов приложения.
///
/// Отвечает за:
/// - Демонстрацию различных типов снекбаров (ошибка, успех, информация)
/// - Тестирование кастомных UI компонентов
/// - Предоставление примеров использования компонентов
/// - Валидацию корректности работы компонентов
/// {@endtemplate}
class ComponentsScreen extends StatefulWidget {
  /// {@macro components_screen}
  const ComponentsScreen({super.key});

  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

/// {@template components_screen_state}
/// Состояние экрана компонентов.
///
/// Управляет отображением различных типов снекбаров
/// и демонстрирует их функциональность.
/// {@endtemplate}
class _ComponentsScreenState extends State<ComponentsScreen> {
  /// {@macro components_screen_state}
  _ComponentsScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Компоненты')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                AppSnackBar.showError(
                  context,
                  message:
                      'Произошла ошибка, это просто длинное сообщение, для проверки, которое занимает 3 строчки',
                );
              },
              child: const Text('Показать снекбар с ошибкой'),
            ),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                AppSnackBar.showSuccess(
                  context: context,
                  message:
                      'Все супер, это просто длинное сообщение, для проверки, которое занимает 3 строчки',
                );
              },
              child: const Text('Показать снекбар с успехом'),
            ),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                AppSnackBar.showInfo(context, message: 'Это просто сообщение');
              },
              child: const Text('Показать снекбар с информацией'),
            ),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                final updateCubitState = context.read<UpdateCubit>().state;
                final updateEntity = updateCubitState is UpdateSuccessState
                    ? updateCubitState.updateInfo
                    : null;
                    
                if (updateEntity == null) {
                  AppSnackBar.showInfo(
                    context,
                    message: 'Нет доступной информации об обновлении.',
                  );
                  return;
                }

                SoftUpdateModal.show(
                  context,
                  updateEntity: updateEntity,
                  onUpdate: () {
                    AppSnackBar.showSuccess(
                      context: context,
                      message: 'Начато обновление приложения',
                    );
                  },
                );
              },
              child: const Text('Показать модальное окно обновления'),
            ),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(UpdateRoutes.hardUpdateScreenName);
              },
              child: const Text('Переход на экран Hard Update обновления'),
            ),
          ],
        ),
      ),
    );
  }
}
