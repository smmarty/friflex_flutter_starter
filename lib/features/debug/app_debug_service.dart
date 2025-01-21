import 'package:flutter/material.dart';
import 'package:friflex_starter/features/debug/i_debug_service.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Класс реализации интерфейса дебаг сервиса
class AppDebugService implements IDebugService {
  /// Наименование сервиса
  static const name = 'GmsDebugService';

  final Talker _talker = TalkerFlutter.init();

  @override
  TalkerBlocObserver createBlocObserver() =>
      TalkerBlocObserver(talker: _talker);

  @override
  TalkerDioLogger createHttpInterceptor() => TalkerDioLogger(talker: _talker);

  @override
  TalkerRouteObserver createRouterObserver() => TalkerRouteObserver(_talker);

  @override
  void error(String msg, [Object? exception, StackTrace? stackTrace]) {
    _talker.error(msg, exception, stackTrace);
  }

  @override
  void handleError(Object error, [StackTrace? stackTrace, String? message]) {
    _talker.handle(error, stackTrace, message);
  }

  @override
  void info(String message) {
    _talker.info(message);
  }

  @override
  void log(String message) {
    _talker.log(message);
  }

  @override
  void warning(String message) {
    _talker.warning(message);
  }

  @override
  Future<T?> openDebugScreen<T>(
    BuildContext context, {
    bool useRootNavigator = false,
  }) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (context) => TalkerScreen(talker: _talker),
      ),
    );
  }
}
