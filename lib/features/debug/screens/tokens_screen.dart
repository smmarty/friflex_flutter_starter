import 'package:flutter/material.dart';

/// {@template TokensScreen}
///  Экран для отображения токенов
/// {@endtemplate}
class TokensScreen extends StatelessWidget {
  /// {@macro TokensScreen}
  const TokensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tokens')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Text(
              'Access Token: ',
            ),
            SizedBox(height: 16),
            Text(
              'Refresh Token: ',
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
