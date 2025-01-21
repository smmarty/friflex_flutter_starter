/// Класс интерфейса для работы с защищенным хранилищем
abstract interface class ISecureStorage {
  /// Описывает обязательные параметры имплементаций
  ///
  /// Требует:
  /// - [secretKey] - секретный ключ для шифрования данных
  const ISecureStorage._({
    required this.secretKey,
  });

  /// Секретный ключ для шифрования данных
  final String secretKey;

  /// Наименования интерфейса
  static const name = 'ISecureStorage';

  /// Метод для получения значения из защищенного хранилища
  ///
  /// Принимает:
  /// - [key] - ключ
  Future<String?> read(String key);

  /// Метод для записи значения в защищенное хранилище
  ///
  /// Принимает:
  /// - [key] - ключ
  /// - [value] - значение
  Future<void> write(String key, String value);

  /// Метод для удаления значения из защищенного хранилища
  ///
  /// Принимает:
  /// - [key] - ключ
  Future<void> delete(String key);

  /// Метод для очистки защищенного хранилища
  Future<void> clear();

  /// Метод для проверки наличия значения в защищенном хранилище
  ///
  /// Принимает:
  /// - [key] - ключ
  Future<bool> exists(String key);

  String get nameImpl;
}
