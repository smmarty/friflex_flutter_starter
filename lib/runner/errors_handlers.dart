part of 'app_runner.dart';

/// Метод инициализации обработчиков ошибок
void _initErrorHandlers(IDebugService debugService) {
  // Обработка ошибок в приложении
  FlutterError.onError = (details) {
    debugService.logError(
      () => 'FlutterError.onError: ${details.exceptionAsString()}',
      error: details.exception,
      stackTrace: details.stack,
    );
  };
  // Обработка асинхронных ошибок в приложении
  PlatformDispatcher.instance.onError = (error, stack) {
    debugService.logError(
      () => 'PlatformDispatcher.instance.onError',
      error: error,
      stackTrace: stack,
    );
    return true;
  };
}
