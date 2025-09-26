import 'package:friflex_starter/features/update/domain/entity/update_entity.dart';
import 'package:friflex_starter/features/update/domain/repository/i_update_repository.dart';

/// {@template UpdateRepository}
///  Репозиторий для реализации проверки обновлений
/// {@endtemplate}
final class UpdateRepository implements IUpdateRepository {
  /// {@macro UpdateRepository}
  const UpdateRepository();

  @override
  Future<UpdateEntity> checkForUpdates({
    required String versionCode,
    required String platform,
  }) {
    // TODO: Реализовать реальную логику проверки обновлений
    // Если обновления нет, возвращаем null
    throw UnimplementedError();
  }

  @override
  String get name => 'UpdateRepository';
}
