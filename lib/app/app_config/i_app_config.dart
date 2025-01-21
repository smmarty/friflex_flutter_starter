import 'package:friflex_starter/app/app_env.dart';

/// Класс для описания интерфейса конфигурации
abstract interface class IAppConfig {
  /// Наименование сервиса
  String get name => 'IAppConfig';

  /// Основной адрес для запросов к API
  String get baseUrl;

  /// Тип окружения
  AppEnv get env;

  /// Секретный ключ для шифрования данных
  String get secretKey;
}
