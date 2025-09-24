part of 'update_cubit.dart';

/// {@template UpdateState}
///  Состояния для управления процессом обновления приложения
/// {@endtemplate}
sealed class UpdateState extends Equatable {
  const UpdateState();

  @override
  List<Object> get props => [];
}

/// Состояние начальной инициализации
final class UpdateInitialState extends UpdateState {
  const UpdateInitialState();
}

/// Состояние загрузки информации об обновлении
final class UpdateLoadingState extends UpdateState {
  const UpdateLoadingState();
}

/// Состояние успешного получения информации об обновлении
final class UpdateSuccessState extends UpdateState {
  /// {@macro UpdateState}
  const UpdateSuccessState(this.updateInfo);

  final UpdateEntity? updateInfo;

  @override
  List<Object> get props => [updateInfo ?? Object];
}

/// Состояние ошибки при получении информации об обновлении
final class UpdateErrorState extends UpdateState {
  const UpdateErrorState(this.message);

  /// Сообщение об ошибке в UI
  final String message;

  @override
  List<Object> get props => [message];
}
