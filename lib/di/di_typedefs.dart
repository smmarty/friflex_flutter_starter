/// Обратный вызов при ошибки инициализации
typedef OnError = void Function(
  String message,
  Object error, [
  StackTrace? stackTrace,
]);

/// Обратный вызов при прогрессе
typedef OnProgress = void Function(String name);

/// Обратный вызов при успешной инициализации
typedef OnComplete = void Function(String msg);
