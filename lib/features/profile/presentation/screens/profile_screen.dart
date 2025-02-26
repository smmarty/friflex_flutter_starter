import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/features/profile/domain/bloc/profile_bloc.dart';

// Класс экрана, где мы инициализируем ProfileBloc
// и вызываем событие ProfileFetchProfileEvent
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileRepository = context.di.repositories.profileRepository;
    // Здесь мы инициализируем ProfileBloc
    // и вызываем событие ProfileFetchProfileEvent
    // Или любые другие события, которые вам нужны
    return BlocProvider(
      create: (context) => ProfileBloc(profileRepository)
        ..add(const ProfileFetchProfileEvent(id: '1')),
      child: const _ProfileScreenView(),
    );
  }
}

/// Виджет, который отображает UI экрана
class _ProfileScreenView extends StatelessWidget {
  const _ProfileScreenView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return switch (state) {
              ProfileSuccessState() => Text('Data: ${state.props.first}'),
              ProfileErrorState() => Text('Error: ${state.message}'),
              _ => const CircularProgressIndicator(),
            };
          },
        ),
      ),
    );
  }
}
