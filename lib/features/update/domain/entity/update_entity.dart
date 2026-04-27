import 'package:equatable/equatable.dart';
import 'package:friflex_starter/features/update/update_type.dart';

/// {@template UpdateEntity}
///  Сущность для представления информации об обновлении
/// {@endtemplate}
class UpdateEntity extends Equatable {
  /// {@macro UpdateEntity}
  const UpdateEntity({
    required this.availableVersion,
    required this.updateUrl,
    required this.updateType,
    required this.whatIsNew,
  });

  /// Доступная версия обновления
  final String availableVersion;

  /// URL для загрузки обновления
  final String updateUrl;

  /// Тип обновления (например, 'hard' или 'soft', или не требуется)
  final UpdateType updateType;

  /// Описание изменений в обновлении
  final String whatIsNew;

  @override
  List<Object?> get props => [
    availableVersion,
    updateUrl,
    updateType,
    whatIsNew,
  ];
}
