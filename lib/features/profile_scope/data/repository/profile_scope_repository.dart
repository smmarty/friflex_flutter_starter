import 'package:friflex_starter/app/http/i_http_client.dart';

import '../../domain/repository/i_profile_scope_repository.dart';

/// {@template ProfileScopeRepository}
///
/// {@endtemplate}
final class ProfileScopeRepository implements IProfileScopeRepository {
  final IHttpClient httpClient;

  ProfileScopeRepository({required this.httpClient});

  @override
  String get name => 'ProfileScopeRepository';

  @override
  Future<String> fetchUserProfile(String id) async {
    // Какой-то запрос к серверу
    await Future.delayed(const Duration(seconds: 1));
    // httpClient.get('https://example.com/profile/$id');

    return 'Yura Petrov';
  }
}
