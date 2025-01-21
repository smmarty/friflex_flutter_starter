import 'package:app_services/app_services.dart';
import 'package:friflex_starter/app/app_config/app_config.dart';
import 'package:friflex_starter/app/app_config/i_app_config.dart';
import 'package:friflex_starter/app/app_env.dart';
import 'package:friflex_starter/app/http/app_http_client.dart';
import 'package:friflex_starter/app/http/i_http_client.dart';
import 'package:friflex_starter/di/di_repositories.dart';
import 'package:friflex_starter/di/di_typedefs.dart';
import 'package:friflex_starter/features/debug/i_debug_service.dart';
import 'package:i_app_services/i_app_services.dart';

/// {@template dependencies_container}
/// Контейнер для зависимостей
/// {@macro composition_process}
/// {@endtemplate}
final class DiContainer {
  /// {@macro dependencies_container}
  DiContainer({required this.env, required IDebugService dService})
      : debugService = dService;
  final AppEnv env;

  /// Сервис для отладки, получаем из конструктора
  late final IDebugService debugService;

  /// Сервис для работы с путями
  late final IPathProvider pathProvider;

  /// Конфигурация приложения
  late final IAppConfig appConfig;

  /// Сервис для работы с локальным хранилищем
  late final ISecureStorage secureStorage;

  /// Сервис для работы с HTTP запросами
  late final IHttpClient httpClient;

  late final DiRepositories repositories;

  /// Метод для инициализации зависимостей
  Future<void> init({
    required OnProgress onProgress,
    required OnComplete onComplete,
    required OnError onError,
  }) async {
    // Инициализация сервисов
    await _initServices(
      onComplete: onComplete,
      onError: onError,
      onProgress: onProgress,
    );

    // Инициализация репозиториев
    repositories = DiRepositories();
    repositories.init(
      onProgress: onProgress,
      onComplete: onComplete,
      onError: onError,
      diContainer: this,
    );

    onComplete('Инициализация зависимостей завершена!');
  }

  /// Метод для инициализации сервисов
  Future<void> _initServices({
    required OnComplete onComplete,
    required OnError onError,
    required OnProgress onProgress,
  }) async {
    appConfig = switch (env) {
      AppEnv.dev => AppConfigDev(),
      AppEnv.prod => AppConfigProd(),
      AppEnv.stage => AppConfigStage()
    };

    httpClient = AppHttpClient(
      debugService: debugService,
      appConfig: appConfig,
    );

    try {
      pathProvider = AppPathProvider();
      onProgress(AppPathProvider.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации ${IPathProvider.name}',
        error: error,
        stackTrace: stackTrace,
      );
    }

    try {
      secureStorage = AppSecureStorage(secretKey: appConfig.secretKey);
      onProgress(AppSecureStorage.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации ${ISecureStorage.name}',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
