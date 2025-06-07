import 'package:flutter/material.dart';
import 'package:friflex_starter/app/ui_kit/app_box.dart';
import 'package:friflex_starter/app/ui_kit/app_snackbar.dart';

/// {@template ComponentsScreen}
/// Экран для демонстрации компонентов приложения.
/// {@endtemplate}
class ComponentsScreen extends StatefulWidget {
  /// {@macro ComponentsScreen}
  const ComponentsScreen({super.key});

  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
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
          ],
        ),
      ),
    );
  }
}
