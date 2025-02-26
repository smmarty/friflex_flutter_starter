import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/features/profile_scope/domain/bloc/profile_scope_bloc.dart';

class ProfileInheritedScope extends InheritedWidget {
  const ProfileInheritedScope({
    required this.profileScopeBloc,
    required super.child,
    super.key,
  });

  final ProfileScopeBloc profileScopeBloc;

  @override
  bool updateShouldNotify(ProfileInheritedScope oldWidget) =>
      profileScopeBloc != oldWidget.profileScopeBloc;
}

class ProfileScope extends StatefulWidget {
  const ProfileScope({
    required this.child,
    super.key,
  });

  final Widget child;

  static ProfileInheritedScope? maybeOf(
    BuildContext context, {
    bool listen = false,
  }) {
    return listen
        ? context.dependOnInheritedWidgetOfExactType<ProfileInheritedScope>()
        : context.getInheritedWidgetOfExactType<ProfileInheritedScope>();
  }

  static ProfileInheritedScope of(
    BuildContext context, {
    bool listen = false,
  }) {
    final result = maybeOf(context, listen: listen);

    if (result == null) {
      throw StateError(
        'ProfileScope is not found above widget ${context.widget}',
      );
    }

    return result;
  }

  @override
  State<StatefulWidget> createState() => _ProfileScopeState();
}

class _ProfileScopeState extends State<ProfileScope> {
  late final ProfileScopeBloc _profileScopeBloc;

  @override
  void initState() {
    super.initState();

    _profileScopeBloc =
        ProfileScopeBloc(profileRepository: context.di.repositories.profileScopeRepository);
    _profileScopeBloc.add(const ProfileScopeFetchProfileEvent(id: '1'));
  }

  @override
  void dispose() {
    _profileScopeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileInheritedScope(profileScopeBloc: _profileScopeBloc, child: widget.child);
  }
}
