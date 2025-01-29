part of 'app_runner.dart';

/// Метод инициализации обработчиков ошибок
void _initErrorHandlers(IDebugService debugService) {
  // Обработка ошибок в приложении
  FlutterError.onError = (details) {
    _showErrorScreen();
    debugService.logError(
      () => 'FlutterError.onError: ${details.exceptionAsString()}',
      error: details.exception,
      stackTrace: details.stack,
    );
  };
  // Обработка асинхронных ошибок в приложении
  PlatformDispatcher.instance.onError = (error, stack) {
    _showErrorScreen();
    debugService.logError(
      () => 'PlatformDispatcher.instance.onError',
      error: error,
      stackTrace: stack,
    );
    return true;
  };
}

/// Метод для показа экрана ошибки
void _showErrorScreen() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    AppRouter.rootNavigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => const ErrorScreen(),
      ),
    );
  });
}
