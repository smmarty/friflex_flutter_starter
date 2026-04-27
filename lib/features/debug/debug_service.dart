import 'package:flutter/material.dart';
import 'package:friflex_starter/features/debug/i_debug_service.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// {@template debug_service}
///  Реализация сервиса отладки, с помощью Talker
/// {@endtemplate}
class DebugService implements IDebugService {
  /// {@macro debug_service}
  DebugService() {
    _talker = TalkerFlutter.init();
    _talkerDioLogger = TalkerDioLogger(talker: _talker);
    _talkerRouteObserver = TalkerRouteObserver(_talker);
    _talkerBlocObserver = TalkerBlocObserver(talker: _talker);
  }

  /// Наименование сервиса
  static const name = 'DebugService';

  /// Реализация Talker
  late final Talker _talker;

  /// Реализация TalkerDioLogger
  late final TalkerDioLogger _talkerDioLogger;

  /// Реализация TalkerRouteObserver
  late final TalkerRouteObserver _talkerRouteObserver;

  /// Реализация TalkerBlocLoggerObserver
  late final TalkerBlocObserver _talkerBlocObserver;

  /// Получает TalkerDioLoggerInterceptor
  @override
  TalkerDioLogger get dioLogger => _talkerDioLogger;

  /// Получает TalkerRouteObserver\
  @override
  TalkerRouteObserver get routeObserver => _talkerRouteObserver;

  /// Получает TalkerBlocObserver
  @override
  TalkerBlocObserver get blocObserver => _talkerBlocObserver;

  @override
  void logDebug(
    Object message, {
    Object? logLevel,
    Map<String, dynamic>? args,
  }) {
    _talker.debug(
      message is Function ? Function.apply(message, []) as Object : message,
    );
  }

  @override
  void logError(
    Object message, {
    Object? error,
    Object? logLevel,
    Map<String, dynamic>? args,
    StackTrace? stackTrace,
  }) {
    final logMessage = message is Function
        ? Function.apply(message, []) as Object
        : message;
    _talker.error(logMessage, error, stackTrace);
  }

  @override
  void log(Object message, {Object? logLevel, Map<String, dynamic>? args}) {
    final logMessage = message is Function
        ? Function.apply(message, []) as Object
        : message;
    _talker.log(logMessage);
  }

  @override
  void logWarning(
    Object message, {
    Object? logLevel,
    Map<String, dynamic>? args,
  }) {
    final logMessage = message is Function
        ? Function.apply(message, []) as Object
        : message;
    _talker.warning(logMessage);
  }

  @override
  Future<void> openDebugScreen(
    BuildContext context, {
    bool useRootNavigator = false,
  }) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TalkerScreen(talker: _talker)),
    );
  }
}
