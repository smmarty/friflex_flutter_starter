import 'package:dio/dio.dart';

/// Класс для описания интерфейса сервиса по управлению HTTP запросами
abstract interface class IHttpClient {
  /// Описывает поля HTTP клиента
  const IHttpClient();

  /// Наименование сервиса
  static const name = 'IHttpClient';

  /// Метод для реализации запроса GET
  ///
  /// Принимает:
  /// - [path] - путь к ресурсу
  /// - [data] - тело запроса
  /// - [queryParameters] - параметры запроса
  /// - [options] - конфигурация запроса
  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// Метод для реализации запроса POST
  ///
  /// Принимает:
  /// - [path] - путь к ресурсу
  /// - [data] - тело запроса
  /// - [queryParameters] - параметры запроса
  /// - [options] - конфигурация запроса
  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// Метод для реализации запроса PATCH
  ///
  /// Принимает:
  /// - [path] - путь к ресурсу
  /// - [data] - тело запроса
  /// - [queryParameters] - параметры запроса
  /// - [options] - конфигурация запроса
  Future<Response> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// Метод для реализации запроса PUT
  ///
  /// Принимает:
  /// - [path] - путь к ресурсу
  /// - [data] - тело запроса
  /// - [queryParameters] - параметры запроса
  /// - [options] - конфигурация запроса
  Future<Response> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// Метод для реализации запроса DELETE
  ///
  /// Принимает:
  /// - [path] - путь к ресурсу
  /// - [data] - тело запроса
  /// - [queryParameters] - параметры запроса
  /// - [options] - конфигурация запроса
  Future<Response> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// Метод для реализации запроса POST
  ///
  /// Принимает:
  /// - [path] - путь к ресурсу
  /// - [data] - тело запроса
  /// - [queryParameters] - параметры запроса
  /// - [options] - конфигурация запроса
  Future<Response> head(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}
