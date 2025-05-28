import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/theme/app_colors_scheme.dart';
import 'package:friflex_starter/gen/assets.gen.dart';
import 'package:friflex_starter/gen/fonts.gen.dart';

/// {@template LangScreen}
/// Экран для отладки языков приложения
/// {@endtemplate}
class LangScreen extends StatelessWidget {
  /// {@macro LangScreen}
  const LangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lang')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.localization.changeLocal(const Locale('ru', 'RU'));
              },
              child: const Text('Сменить язык на Rусский'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.localization.changeLocal(const Locale('en', 'EN'));
              },
              child: const Text('Сменить язык на Английский'),
            ),
            const SizedBox(height: 16),
            Text(
              'Тестовое слово  bold: ${context.l10n.helloWorld}',
              style: TextStyle(
                color: context.colors.testColor,
                fontFamily: Assets.fonts.montserratBold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Тестовое слово  medium: ${context.l10n.helloWorld}',
              style: TextStyle(
                color: context.colors.testColor,
                fontFamily: FontFamily.montserrat,
              ),
            ),
            const SizedBox(height: 16),
            Text('Текущий язык: ${context.l10n.localeName}'),
          ],
        ),
      ),
    );
  }
}
