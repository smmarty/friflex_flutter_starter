import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/theme/app_colors_scheme.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Реализация SecureStorage: ${context.di.secureStorage.nameImpl}',
            ),
            const SizedBox(height: 16),
            Text(
              'Окружение: ${context.di.appConfig.env.name}',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.theme.changeTheme();
              },
              child: const Text('Сменить тему'),
            ),
            const SizedBox(height: 16),
            ColoredBox(
              color: context.colors.testColor,
              child: const SizedBox(height: 100, width: 100),
            ),
            const SizedBox(height: 16),
            Text(
              'Текущая тема: ${context.theme.themeMode}',
            ),
            const SizedBox(height: 16),
            Text(
              'Текущий репозиторий: ${context.di.repositories.authRepository.name}',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.localization.changeLocal(
                  const Locale('ru', 'RU'),
                );
              },
              child: const Text('Сменить язык на Rусский'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.localization.changeLocal(
                  const Locale('en', 'EN'),
                );
              },
              child: const Text('Сменить язык на Английский'),
            ),
            const SizedBox(height: 16),
            Text(
              'Тестовое слово: ${context.l10n.helloWorld}',
            ),
            const SizedBox(height: 16),
            Text(
              'Текущий язык: ${context.l10n.localeName}',
            ),
          ],
        ),
      ),
    );
  }
}
