import 'package:friflex_starter/features/profile/domain/repository/i_profile_repository.dart';

/// {@template ProfileMockRepository}
///
/// {@endtemplate}
final class ProfileMockRepository implements IProfileRepository {
  @override
  String get name => 'ProfileMockRepository';

  @override
  Future<String> fetchUserProfile(String id) {
    return Future.value('MOCK Yura Petrov');
  }
}
