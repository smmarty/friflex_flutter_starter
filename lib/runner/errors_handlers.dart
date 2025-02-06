part of 'app_runner.dart';

/// Метод инициализации обработчиков ошибок
void _initErrorHandlers(IDebugService debugService) {
  // Обработка ошибок в приложении
  FlutterError.onError = (details) {
    _showErrorScreen(details.exception, details.stack);
    debugService.logError(
      () => 'FlutterError.onError: ${details.exceptionAsString()}',
      error: details.exception,
      stackTrace: details.stack,
    );
  };
  // Обработка асинхронных ошибок в приложении
  PlatformDispatcher.instance.onError = (error, stack) {
    _showErrorScreen(error, stack);
    debugService.logError(
      () => 'PlatformDispatcher.instance.onError',
      error: error,
      stackTrace: stack,
    );
    return true;
  };
}

/// Метод для показа экрана ошибки
void _showErrorScreen(Object error, StackTrace? stackTrace) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    AppRouter.rootNavigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => ErrorScreen(error: error, stackTrace: stackTrace),
      ),
    );
  });
}
