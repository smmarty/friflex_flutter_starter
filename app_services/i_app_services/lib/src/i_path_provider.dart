/// Класс для описания интерфейса сервиса
/// для получения пути хранения файлов
abstract interface class IPathProvider {
  /// Наименования интерфейса
  static const name = 'IPathProvider';

  /// Получение path на внутреннее хранилище приложения
  Future<String?> getAppDocumentsDirectoryPath();
}
