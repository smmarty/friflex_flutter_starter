import 'package:friflex_starter/features/auth/domain/repository/i_auth_repository.dart';

/// {@template AuthMockRepository}
/// Mock реализация репозитория авторизации
/// {@endtemplate}
final class AuthMockRepository implements IAuthRepository {
  /// {@macro AuthMockRepository}
  const AuthMockRepository();

  @override
  String get name => 'AuthMockRepository';
}
