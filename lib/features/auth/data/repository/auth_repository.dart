import 'package:friflex_starter/app/http/app_http_client.dart';

import 'package:friflex_starter/features/auth/domain/repository/i_auth_repository.dart';

/// {@template AuthRepository}
///  Реализация репозитория авторизации
/// {@endtemplate}
final class AuthRepository implements IAuthRepository {
  AuthRepository({required this.httpClient});

  /// Экземпляр HTTP клиента для взаимодействия с сервером
  final AppHttpClient httpClient;

  @override
  String get name => 'AuthRepository';
}
