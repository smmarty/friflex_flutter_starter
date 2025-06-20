import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/theme/app_colors_scheme.dart';

/// {@template theme_screen}
/// Экран для отладки и тестирования темы приложения.
///
/// Отвечает за:
/// - Демонстрацию переключения между светлой и темной темами
/// - Отображение тестовых цветов из цветовой схемы
/// - Показ текущего режима темы
/// - Тестирование системы управления темами
/// {@endtemplate}
class ThemeScreen extends StatelessWidget {
  /// {@macro theme_screen}
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ElevatedButton(
              onPressed: () {
                context.theme.changeTheme();
              },
              child: const Text('Сменить тему'),
            ),
            const SizedBox(height: 16),
            ColoredBox(
              color: context.colors.testColor,
              child: const SizedBox(height: 100, width: 100),
            ),
            const SizedBox(height: 16),
            Text('Текущая тема: ${context.theme.themeMode}'),
          ],
        ),
      ),
    );
  }
}
