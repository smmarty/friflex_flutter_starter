import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                throw Exception(
                    'Тестовая ошибка Exception для отладки FlutterError',);
              },
              child: const Text('Вызывать ошибку FlutterError'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await callError();
              },
              child: const Text('Вызывать ошибку PlatformDispatcher'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await context.di.debugService.openDebugScreen(context);
              },
              child: const Text('Вызывать Экран отладки'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> callError() async {
    throw Exception('Тестовая ошибка Exception для отладки PlatformDispatcher');
  }
}
