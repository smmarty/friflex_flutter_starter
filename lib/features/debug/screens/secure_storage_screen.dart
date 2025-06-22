import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/ui_kit/app_box.dart';
import 'package:friflex_starter/app/ui_kit/app_snackbar.dart';
import 'package:i_app_services/i_app_services.dart';

/// {@template secure_storage_screen}
/// Экран для отладки и тестирования плагина flutter_secure_storage.
///
/// Отвечает за:
/// - Тестирование работы реализаций плагина для провеки записи и чтения защищенных данных
/// {@endtemplate}
class SecureStorageScreen extends StatefulWidget {
  /// {@macro secure_storage_screen}
  const SecureStorageScreen({super.key});

  @override
  State<SecureStorageScreen> createState() => _SecureStorageScreenState();
}

class _SecureStorageScreenState extends State<SecureStorageScreen> {
  /// Плагин для работы с защищенным хранилищем
  late final ISecureStorage _secureStorage;

  /// Контроллер для ввода ключа
  final TextEditingController _keyController = TextEditingController();

  /// Контроллер для ввода значения
  final TextEditingController _valueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _secureStorage = context.di.services.secureStorage;
  }

  @override
  void dispose() {
    _keyController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Secure Storage')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Реализация Secure Storage: ${context.di.services.secureStorage.nameImpl}'),
            const HBox(8),
            TextField(
              controller: _keyController,
              onChanged: (value) {
                _valueController.clear();
              },
              decoration: const InputDecoration(labelText: 'Ключ'),
            ),
            const HBox(8),
            TextField(
              controller: _valueController,
              decoration: const InputDecoration(labelText: 'Значение'),
            ),
            const HBox(8),
            ElevatedButton(
              onPressed: () => _handleWrite(context),
              child: const Text('Записать в Secure Storage'),
            ),
            const HBox(8),
            ElevatedButton(
              onPressed: () => _handleRead(context),
              child: const Text('Прочитать из Secure Storage'),
            ),
            const HBox(8),
            ElevatedButton(
              onPressed: () => _handleDelete(context),
              child: const Text('Удалить из Secure Storage'),
            ),
          ],
        ),
      ),
    );
  }

  /// Обработчик для записи значения в Secure Storage
  Future<void> _handleWrite(BuildContext context) async {
    final key = _keyController.text;
    final value = _valueController.text;
    try {
      await _secureStorage.write(key, value);
      if (!context.mounted) return;
      AppSnackBar.showSuccess(context: context, message: 'Значение записано в Secure Storage');
    } on Object catch (e) {
      AppSnackBar.showError(context, message: 'Ошибка записи: $e');
    }
  }

  /// Обработчик для чтения значения из Secure Storage
  Future<void> _handleRead(BuildContext context) async {
    final key = _keyController.text;
    try {
      final value = await _secureStorage.read(key) ?? 'Значение не найдено';
      _valueController.value = TextEditingValue(text: value);
    } on Object catch (e) {
      if (!context.mounted) return;
      AppSnackBar.showError(context, message: 'Ошибка чтения: $e');
    }
  }

  /// Обработчик для удаления значения из Secure Storage
  Future<void> _handleDelete(BuildContext context) async {
    final key = _keyController.text;
    try {
      await _secureStorage.delete(key);
      if (!context.mounted) return;
      _valueController.clear();
      AppSnackBar.showSuccess(context: context, message: 'Значение удалено из Secure Storage');
    } on Object catch (e) {
      AppSnackBar.showError(context, message: 'Ошибка удаления: $e');
    }
  }
}
