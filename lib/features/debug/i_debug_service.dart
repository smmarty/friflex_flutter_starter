import 'package:flutter/material.dart';

/// Интерфейс для сервиса отладки
abstract interface class IDebugService {
  static const name = 'IDebugService';

  /// Наблюдение за dio
  dynamic get dioLogger;

  /// Наблюдение за роутами
  dynamic get routeObserver;

  /// Наблюдение за BLoC
  dynamic get blocObserver;

  /// Метод для логирования сообщений
  void log(
    Object message, {
    Object logLevel,
    Map<String, dynamic>? args,
  });

  /// Метод для логирования предупреждений
  void logWarning(
    Object message, {
    Object logLevel,
    Map<String, dynamic>? args,
  });

  /// Метод для логирования ошибок
  void logError(
    Object message, {
    Object error,
    StackTrace? stackTrace,
    Object logLevel,
    Map<String, dynamic>? args,
  });

  /// Метод для обработки ошибок
  void logDebug(
    Object message, {
    Object logLevel,
    Map<String, dynamic>? args,
  });

  /// Метод для открытия окна отладки
  ///
  /// Принимает:
  /// - [context] - для определения навигатора по нему
  /// - [useRootNavigator] - при true, открывает окно в корневом навигаторе
  Future<void> openDebugScreen(
    BuildContext context, {
    bool useRootNavigator = false,
  });
}
