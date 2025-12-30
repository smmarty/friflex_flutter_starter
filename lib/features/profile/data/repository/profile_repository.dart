import 'package:friflex_starter/app/http/app_http_client.dart';

import 'package:friflex_starter/features/profile/domain/repository/i_profile_repository.dart';

/// {@template ProfileRepository}
///  Реализация репозитория профиля пользователя
/// {@endtemplate}
final class ProfileRepository implements IProfileRepository {
  ProfileRepository({required this.httpClient});

  /// Экземпляр HTTP клиента для взаимодействия с сервером
  final AppHttpClient httpClient;

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
