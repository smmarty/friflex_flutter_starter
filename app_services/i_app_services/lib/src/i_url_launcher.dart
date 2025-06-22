/// Класс для описания интерфейса сервиса для запуска URL
abstract interface class IUrlLauncher {
  /// Наименования интерфейса
  static const name = 'IUrlLauncher';

  /// Получение имени имплементации
  String get nameImpl;

  /// Метод для проверки возможности запуска ссылки
  ///
  /// - [url] - ссылка для проверки
  Future<bool> canLaunchUrl(Uri url);

  /// Метод для запуска ссылки
  ///
  /// - [url] - ссылка для запуска
  Future<bool> launchUrl(Uri url);
}
