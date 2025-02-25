part of 'profile_scope_bloc.dart';

sealed class ProfileScopeState extends Equatable {
  const ProfileScopeState();

  @override
  List<Object> get props => [];
}

final class ProfileScopeInitialState extends ProfileScopeState {}

final class ProfileScopeWaitingState extends ProfileScopeState {}

final class ProfileScopeErrorState extends ProfileScopeState {
  final String message;
  final Object error;
  final StackTrace? stackTrace;

  const ProfileScopeErrorState({
    required this.message,
    required this.error,
    this.stackTrace,
  });

  @override
  List<Object> get props => [message, error];
}

final class ProfileScopeSuccessState extends ProfileScopeState {
  final Object data;

  const ProfileScopeSuccessState({required this.data});

  @override
  List<Object> get props => [data];
}
