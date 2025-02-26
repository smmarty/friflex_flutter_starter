import '../../domain/repository/i_profile_scope_repository.dart';

/// {@template ProfileScopeMockRepository}
///
/// {@endtemplate}
final class ProfileScopeMockRepository implements IProfileScopeRepository {
  @override
  String get name => 'ProfileScopeMockRepository';

  @override
  Future<String> fetchUserProfile(String id) async {
    return 'MOCK Yura Petrov';
  }
}
