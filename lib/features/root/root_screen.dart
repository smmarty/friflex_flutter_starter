import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/app_env.dart';
import 'package:friflex_starter/features/debug/debug_routes.dart';
import 'package:go_router/go_router.dart';

/// Класс для реализации корневой страницы приложения
class RootScreen extends StatelessWidget {
  /// Создает корневую страницу приложения
  ///
  /// Принимает:
  /// - [navigationShell] - текущая ветка навигации
  const RootScreen({required this.navigationShell, super.key});

  /// Текущая ветка навигации
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
      ),
    );
  }
}
