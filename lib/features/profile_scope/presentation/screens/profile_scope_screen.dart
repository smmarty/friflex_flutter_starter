import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/features/profile_scope/domain/bloc/profile_scope_bloc.dart';
import 'package:friflex_starter/features/profile_scope/presentation/profile_scope.dart';

// Класс экрана, где мы инициализируем ProfileScopeBloc
class ProfileScopeScreen extends StatelessWidget {
  const ProfileScopeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScope(
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile Scope')),
        body: Center(
          child: BlocBuilder<ProfileScopeBloc, ProfileScopeState>(
            bloc: ProfileScope.of(context).profileScopeBloc,
            builder: (context, state) {
              return switch (state) {
                ProfileScopeSuccessState() => Text('Data: ${state.props.first}'),
                ProfileScopeErrorState() => Text('Error: ${state.message}'),
                _ => const CircularProgressIndicator(),
              };
            },
          ),
        ),
      ),
    );
  }
}
