import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/features/profile/domain/repository/i_profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._profileRepository) : super(ProfileInitialState()) {
    // Вам необходимо добавлять только
    // один обработчик событий в конструкторе
    on<ProfileEvent>((event, emit) async {
      if (event is ProfileFetchProfileEvent) {
        await _fetchProfile(event, emit);
      }
    });
  }

  final IProfileRepository _profileRepository;

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
