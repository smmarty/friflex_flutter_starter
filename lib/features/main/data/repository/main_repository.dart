import 'package:friflex_starter/app/http/i_http_client.dart';

import '../../domain/repository/i_main_repository.dart';

/// {@template MainRepository}
///
/// {@endtemplate}
final class MainRepository implements IMainRepository {
  final IHttpClient httpClient;

  MainRepository({required this.httpClient});

  @override
  String get name => 'MainRepository';
}
