part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class ProfileFetchProfileEvent extends ProfileEvent {
  final String id;

  const ProfileFetchProfileEvent({required this.id});

  @override
  List<Object> get props => [id];
}
