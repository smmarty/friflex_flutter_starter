import 'package:flutter/material.dart';

/// {@template MainDetailScreen}
///  Вложенный экран для главного экрана приложения
/// {@endtemplate}
class MainDetailScreen extends StatelessWidget {
  /// {@macro MainDetailScreen}
  const MainDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Detail Screen'),
      ),
      body: const Center(
        child: Text('Вложенный экран'),
      ),
    );
  }
}
