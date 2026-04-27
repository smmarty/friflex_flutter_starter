import 'package:i_app_services/i_app_services.dart';

/// {@template app_secure_storage}
/// Класс для HarmonyOS реализации сервиса по работе с защищенным хранилищем
/// {@endtemplate}
final class AppSecureStorage implements ISecureStorage {
  /// Создает сервис для работы с защищенным хранилищем
  ///
  /// Принимает:
  /// - [secretKey] - ключ шифрования данных, если требуется
  AppSecureStorage({required this.secretKey});

  @override
  final String secretKey;

  static const name = 'HarmonyAppSecureStorage';

  @override
  Future<void> delete(String key) async {
    // TODO: Реализовать удаление ключа из HarmonyOS Secure Storage
    throw UnimplementedError();
  }

  @override
  Future<String?> read(String key) async {
    // TODO: Реализовать чтение значения по ключу из HarmonyOS Secure Storage
    throw UnimplementedError();
  }

  @override
  Future<void> write(String key, String value) async {
    // TODO: Реализовать запись значения по ключу в HarmonyOS Secure Storage
    throw UnimplementedError();
  }

  @override
  String get nameImpl => AppSecureStorage.name;

  @override
  Future<bool> containsKey(String key) {
    // TODO: Реализовать проверку наличия ключа в HarmonyOS Secure Storage
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() {
    // TODO: Реализовать удаление всех ключей из HarmonyOS Secure Storage
    throw UnimplementedError();
  }
}
