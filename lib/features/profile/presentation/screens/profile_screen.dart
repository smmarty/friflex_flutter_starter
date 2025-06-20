import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/features/profile/domain/bloc/profile_bloc.dart';

/// {@template profile_screen}
/// Экран профиля пользователя.
///
/// Отвечает за:
/// - Инициализацию ProfileBloc с репозиторием профиля
/// - Отображение данных профиля пользователя
/// - Обработку состояний загрузки, успеха и ошибок
/// {@endtemplate}
class ProfileScreen extends StatelessWidget {
  /// {@macro profile_screen}
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileRepository = context.di.repositories.profileRepository;
    // Инициализируем ProfileBloc с репозиторием и загружаем данные профиля
    return BlocProvider(
      create: (context) =>
          ProfileBloc(profileRepository)
            ..add(const ProfileFetchProfileEvent(id: '1')),
      child: const _ProfileScreenView(),
    );
  }
}

/// {@template profile_screen_view}
/// Виджет для отображения UI экрана профиля.
///
/// Отображает данные профиля в зависимости от состояния ProfileBloc:
/// - Индикатор загрузки во время получения данных
/// - Данные профиля при успешной загрузке
/// - Сообщение об ошибке при неудачной загрузке
/// {@endtemplate}
class _ProfileScreenView extends StatelessWidget {
  /// {@macro profile_screen_view}
  const _ProfileScreenView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
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
