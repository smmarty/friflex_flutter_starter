part of 'app_runner.dart';

/// Метод инициализации обработчиков ошибок
void _initErrorHandlers(IDebugService debugService) {
  // Обработка ошибок в приложении
  FlutterError.onError = (details) {
    _showErrorScreen();
    debugService.handleError(details.exception, details.stack,
        'FlutterError.onError: ${details.exceptionAsString()}',);
  };
  // Обработка асинхронных ошибок в приложении
  PlatformDispatcher.instance.onError = (error, stack) {
    _showErrorScreen();
    debugService.handleError(error, stack, 'PlatformDispatcher: $error');
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
