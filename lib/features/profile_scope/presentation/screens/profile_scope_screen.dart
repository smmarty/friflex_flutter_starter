import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/features/profile_scope/domain/bloc/profile_scope_bloc.dart';
import 'package:friflex_starter/features/profile_scope/presentation/profile_scope.dart';

// Класс экрана, где мы инициализируем ProfileScopeBloc
class ProfileScopeScreen extends StatelessWidget {
  const ProfileScopeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScope(
      profileRepository: context.di.repositories.profileScopeRepository,
      child: const _ProfileScopeView(),
    );
  }
}

class _ProfileScopeView extends StatelessWidget {
  const _ProfileScopeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Scope'),
      ),
      body: Center(
        child: BlocBuilder<ProfileScopeBloc, ProfileScopeState>(
          bloc: ProfileScope.of(context).profileScopeBloc
            ..add(const ProfileScopeFetchProfileEvent(id: '1')),
          builder: (context, state) {
            return switch (state) {
              ProfileScopeSuccessState() => Text('Data: ${state.props.first}'),
              ProfileScopeErrorState() => Text('Error: ${state.message}'),
              _ => const CircularProgressIndicator(),
            };
          },
        ),
      ),
    );
  }
}
