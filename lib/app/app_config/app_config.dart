import 'package:envied/envied.dart';
import 'package:friflex_starter/app/app_env.dart';

part 'app_config.g.dart';

/// {@template i_app_config}
/// Интерфейс для конфигурации приложения.
///
/// Определяет обязательные параметры для всех реализаций конфигурации:
/// - Наименование конфигурации
/// - Базовый URL для API
/// - Тип окружения (dev, prod, stage)
/// - Секретный ключ для шифрования данных
/// {@endtemplate}
abstract interface class IAppConfig {
  /// {@macro i_app_config}
  IAppConfig();

  /// Наименование сервиса конфигурации
  String get name => 'IAppConfig';

  /// Основной адрес для запросов к API
  String get baseUrl;

  /// Тип окружения (dev, prod, stage)
  AppEnv get env;

  /// Секретный ключ для шифрования данных
  String get secretKey;
}

/// {@template app_config_dev}
/// Класс для реализации конфигурации приложения в режиме разработки.
///
/// Использует переменные окружения из файла env/dev.env.
/// Предназначен для локальной разработки и тестирования.
/// {@endtemplate}
@Envied(name: 'Dev', path: 'env/dev.env')
class AppConfigDev implements IAppConfig {
  /// {@macro app_config_dev}
  AppConfigDev();

  @override
  AppEnv get env => AppEnv.dev;

  @override
  String get name => 'AppConfigDev';

  @override
  @EnviedField()
  final String baseUrl = _Dev.baseUrl;

  @override
  @EnviedField(obfuscate: true)
  final String secretKey = _Dev.secretKey;
}

/// {@template app_config_prod}
/// Класс для реализации конфигурации приложения в продакшн режиме.
///
/// Использует переменные окружения из файла env/prod.env.
/// Предназначен для финальной сборки приложения.
/// {@endtemplate}
@Envied(name: 'Prod', path: 'env/prod.env')
class AppConfigProd implements IAppConfig {
  /// {@macro app_config_prod}
  AppConfigProd();

  @override
  AppEnv get env => AppEnv.prod;

  @override
  String get name => 'AppConfigProd';

  @override
  @EnviedField(obfuscate: true)
  final String baseUrl = _Prod.baseUrl;

  @override
  @EnviedField(obfuscate: true)
  final String secretKey = _Prod.secretKey;
}

/// {@template app_config_stage}
/// Класс для реализации конфигурации приложения в стейдж режиме.
///
/// Использует переменные окружения из файла env/stage.env.
/// Предназначен для тестирования в среде, близкой к продакшн.
/// {@endtemplate}
@Envied(name: 'Stage', path: 'env/stage.env')
class AppConfigStage implements IAppConfig {
  /// {@macro app_config_stage}
  AppConfigStage();

  @override
  AppEnv get env => AppEnv.stage;

  @override
  String get name => 'AppConfigStage';

  @override
  @EnviedField(obfuscate: true)
  final String baseUrl = _Stage.baseUrl;

  @override
  @EnviedField(obfuscate: true)
  final String secretKey = _Stage.secretKey;
}
