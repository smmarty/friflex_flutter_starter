import 'package:flutter/material.dart';
import 'package:friflex_starter/features/profile_scope/domain/bloc/profile_scope_bloc.dart';
import 'package:friflex_starter/features/profile_scope/domain/repository/i_profile_scope_repository.dart';

// Область, где мы инициализируем ProfileScopeBloc
class ProfileScope extends InheritedWidget {
  late final ProfileScopeBloc profileScopeBloc;

  final IProfileScopeRepository _profileRepository;

  ProfileScope({
    super.key,
    required super.child,
    required IProfileScopeRepository profileRepository,
  }) : _profileRepository = profileRepository {
    profileScopeBloc = ProfileScopeBloc(_profileRepository);
  }

  void dispose() {
    profileScopeBloc.close();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static ProfileScope of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProfileScope>()!;
  }
}
