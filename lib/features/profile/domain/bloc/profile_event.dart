part of 'profile_bloc.dart';

/// {@template profile_event}
/// События для управления состоянием профиля пользователя.
/// {@endtemplate}
sealed class ProfileEvent extends Equatable {
  /// {@macro profile_event}
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

/// {@template profile_event}
/// Событие для загрузки профиля пользователя.
/// {@endtemplate}
final class ProfileFetchProfileEvent extends ProfileEvent {
  /// {@macro profile_event}
  const ProfileFetchProfileEvent({required this.id});

  /// ID пользователя для загрузки профиля
  final String id;

  @override
  List<Object> get props => [id];
}

/// {@template profile_logout_event}
/// Событие для выхода из профиля пользователя.
/// {@endtemplate}
final class ProfileLogoutProfileEvent extends ProfileEvent {
  /// {@macro profile_logout_event}
  const ProfileLogoutProfileEvent();

  @override
  List<Object> get props => [];
}
