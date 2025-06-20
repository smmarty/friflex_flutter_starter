import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/features/profile/domain/repository/i_profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

/// {@template profile_bloc}
/// Bloc для управления состоянием профиля пользователя.
///
/// Обрабатывает события загрузки данных профиля и управляет
/// соответствующими состояниями (загрузка, успех, ошибка).
/// {@endtemplate}
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  /// {@macro profile_bloc}
  ProfileBloc(this._profileRepository) : super(ProfileInitialState()) {
    // Регистрируем обработчики событий в конструкторе
    on<ProfileEvent>((event, emit) async {
      if (event is ProfileFetchProfileEvent) {
        await _fetchProfile(event, emit);
      }
    });
  }

  /// Репозиторий для работы с данными профиля
  final IProfileRepository _profileRepository;

  /// Метод для загрузки данных профиля пользователя.
  ///
  /// Принимает:
  /// - [event] - событие с ID пользователя для загрузки
  /// - [emit] - функция для эмиссии состояний
  ///
  /// Последовательность состояний:
  /// 1. ProfileWaitingState - начало загрузки
  /// 2. ProfileSuccessState - успешная загрузка с данными
  /// 3. ProfileErrorState - ошибка загрузки с сообщением
  Future<void> _fetchProfile(
    ProfileFetchProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(ProfileWaitingState());
      final data = await _profileRepository.fetchUserProfile(event.id);
      emit(ProfileSuccessState(data: data));
    } on Object catch (error, stackTrace) {
      emit(
        ProfileErrorState(
          message: 'Ошибка при загрузке профиля',
          error: error,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
