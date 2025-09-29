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
import 'package:friflex_starter/features/update/data/repository/update_mock_repository.dart';
import 'package:friflex_starter/features/update/data/repository/update_repository.dart';
import 'package:friflex_starter/features/update/domain/repository/i_update_repository.dart';

/// Список названий моковых репозиториев, которые должны быть подменены
/// для использования в сборке stage окружения.
///
/// Для того, чтобы репозиторий был автоматически подменен на моковый в stage
/// сборке, необходимо в этом списке указать тип интерфейса репозитория
///
/// Пример:
/// ```
///   <Type>{ IUpdateRepository }
/// ```
const _mockReposToSwitch = <Type>{IUpdateRepository};

/// {@template di_repositories}
/// Класс для инициализации и управления репозиториями приложения.
///
/// Отвечает за:
/// - Инициализацию репозиториев для работы с данными
/// - Автоматическое переключение между моковыми и реальными репозиториями
/// - Уведомление о прогрессе инициализации
/// - Обработку ошибок инициализации репозиториев
///
/// Стратегия инициализации по окружениям:
/// - dev: всегда используются моковые репозитории
/// - prod: всегда используются реальные репозитории
/// - stage: используются моковые репозитории из списка _mockReposToSwitch
/// {@endtemplate}
final class DiRepositories {
  /// {@macro di_repositories}
  DiRepositories();

  /// Интерфейс для работы с репозиторием авторизации
  late final IAuthRepository authRepository;

  /// Интерфейс для работы с репозиторием главного сервиса
  late final IMainRepository mainRepository;

  /// Интерфейс для работы с репозиторием профиля
  late final IProfileRepository profileRepository;

  /// Интерфейс для работы с репозиторием обновлений
  late final IUpdateRepository updatesRepository;

  /// Метод для инициализации репозиториев в приложении.
  ///
  /// Принимает:
  /// - [onProgress] - обратный вызов для уведомления о прогрессе инициализации
  /// - [diContainer] - контейнер зависимостей с конфигурацией приложения
  /// - [onError] - обратный вызов для обработки ошибок инициализации
  ///
  /// Последовательность инициализации:
  /// 1. Инициализация репозитория авторизации
  /// 2. Инициализация репозитория главного сервиса
  /// 3. Инициализация репозитория профиля
  void init({
    required OnProgress onProgress,
    required OnError onError,
    required DiContainer diContainer,
  }) {
    onProgress('Начинаем инициализацию репозиториев...');
    try {
      // Инициализация репозитория обновлений
      updatesRepository = _lazyInitRepo<IUpdateRepository>(
        mockFactory: UpdateMockRepository.new,
        mainFactory: UpdateRepository.new,
        onProgress: onProgress,
        environment: diContainer.env,
      );
      onProgress(updatesRepository.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации репозитория IUpdateRepository',
        error,
        stackTrace,
      );
    }

    try {
      // Инициализация репозитория авторизации
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
  /// - [mockFactory] - функция-фабрика для инициализации мокового репозитория
  /// - [mainFactory] - функция-фабрика для инициализации основного репозитория
  /// - [onProgress] - обратный вызов для уведомления о прогрессе
  /// - [environment] - окружение приложения для определения стратегии инициализации
  ///
  /// Возвращает:
  /// - Экземпляр репозитория в зависимости от окружения
  T _lazyInitRepo<T extends DiBaseRepo>({
    required AppEnv environment,
    required T Function() mainFactory,
    required T Function() mockFactory,
    required OnProgress onProgress,
  }) {
    // TODO(yura): https://github.com/smmarty/friflex_flutter_starter/issues/31  - добавить onError

    final repo = switch (environment) {
      AppEnv.dev => mainFactory(),
      AppEnv.prod => mockFactory(),
      AppEnv.stage =>
        _mockReposToSwitch.contains(T) ? mainFactory() : mockFactory(),
    };

    onProgress(repo.name);
    return repo;
  }
}
