part of 'update_cubit.dart';

/// {@template UpdateState}
///  Состояния для управления процессом обновления приложения
/// {@endtemplate}
sealed class UpdateState extends Equatable {
  /// {@macro UpdateState}
  const UpdateState();

  @override
  List<Object?> get props => [];
}

/// {@template UpdateInitialState}
///  Состояние начальной инициализации
/// {@endtemplate}
final class UpdateInitialState extends UpdateState {
  /// {@macro UpdateInitialState}
  const UpdateInitialState();
}

/// {@template UpdateLoadingState}
///  Состояние загрузки информации об обновлении
/// {@endtemplate}
final class UpdateLoadingState extends UpdateState {
  /// {@macro UpdateLoadingState}
  const UpdateLoadingState();
}

/// {@template UpdateSuccessState}
///  Состояние успешного получения информации об обновлении
/// {@endtemplate}
final class UpdateSuccessState extends UpdateState {
  /// {@macro UpdateSuccessState}
  const UpdateSuccessState(this.updateInfo);

  /// Информация об обновлении
  final UpdateEntity? updateInfo;

  @override
  List<Object?> get props => [updateInfo];
}

/// {@template UpdateErrorState}
///  Состояние ошибки при получении информации об обновлении
/// {@endtemplate}
final class UpdateErrorState extends UpdateState {
  /// {@macro UpdateErrorState}
  const UpdateErrorState(this.message);

  /// Сообщение об ошибке в UI
  final String message;

  @override
  List<Object> get props => [message];
}
