import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Класс для реализации корневой страницы приложения
class RootScreen extends StatelessWidget {
  /// Создает корневую страницу приложения
  ///
  /// Принимает:
  /// - [navigationShell] - текущая ветка навигации
  const RootScreen({
    super.key,
    required this.navigationShell,
  });

  /// Текущая ветка навигации
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bug_report), label: 'Debug'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
      ),
    );
  }
}
