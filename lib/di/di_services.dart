import 'package:app_services/app_services.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/di/di_typedefs.dart';
import 'package:i_app_services/i_app_services.dart';

/// {@template di_services}
/// Класс для инициализации и управления сервисами приложения.
///
/// Отвечает за:
/// - Инициализацию сервисов для работы с путями
/// - Инициализацию сервисов для работы с защищенным хранилищем
/// - Уведомление о прогрессе инициализации
/// - Обработку ошибок инициализации сервисов
/// {@endtemplate}
final class DiServices {
  /// {@macro di_services}
  DiServices();

  /// Сервис для работы с путями файловой системы
  late final IPathProvider pathProvider;

  /// Сервис для работы с защищенным локальным хранилищем
  late final ISecureStorage secureStorage;

  /// Сервис для работы с геолокацией
  late final ILocationService locationService;

  /// Метод для инициализации сервисов в приложении.
  ///
  /// Принимает:
  /// - [onProgress] - обратный вызов для уведомления о прогрессе инициализации
  /// - [diContainer] - контейнер зависимостей с конфигурацией приложения
  /// - [onError] - обратный вызов для обработки ошибок инициализации
  ///
  /// Последовательность инициализации:
  /// 1. Инициализация сервиса путей (AppPathProvider)
  /// 2. Инициализация защищенного хранилища (AppSecureStorage)
  void init({
    required OnProgress onProgress,
    required OnError onError,
    required DiContainer diContainer,
  }) {
    try {
      pathProvider = const AppPathProvider();
      onProgress(AppPathProvider.name);
    } on Object catch (error, stackTrace) {
      onError('Ошибка инициализации ${IPathProvider.name}', error, stackTrace);
    }
    try {
      secureStorage = AppSecureStorage(
        secretKey: diContainer.appConfig.secretKey,
      );
      onProgress(AppSecureStorage.name);
    } on Object catch (error, stackTrace) {
      onError('Ошибка инициализации ${ISecureStorage.name}', error, stackTrace);
    }

    try {
      locationService = const AppLocationService();
      onProgress(AppLocationService.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации ${ILocationService.name}',
        error,
        stackTrace,
      );
    }

    onProgress('Инициализация сервисов завершена!');
  }
}
