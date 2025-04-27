import 'package:flutter/material.dart';

/// {@template UiKitScreen}
///  Экран для отрисовки UI Kit
///  и тестирования его компонентов.
/// {@endtemplate}
class UiKitScreen extends StatelessWidget {
  /// {@macro UiKitScreen}
  const UiKitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Kit Screen'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Text(
              'UI Kit Screen',
            ),
            SizedBox(height: 16),
            // Здесь можно добавить другие компоненты UI Kit
          ],
        ),
      ),
    );
  }
}
