import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friflex_starter/features/debug/i_debug_service.dart';

/// Класс реализации интерфейса Debug сервиса
class DebugService implements IDebugService {
  /// Наименование сервиса
  static const name = 'DebugService';

  @override
  void logDebug(Object message, {Object? logLevel, Map<String, dynamic>? args}) {
    if (kDebugMode) {
      print('Message: $message');
    }

    /// Реализация логики
  }

  @override
  void logError(
    Object message, {
    Object? error,
    Object? logLevel,
    Map<String, dynamic>? args,
    StackTrace? stackTrace,
  }) {
    final logMessage = message is Function ? Function.apply(message, []) as Object : message;
    if (kDebugMode) {
      print('Message: $logMessage');
      print('Error: $error');
      print('StackTrace: $stackTrace');
    }

    /// Реализация логики
  }

  @override
  void log(Object message, {Object? logLevel, Map<String, dynamic>? args}) {
    final logMessage = message is Function ? Function.apply(message, []) as Object : message;
    if (kDebugMode) {
      print('Message: $logMessage');
    }

    /// Реализация логики
  }

  @override
  void logWarning(Object message, {Object? logLevel, Map<String, dynamic>? args}) {
    final logMessage = message is Function ? Function.apply(message, []) as Object : message;
    if (kDebugMode) {
      print('Message: $logMessage');
    }

    /// Реализация логики
  }

  @override
  Future<T?> openDebugScreen<T>(BuildContext context, {bool useRootNavigator = false}) {
    if (kDebugMode) {
      print('Переход на страницу отладки');
    }

    /// Реализация логики
    return Future.value();
  }
}
