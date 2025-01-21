import 'package:friflex_starter/app/http/i_http_client.dart';

import '../../domain/repository/i_auth_repository.dart';

/// {@template AuthRepository}
///
/// {@endtemplate}
final class AuthRepository implements IAuthRepository {
  final IHttpClient httpClient;

  AuthRepository({required this.httpClient});

  @override
  String get name => 'AuthRepository';
}
