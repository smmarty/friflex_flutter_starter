import '../../domain/repository/i_auth_repository.dart';

/// {@template AuthMockRepository}
///
/// {@endtemplate}
final class AuthMockRepository implements IAuthRepository {
  @override
  String get name => 'AuthMockRepository';
}
