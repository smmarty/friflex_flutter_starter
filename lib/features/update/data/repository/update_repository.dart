import 'package:friflex_starter/app/http/app_http_client.dart';
import 'package:friflex_starter/features/update/domain/entity/update_entity.dart';
import 'package:friflex_starter/features/update/domain/repository/i_update_repository.dart';

/// {@template UpdateRepository}
///  Репозиторий для реализации проверки обновлений
/// {@endtemplate}
final class UpdateRepository implements IUpdateRepository {
  /// {@macro UpdateRepository}
  UpdateRepository({required this.httpClient});

  /// Экземпляр HTTP клиента для взаимодействия с сервером
  final AppHttpClient httpClient;

  @override
  Future<UpdateEntity> checkForUpdates({required String versionCode, required String platform}) {
    // TODO: Реализовать реальную логику проверки обновлений
    // Если обновления нет, возвращаем null
    throw UnimplementedError();
  }

  @override
  String get name => 'UpdateRepository';
}
