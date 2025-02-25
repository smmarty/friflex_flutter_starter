import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/features/profile_scope/domain/repository/i_profile_scope_repository.dart';

part 'profile_scope_event.dart';
part 'profile_scope_state.dart';

class ProfileScopeBloc extends Bloc<ProfileScopeEvent, ProfileScopeState> {
  ProfileScopeBloc(this._profileRepository) : super(ProfileScopeInitialState()) {
    // Вам необходимо добавлять только
    // один обработчик событий в конструкторе
    on<ProfileScopeEvent>((event, emit) async {
      if (event is ProfileScopeFetchProfileEvent) {
        await _fetchProfile(event, emit);
      }
    });
  }

  final IProfileScopeRepository _profileRepository;

  Future<void> _fetchProfile(
    ProfileScopeFetchProfileEvent event,
    Emitter<ProfileScopeState> emit,
  ) async {
    try {
      emit(ProfileScopeWaitingState());
      final data = await _profileRepository.fetchUserProfile(event.id);
      emit(ProfileScopeSuccessState(data: data));
    } on Object catch (error, stackTrace) {
      emit(
        ProfileScopeErrorState(
          message: 'Ошибка при загрузке профиля',
          error: error,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
