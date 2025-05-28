import 'package:friflex_starter/app/http/i_http_client.dart';

import 'package:friflex_starter/features/main/domain/repository/i_main_repository.dart';

/// {@template MainRepository}
///
/// {@endtemplate}
final class MainRepository implements IMainRepository {
  MainRepository({required this.httpClient});
  final IHttpClient httpClient;

  @override
  String get name => 'MainRepository';
}
