import 'package:flutter/material.dart';

/// {@template ErrorScreen}
///  Экран, когда в приложении произошла фатальная ошибка
/// {@endtemplate}
class ErrorScreen extends StatelessWidget {
  /// {@macro ErrorScreen}
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Что-то пошло не так, попробуйте перезагрузить приложение',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
