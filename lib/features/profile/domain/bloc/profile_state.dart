part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitialState extends ProfileState {}

final class ProfileWaitingState extends ProfileState {}

final class ProfileErrorState extends ProfileState {
  final String message;
  final Object error;
  final StackTrace? stackTrace;

  const ProfileErrorState({
    required this.message,
    required this.error,
    this.stackTrace,
  });

  @override
  List<Object> get props => [message, error];
}

final class ProfileSuccessState extends ProfileState {
  final Object data;

  const ProfileSuccessState({required this.data});

  @override
  List<Object> get props => [data];
}
