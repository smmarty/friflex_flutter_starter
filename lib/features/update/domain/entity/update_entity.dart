import 'package:equatable/equatable.dart';

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

  /// Тип обновления (например, 'hard' или 'soft')
  final String updateType;

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
