import 'package:friflex_starter/app/http/app_http_client.dart';
import 'package:friflex_starter/features/main/domain/repository/i_main_repository.dart';

/// {@template MainRepository}
///  Реализация репозитория главного сервиса
/// {@endtemplate}
final class MainRepository implements IMainRepository {
  MainRepository({required this.httpClient});

  /// Экземпляр HTTP клиента для взаимодействия с сервером
  final AppHttpClient httpClient;

  @override
  String get name => 'MainRepository';
}
