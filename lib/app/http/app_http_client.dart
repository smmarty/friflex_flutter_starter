import 'package:dio/dio.dart';
import 'package:friflex_starter/app/app_config/i_app_config.dart';
import 'package:friflex_starter/app/app_env.dart';
import 'package:friflex_starter/app/http/i_http_client.dart';
import 'package:friflex_starter/features/debug/i_debug_service.dart';

/// Класс для реализации HTTP-клиента для управления запросами
final class AppHttpClient implements IHttpClient {
  /// Создает HTTP клиент
  ///
  /// Принимает:
  /// - [debugService] - сервис для логирования запросов
  /// - [appConfig] - конфигурация приложения
  AppHttpClient({
    required IDebugService debugService,
    required IAppConfig appConfig,
  }) {
    _httpClient = Dio();
    _appConfig = appConfig;

    _httpClient.options
      ..baseUrl = appConfig.baseUrl
      ..connectTimeout = const Duration(seconds: 5)
      ..sendTimeout = const Duration(seconds: 7)
      ..receiveTimeout = const Duration(seconds: 10)
      ..headers = {
        'Content-Type': 'application/json',
      };

    // Добавление интерцептора для логирования запросов
    if (appConfig.env != AppEnv.prod) {
      final interceptor = debugService.createHttpInterceptor();
      if (interceptor is Interceptor) {
        _httpClient.interceptors.add(interceptor);
      }
    }
  }

  /// Конфигурация приложения
  late final IAppConfig _appConfig;

  /// Экземпляр HTTP клиента
  late final Dio _httpClient;

  @override
  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    _httpClient.options.baseUrl = _appConfig.baseUrl;

    return _httpClient.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    _httpClient.options.baseUrl = _appConfig.baseUrl;

    return _httpClient.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    _httpClient.options.baseUrl = _appConfig.baseUrl;

    return _httpClient.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    _httpClient.options.baseUrl = _appConfig.baseUrl;

    return _httpClient.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    _httpClient.options.baseUrl = _appConfig.baseUrl;

    return _httpClient.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  @override
  Future<Response> head(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    _httpClient.options.baseUrl = _appConfig.baseUrl;

    return _httpClient.head(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
