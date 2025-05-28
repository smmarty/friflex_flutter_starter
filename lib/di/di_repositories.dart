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
import 'package:friflex_starter/features/profile/data/repository/profile_mock_repository.dart';
import 'package:friflex_starter/features/profile/data/repository/profile_repository.dart';
import 'package:friflex_starter/features/profile/domain/repository/i_profile_repository.dart';

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

  /// Интерфейс для работы с репозиторием профиля
  late final IProfileRepository profileRepository;

  /// Метод для инициализации репозиториев в приложении
  ///
  /// Принимает:
  /// - [onProgress] - обратный вызов при прогрессе
  /// - [diContainer] - контейнер зависимостей
  void init({
    required OnProgress onProgress,
    required OnError onError,
    required DiContainer diContainer,
  }) {
    try {
      //Инициализация репозитория авторизации
      authRepository = _lazyInitRepo<IAuthRepository>(
        mockFactory: AuthMockRepository.new,
        mainFactory: () => AuthRepository(
          httpClient: diContainer.httpClientFactory(
            diContainer.debugService,
            diContainer.appConfig,
          ),
        ),
        onProgress: onProgress,
        environment: diContainer.env,
      );
      onProgress(authRepository.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации репозитория IAuthRepository',
        error,
        stackTrace,
      );
    }

    try {
      // Инициализация репозитория сервиса управления токеном доступа
      mainRepository = _lazyInitRepo<IMainRepository>(
        mockFactory: MainMockRepository.new,
        mainFactory: () => MainRepository(
          httpClient: diContainer.httpClientFactory(
            diContainer.debugService,
            diContainer.appConfig,
          ),
        ),
        onProgress: onProgress,
        environment: diContainer.env,
      );
      onProgress(mainRepository.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации репозитория IMainRepository',
        error,
        stackTrace,
      );
    }

    try {
      // Инициализация репозитория профиля
      profileRepository = _lazyInitRepo<IProfileRepository>(
        mockFactory: ProfileMockRepository.new,
        mainFactory: () => ProfileRepository(
          httpClient: diContainer.httpClientFactory(
            diContainer.debugService,
            diContainer.appConfig,
          ),
        ),
        onProgress: onProgress,
        environment: diContainer.env,
      );
      onProgress(profileRepository.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации репозитория IProfileRepository',
        error,
        stackTrace,
      );
    }

    onProgress(
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
  T _lazyInitRepo<T extends DiBaseRepo>({
    required AppEnv environment,
    required T Function() mainFactory,
    required T Function() mockFactory,
    required OnProgress onProgress,
  }) {
    final mockRepo = mockFactory();
    final mainRepo = mainFactory();

    final repo = switch (environment) {
      AppEnv.dev => mockRepo,
      AppEnv.prod => mainRepo,
      AppEnv.stage =>
        _mockReposToSwitch.contains(mockRepo.name) ? mockRepo : mainRepo,
    };

    onProgress(repo.name);
    return repo;
  }
}
