part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class ProfileFetchProfileEvent extends ProfileEvent {
  const ProfileFetchProfileEvent({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}
