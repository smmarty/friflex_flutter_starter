import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:i_app_services/i_app_services.dart';

/// {@template app_secure_storage}
/// Класс для базовой реализации сервиса работы с защищенным хранилищем.
///
/// Использует flutter_secure_storage для безопасного хранения данных.
/// Поддерживает все основные операции с защищенным хранилищем.
/// {@endtemplate}
final class AppSecureStorage implements ISecureStorage {
  /// {@macro app_secure_storage}
  AppSecureStorage({this.secretKey});

  @override
  final String? secretKey;

  /// Наименование сервиса
  static const name = 'BaseAppSecureStorage';

  /// Экземпляр хранилища данных
  final _box = const FlutterSecureStorage();

  @override
  Future<void> deleteAll() async {
    await _box.deleteAll();
  }

  @override
  Future<void> delete(String key) async {
    await _box.delete(key: key);
  }

  @override
  Future<bool> containsKey(String key) {
    return _box.containsKey(key: key);
  }

  @override
  Future<String?> read(String key) async {
    return _box.read(key: key);
  }

  @override
  Future<void> write(String key, String value) async {
    await _box.write(key: key, value: value);
  }

  @override
  String get nameImpl => AppSecureStorage.name;
}
