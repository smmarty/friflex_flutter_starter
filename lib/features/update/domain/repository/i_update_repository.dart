import 'package:friflex_starter/di/di_base_repo.dart';
import 'package:friflex_starter/features/update/domain/entity/update_entity.dart';

/// {@template IUpdateRepository}
///  Интерфейс репозитория для Hard&Soft обновлений
/// {@endtemplate}
abstract interface class IUpdateRepository with DiBaseRepo {
  /// Проверяет наличие обновлений
  /// [versionCode] - текущий код версии приложения
  /// [platform] - платформа (например, 'android' или 'ios')
  /// Возвращает [UpdateEntity] с информацией об обновлении
  /// или null, если обновлений нет
  Future<UpdateEntity?> checkForUpdates({
    required String versionCode,
    required String platform,
  });
}
