import 'package:friflex_starter/app/http/i_http_client.dart';

import '../../domain/repository/i_profile_repository.dart';

/// {@template ProfileRepository}
///
/// {@endtemplate}
final class ProfileRepository implements IProfileRepository {
  final IHttpClient httpClient;

  ProfileRepository({required this.httpClient});

  @override
  String get name => 'ProfileRepository';

  @override
  Future<String> fetchUserProfile(String id) async {
    // Какой-то запрос к серверу
    await Future.delayed(const Duration(seconds: 1));
    // httpClient.get('https://example.com/profile/$id');

    return 'Yura Petrov';
  }
}
