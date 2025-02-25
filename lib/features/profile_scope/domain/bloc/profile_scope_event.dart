part of 'profile_scope_bloc.dart';

sealed class ProfileScopeEvent extends Equatable {
  const ProfileScopeEvent();

  @override
  List<Object> get props => [];
}

final class ProfileScopeFetchProfileEvent extends ProfileScopeEvent {
  final String id;

  const ProfileScopeFetchProfileEvent({required this.id});

  @override
  List<Object> get props => [id];
}
