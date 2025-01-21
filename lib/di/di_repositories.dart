import 'package:friflex_starter/app/app_env.dart';
import 'package:friflex_starter/di/di_base_repo.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/di/di_typedefs.dart';
import 'package:friflex_starter/features/auth/data/repository/auth_mock_repository.dart';
import 'package:friflex_starter/features/auth/data/repository/auth_repository.dart';
import 'package:friflex_starter/features/auth/domain/repository/i_auth_repository.dart';
import 'package:friflex_starter/features/main/data/repository/main_mock_repository.dart';
import 'package:friflex_starter/features/main/data/repository/main_repository.dart';
import 'package:friflex_starter/features/main/domain/repository/i_main_repository.dart';

/// Список названий моковых репозиториев, которые должны быть подменены
/// для использования в сборке stage окружения
///
/// Для того, чтобы репозиторий был автоматически подменен на моковый в stage
/// сборке, необходимо в этом списке указать название мокового репозитория,
/// обращаясь к соответствующему полю name.
///
/// Пример:
/// ```
///   [ AuthCheckRepositoryMock().name, ]
/// ```
final List<String> _mockReposToSwitch = [];

/// Класс для инициализации репозиториев в приложении
///
/// По умолчанию репозиторию присваивается моковая реализация.
/// В зависимости от окружения либо выполняется подмена репозиторий,
/// либо используется моковый.
final class DiRepositories {
  /// Интерфейс для работы с репозиторием авторизации
  late final IAuthRepository authRepository;

  /// Интерфейс для работы с репозиторием главного сервиса
  late final IMainRepository mainRepository;

  /// Метод для инициализации репозиториев в приложении
  ///
  /// Принимает:
  /// - [onProgress] - обратный вызов при прогрессе
  /// - [onComplete] - обратный вызов при успешной инициализации
  /// - [diContainer] - контейнер зависимостей
  void init({
    required OnProgress onProgress,
    required OnComplete onComplete,
    required OnError onError,
    required DiContainer diContainer,
  }) {
    try {
      //Инициализация репозитория авторизации
      authRepository = lazyInitRepo<IAuthRepository>(
        mockFactory: AuthMockRepository.new,
        mainFactory: () => AuthRepository(
          httpClient: diContainer.httpClient,
        ),
        onProgress: onProgress,
        environment: diContainer.env,
      );
      onProgress(authRepository.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации репозитория $IAuthRepository',
        error: error,
        stackTrace: stackTrace,
      );
    }

    try {
      // Инициализация репозитория сервиса управления токеном доступа
      mainRepository = lazyInitRepo<IMainRepository>(
        mockFactory: MainMockRepository.new,
        mainFactory: () => MainRepository(
          httpClient: diContainer.httpClient,
        ),
        onProgress: onProgress,
        environment: diContainer.env,
      );
      onProgress(mainRepository.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации репозитория $IMainRepository',
        error: error,
        stackTrace: stackTrace,
      );
    }

    onComplete(
      'Инициализация репозиториев завершена! Было подменено репозиториев - ${_mockReposToSwitch.length} (${_mockReposToSwitch.join(', ')})',
    );
  }

  /// Метод для ленивой инициализации конкретного репозитория по типу [Т].
  /// В зависимости от окружения инициализируется моковый или сетевой репозиторий.
  ///
  /// Принимает:
  /// - [mockFactory] - функция - фабрика для инициализации репозитория для управления моковыми запросами
  /// - [mainFactory] - функция - фабрика для инициализации основного репозиторий
  /// - [onProgress] - обратный вызов при прогрессе
  T lazyInitRepo<T extends DiBaseRepo>({
    required AppEnv environment,
    required T Function() mainFactory,
    required T Function() mockFactory,
    required OnProgress onProgress,
  }) {
    final repo = switch (environment) {
      AppEnv.dev => mockFactory(),
      AppEnv.prod => mainFactory(),
      AppEnv.stage => _mockReposToSwitch.contains(mockFactory().name)
          ? mockFactory()
          : mainFactory(),
    };
    onProgress(repo.name);
    return repo;
  }
}
