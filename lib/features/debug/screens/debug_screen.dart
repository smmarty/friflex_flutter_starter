import 'package:flutter/material.dart';
import 'package:friflex_starter/app/ui_kit/app_box.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/features/debug/debug_routes.dart';
import 'package:go_router/go_router.dart';

/// {@template debug_screen}
/// Экран для отладки приложения
/// {@endtemplate}
class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug Screen')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Окружение: ${context.di.appConfig.env.name}'),
            const HBox(22),
            Text(
              'Реализация AppServices: ${context.di.services.secureStorage.nameImpl}',
            ),
            const HBox(22),
            ElevatedButton(
              onPressed: () async {
                await context.di.debugService.openDebugScreen(context);
              },
              child: const Text('Вызывать Экран отладки'),
            ),
            const HBox(22),
            const Text('Экраны для отладки:'),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(DebugRoutes.iconsScreenName);
              },
              child: const Text('Экран с иконками'),
            ),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(DebugRoutes.themeScreenName);
              },
              child: const Text('Экран настроек темы'),
            ),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(DebugRoutes.tokensScreenName);
              },
              child: const Text('Экран с токенами'),
            ),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(DebugRoutes.uiKitScreenName);
              },
              child: const Text('Экран UI Kit'),
            ),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(DebugRoutes.langScreenName);
              },
              child: const Text('Экран локализации'),
            ),
            const HBox(22),
            const Text('Имитирование ошибок:'),
            const HBox(16),
            ElevatedButton(
              onPressed: () {
                throw Exception(
                  'Тестовая ошибка Exception для отладки FlutterError',
                );
              },
              child: const Text('Вызывать ошибку FlutterError'),
            ),
            const HBox(16),
            ElevatedButton(
              onPressed: () async {
                await _callError();
              },
              child: const Text('Вызывать ошибку PlatformDispatcher'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _callError() async {
    throw Exception('Тестовая ошибка Exception для отладки PlatformDispatcher');
  }
}
