import 'package:friflex_starter/features/debug/i_debug_service.dart';

/// {@template TimerRunner}
/// Класс для подсчета времени запуска приложения
/// {@endtemplate}
class TimerRunner {
  /// {@macro TimerRunner}
  TimerRunner(this._debugService) {
    _stopwatch.start();
  }

  /// Сервис для отладки
  final IDebugService _debugService;

  /// Секундомер для подсчета времени инициализации
  final _stopwatch = Stopwatch();

  /// Метод для остановки секундомера и вывода времени
  /// полной инициализации приложения
  void stop() {
    _stopwatch.stop();
    _debugService.log(
      'Время инициализации приложения: ${_stopwatch.elapsedMilliseconds} мс',
    );
  }

  /// Метод для обработки прогресса инициализации зависимостей
  void logOnProgress(String name) {
    _debugService.log(
      '$name успешная инициализация, прогресс: ${_stopwatch.elapsedMilliseconds} мс',
    );
  }

  /// Метод для обработки прогресса инициализации зависимостей
  void logOnComplete(String message) {
    _debugService.log(
      '$message, прогресс: ${_stopwatch.elapsedMilliseconds} мс',
    );
    
  }

  /// Метод для обработки прогресса инициализации зависимостей
  void logOnError(
    String message,
    Object error, [
    StackTrace? stackTrace,
  ]) {
    _debugService.logError(() => message, error: error, stackTrace: stackTrace);
  }
}
