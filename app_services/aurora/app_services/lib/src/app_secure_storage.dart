import 'package:i_app_services/i_app_services.dart';

/// {@template app_secure_storage}
/// Класс для Aurora реализации сервис по работе с защищенным хранилищем
/// [secretKey] - ключ для шифрования данных, обязательный параметр для Авроры
/// {@endtemplate}
final class AppSecureStorage implements ISecureStorage {
  /// Создает сервис для работы с защищенным хранилищем
  ///
  /// Принимает:
  /// - [secretKey] - ключ шифрования данных
  AppSecureStorage({required this.secretKey}) {
    // Инициализация Aurora Secure Storage с ключом шифрования
    // FlutterSecureStorageAurora.setSecret(secretKey);
  }

  @override
  final String secretKey;

  static const name = 'AuroraAppSecureStorage';

  @override
  Future<void> delete(String key) async {
    // TODO: Реализовать удаление ключа из Aurora Secure Storage
    throw UnimplementedError();
  }

  @override
  Future<String?> read(String key) async {
    // TODO: Реализовать чтение значения по ключу из Aurora Secure Storage
    throw UnimplementedError();
  }

  @override
  Future<void> write(String key, String value) async {
    // TODO: Реализовать запись значения по ключу в Aurora Secure Storage
    throw UnimplementedError();
  }

  @override
  String get nameImpl => AppSecureStorage.name;

  @override
  Future<bool> containsKey(String key) {
    // TODO: Реализовать проверку наличия ключа в Aurora Secure Storage
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() {
    // TODO: Реализовать удаление всех ключей из Aurora Secure Storage
    throw UnimplementedError();
  }
}
