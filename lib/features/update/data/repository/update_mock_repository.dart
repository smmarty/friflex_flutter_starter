import 'package:friflex_starter/features/update/domain/entity/update_entity.dart';
import 'package:friflex_starter/features/update/domain/repository/i_update_repository.dart';
import 'package:friflex_starter/features/update/update_type.dart';

/// Мок обновления обязательное, можно использовать для тестирования
const mockHardUpdateEntity = UpdateEntity(
  availableVersion: '2.0.0',
  updateUrl: 'https://example.com/update',
  updateType: UpdateType.hard,
  whatIsNew: 'Добавлены новые функции и исправлены ошибки.',
);

/// Мок обновления мягкое, можно использовать для тестирования
const mockSoftUpdateEntity = UpdateEntity(
  availableVersion: '2.0.0',
  updateUrl: 'https://example.com/update',
  updateType: UpdateType.soft,
  whatIsNew: 'Добавлены новые функции и исправлены ошибки.',
);

/// {@template UpdateMockRepository}
/// Репозиторий для моковой реализации проверки обновлений
/// {@endtemplate}
final class UpdateMockRepository implements IUpdateRepository {
  /// {@macro UpdateMockRepository}
  const UpdateMockRepository();

  @override
  Future<UpdateEntity> checkForUpdates({
    required String versionCode,
    required String platform,
  }) async {
    // Имитация задержки для асинхронной операции
    await Future<void>.delayed(const Duration(seconds: 1));

    // Возвращаем фиктивные данные об обновлении
    // Можно возвращать [_mockHardUpdateEntity] или [_mockSoftUpdateEntity]
    return mockSoftUpdateEntity;
  }

  @override
  String get name => 'UpdateMockRepository';
}
