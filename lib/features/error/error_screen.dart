import 'package:flutter/material.dart';

/// {@template ErrorScreen}
///  Экран, когда в приложении произошла фатальная ошибка
/// {@endtemplate}
class ErrorScreen extends StatelessWidget {
  /// {@macro ErrorScreen}
  const ErrorScreen({
    super.key,
    required this.error,
    required this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView(
            children: [
              ElevatedButton(
                  onPressed: () {
                    
                  }, child: Text('Перезагрузить приложение')),
              Text(
                '''
Что-то пошло не так, попробуйте перезагрузить приложение
error: $error
              stackTrace: $stackTrace
                ''',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
