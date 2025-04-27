import 'package:app_services/app_services.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/di/di_typedefs.dart';
import 'package:i_app_services/i_app_services.dart';

/// Класс для инициализации сервисов
final class DiServices {
  /// Сервис для работы с путями
  late final IPathProvider pathProvider;

  /// Сервис для работы с локальным хранилищем
  late final ISecureStorage secureStorage;

  /// Метод для инициализации репозиториев в приложении
  ///
  /// Принимает:
  /// - [onProgress] - обратный вызов при прогрессе
  /// - [diContainer] - контейнер зависимостей
  /// - [onError] - обратный вызов при ошибке
  void init({
    required OnProgress onProgress,
    required OnError onError,
    required DiContainer diContainer,
  }) {
    try {
      pathProvider = const AppPathProvider();
      onProgress(AppPathProvider.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации ${IPathProvider.name}',
        error,
        stackTrace,
      );
    }
    try {
      secureStorage = AppSecureStorage(
        secretKey: diContainer.appConfig.secretKey,
      );
      onProgress(AppSecureStorage.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации ${ISecureStorage.name}',
        error,
        stackTrace,
      );
    }

    onProgress('Инициализация сервисов завершена!');
  }
}
