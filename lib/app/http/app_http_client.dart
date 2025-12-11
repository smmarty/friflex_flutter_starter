import 'package:dio/dio.dart';
import 'package:friflex_starter/app/app_config/app_config.dart';

import 'package:friflex_starter/features/debug/i_debug_service.dart';

/// {@template app_http_client}
///  Класс для реализации HTTP-клиента для управления запросами
/// {@endtemplate}
final class AppHttpClient {
  /// Создает HTTP клиент
  ///
  /// Принимает:
  /// - [debugService] - сервис для логирования запросов
  /// - [appConfig] - конфигурация приложения
  AppHttpClient({required IDebugService debugService, required IAppConfig appConfig}) {
    _httpClient = Dio();

    _httpClient.options
      ..baseUrl = appConfig.baseUrl
      ..connectTimeout = const Duration(seconds: 5)
      ..sendTimeout = const Duration(seconds: 7)
      ..receiveTimeout = const Duration(seconds: 10)
      ..headers = {'Content-Type': 'application/json'};
    debugService.log('HTTP client created');
    _httpClient.interceptors.add(debugService.dioLogger);
  }

  /// Экземпляр HTTP клиента
  late final Dio _httpClient;

  Dio get client => _httpClient;
}
