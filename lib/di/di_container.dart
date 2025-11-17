import 'package:friflex_starter/app/app_config/app_config.dart';
import 'package:friflex_starter/app/app_env.dart';
import 'package:friflex_starter/app/http/app_http_client.dart';
import 'package:friflex_starter/app/http/i_http_client.dart';
import 'package:friflex_starter/di/di_repositories.dart';
import 'package:friflex_starter/di/di_services.dart';
import 'package:friflex_starter/di/di_typedefs.dart';
import 'package:friflex_starter/features/debug/i_debug_service.dart';

/// {@template dependencies_container}
/// Контейнер для зависимостей
/// [env] - окружение приложения
/// [debugService] - сервис для отладки
/// {@endtemplate}
final class DiContainer {
  /// {@macro dependencies_container}
  DiContainer({required this.env, required IDebugService dService})
    : debugService = dService;
  final AppEnv env;

  /// Сервис для отладки, получаем из конструктора
  late final IDebugService debugService;

  /// Конфигурация приложения
  late final IAppConfig appConfig;

  /// Сервис для работы с HTTP запросами
  late final IHttpClient Function(IDebugService, IAppConfig) httpClientFactory;

  /// Репозитории приложения
  late final DiRepositories repositories;

  /// Сервисы приложения
  late final DiServices services;

  /// Метод для инициализации зависимостей
  Future<void> init({
    required OnProgress onProgress,
    required OnComplete onComplete,
    required OnError onError,
  }) async {
    // Инициализация конфигурации приложения
    appConfig = switch (env) {
      .dev => AppConfigDev(),
      .prod => AppConfigProd(),
      .stage => AppConfigStage(),
    };

    // Инициализация HTTP клиента
    httpClientFactory = (debugService, appConfig) =>
        AppHttpClient(debugService: debugService, appConfig: appConfig);

    // Инициализация сервисов
    services = DiServices()
      ..init(onProgress: onProgress, onError: onError, diContainer: this);
    // throw Exception('Тестовая - ошибка инициализации зависимостей');
    // Инициализация репозиториев
    repositories = DiRepositories()
      ..init(onProgress: onProgress, onError: onError, diContainer: this);

    onComplete('Инициализация зависимостей завершена!');
  }
}
