import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/features/profile_scope/domain/bloc/profile_scope_bloc.dart';

// Область, где мы инициализируем ProfileScopeBloc
class ProfileScope extends StatefulWidget {
  const ProfileScope({super.key, required this.child});

  final Widget child;

  @override
  State<ProfileScope> createState() => _ProfileScopeState();
}

class _ProfileScopeState extends State<ProfileScope> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileScopeBloc(context.di.repositories.profileScopeRepository)
            ..add(const ProfileScopeFetchProfileEvent(id: '1')),
      child: widget.child,
    );
  }
}
