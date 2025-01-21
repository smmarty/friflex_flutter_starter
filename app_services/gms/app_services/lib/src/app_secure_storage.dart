import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:i_app_services/i_app_services.dart';

/// Класс для базовой реализации сервис по работе с защищенным хранилищем
final class AppSecureStorage implements ISecureStorage {
  /// Создает сервис для работы с защищенным хранилищем
  ///
  /// Принимает:
  /// - [secretKey] - ключ шифрования данных
  AppSecureStorage({required this.secretKey});

  @override
  final String secretKey;

  static const name = 'GmsAppSecureStorage';

  /// Экземпляр хранилища данных
  final _box = const FlutterSecureStorage();

  @override
  Future<void> clear() async {
    await _box.deleteAll();
  }

  @override
  Future<void> delete(String key) async {
    await _box.delete(key: key);
  }

  @override
  Future<bool> exists(String key) {
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
