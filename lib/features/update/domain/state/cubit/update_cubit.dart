import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/features/update/domain/entity/update_entity.dart';
import 'package:friflex_starter/features/update/domain/repository/i_update_repository.dart';

part 'update_state.dart';

/// {@template UpdateCubit}
/// Кубит для управления состояниями обновления приложения
/// {@endtemplate}
class UpdateCubit extends Cubit<UpdateState> {
  /// {@macro UpdateCubit}
  UpdateCubit(this._updatesRepository) : super(UpdateInitialState());

  /// Репозиторий для проверки обновлений
  final IUpdateRepository _updatesRepository;

  /// Метод для проверки доступности обновлений
  /// [versionCode] - текущий код версии приложения
  /// [platform] - платформа (например, 'android' или 'ios')
  Future<void> checkForUpdates({
    required String versionCode,
    required String platform,
  }) async {
    if (state is UpdateLoadingState) return;
    emit(UpdateLoadingState());
    try {
      final updateInfo = await _updatesRepository.checkForUpdates(
        versionCode: versionCode,
        platform: platform,
      );
      emit(UpdateSuccessState(updateInfo));
    } on Object catch (e, st) {
      emit(UpdateErrorState(e.toString()));
      addError(e, st);
    }
  }
}
