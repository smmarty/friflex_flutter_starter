import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/app_env.dart';
import 'package:friflex_starter/features/debug/debug_routes.dart';
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
class RootScreen extends StatelessWidget {
  /// {@macro root_screen}
  const RootScreen({required this.navigationShell, super.key});

  /// Текущая ветка навигации от GoRouter
  /// Содержит информацию о текущем состоянии навигации
  final StatefulNavigationShell navigationShell;

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
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
      ),
    );
  }
}
