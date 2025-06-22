import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/ui_kit/app_box.dart';
import 'package:friflex_starter/app/ui_kit/app_snackbar.dart';
import 'package:i_app_services/i_app_services.dart';

/// {@template url_launcher_screen}
/// Экран для отладки и тестирования плагина url_launcher.
///
/// Отвечает за:
/// - Тестирование работы реализаций плагина для проверки открытия URL
/// {@endtemplate}
class UrlLauncherScreen extends StatefulWidget {
  /// {@macro url_launcher_screen}
  const UrlLauncherScreen({super.key});

  @override
  State<UrlLauncherScreen> createState() => _UrlLauncherScreenState();
}

class _UrlLauncherScreenState extends State<UrlLauncherScreen> {
  /// Плагин для работы с URL
  late final IUrlLauncher _urlLauncher;

  /// Контроллер для ввода URL для открытия
  final TextEditingController _urlController = TextEditingController();

  /// Контроллер для ввода URL для проверки возможности открытия
  final TextEditingController _canOpenUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _urlLauncher = context.di.services.urlLauncher;
  }

  @override
  void dispose() {
    _urlController.dispose();
    _canOpenUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('URL Launcher')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Реализация Url Launcher: ${context.di.services.urlLauncher.nameImpl}'),
            const HBox(8),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(labelText: 'Введите ссылку'),
            ),
            const HBox(16),
            ElevatedButton(
              onPressed: () => _launchUrl(context),
              child: const Text('Открыть ссылку'),
            ),
            const HBox(16),
            TextField(
              controller: _canOpenUrlController,
              decoration: const InputDecoration(labelText: 'Введите ссылку'),
            ),
            const HBox(16),
            ElevatedButton(
              onPressed: () => _checkCanOpenUrl(context),
              child: const Text('Проверить возможность открытия'),
            ),
          ],
        ),
      ),
    );
  }

  /// Метод для открытия URL
  Future<void> _launchUrl(BuildContext context) async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      AppSnackBar.showInfo(context, message: 'Введите ссылку для открытия');
      return;
    }

    final uri = Uri.tryParse(url);
    if (uri == null) {
      AppSnackBar.showError(context, message: 'Некорректная ссылка: $url');
      return;
    }

    try {
      final success = await _urlLauncher.launchUrl(uri);
      if (!context.mounted) return;
      if (!success) {
        AppSnackBar.showError(context, message: 'Не удалось открыть ссылку: $url');
      }
    } on Object catch (e) {
      if (!context.mounted) return;
      AppSnackBar.showError(context, message: 'Ошибка при открытии ссылки: $e');
    }
  }

  /// Метод для проверки возможности открытия URL
  Future<void> _checkCanOpenUrl(BuildContext context) async {
    final url = _canOpenUrlController.text.trim();
    if (url.isEmpty) {
      AppSnackBar.showInfo(context, message: 'Введите ссылку для проверки');
      return;
    }

    final uri = Uri.tryParse(url);
    if (uri == null) {
      AppSnackBar.showError(context, message: 'Некорректная ссылка: $url');
      return;
    }

    try {
      final canOpen = await _urlLauncher.canLaunchUrl(uri);
      if (!context.mounted) return;
      if (canOpen) {
        AppSnackBar.showSuccess(context: context, message: 'Возможно открыть ссылку: $url');
      } else {
        AppSnackBar.showError(context, message: 'Не удалось открыть ссылку: $url');
      }
    } on Object catch (e) {
      if (!context.mounted) return;
      AppSnackBar.showError(context, message: 'Ошибка при проверке ссылки: $e');
    }
  }
}
