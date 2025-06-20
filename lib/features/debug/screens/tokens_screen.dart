import 'package:flutter/material.dart';

/// {@template tokens_screen}
/// Экран для отображения и управления токенами аутентификации.
///
/// Отвечает за:
/// - Отображение текущих токенов доступа и обновления
/// - Демонстрацию работы с токенами в приложении
/// - Тестирование функциональности аутентификации
///
/// В текущей реализации является заглушкой для будущей функциональности.
/// {@endtemplate}
class TokensScreen extends StatelessWidget {
  /// {@macro tokens_screen}
  const TokensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tokens')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Text('Access Token: '),
            SizedBox(height: 16),
            Text('Refresh Token: '),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
