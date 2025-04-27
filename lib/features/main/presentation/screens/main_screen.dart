import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_box.dart';
import 'package:friflex_starter/features/main/presentation/main_routes.dart';
import 'package:go_router/go_router.dart';

/// {@template MainScreen}
/// Главный экран приложения
/// {@endtemplate}
class MainScreen extends StatelessWidget {
  /// {@macro MainScreen}
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Главный экран приложения'),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                // Переход на экран с деталями
                context.pushNamed(MainRoutes.mainDetailScreenName);
              },
              child: const Text('Переход на экран с деталями'),
            ),
          ],
        ),
      ),
    );
  }
}
