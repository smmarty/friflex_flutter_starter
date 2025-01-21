import 'package:flutter/material.dart';

/// Интерфейс для сервиса отладки
abstract interface class IDebugService {
  /// Наименование сервиса
  static const name = 'IDebugService';

  /// Метод для создания обработчика для BLoC
  Object createBlocObserver();

  /// Метод для создания обработчика для роутера
  NavigatorObserver createRouterObserver();

  /// Метод для создания обработчика для http-клиентов
  Object createHttpInterceptor();

  /// Метод для логгирования предупреждений
  ///
  /// Принимает:
  /// - [message] - сообщение для логгирования в формате [String]
  void warning(String message);

  /// Метод для логгирования ошибок
  ///
  /// Принимает:
  /// - [message] - сообщение для логгирования в формате [String]
  /// - [exception] - исключение
  /// - [stackTrace] - стек вызова
  void error(String message, [Object? exception, StackTrace? stackTrace]);

  /// Метод для обработки ошибок
  ///
  /// Принимает:
  /// - [error] - исключение
  /// - [stackTrace] - стек вызова
  /// - [message] - сообщение для логгирования в формате [String]
  void handleError(Object error, [StackTrace? stackTrace, String? message]);

  /// Метод для логгирования информативных сообщений
  ///
  /// Принимает:
  /// - [message] - сообщение для логгирования в формате [String]
  void info(String message);

  /// Метод для логгирования сообщений
  ///
  /// Принимает:
  /// - [message] - сообщение для логгирования в формате [String]
  void log(String message);

  /// Метод для открытия окна отладки
  ///
  /// Принимает:
  /// - [context] - для определения навигатора по нему
  /// - [useRootNavigator] - при true, открывает окно в корневом навигаторе
  Future<T?> openDebugScreen<T>(
    BuildContext context, {
    bool useRootNavigator = false,
  });
}
