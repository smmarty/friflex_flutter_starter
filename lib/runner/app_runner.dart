import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_starter/app/app.dart';
import 'package:friflex_starter/app/app_env.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/features/debug/debug_service.dart';
import 'package:friflex_starter/features/debug/i_debug_service.dart';
import 'package:friflex_starter/features/error/error_screen.dart';
import 'package:friflex_starter/router/app_router.dart';
import 'package:friflex_starter/runner/timer_runner.dart';
import 'package:go_router/go_router.dart';

part 'errors_handlers.dart';

/// Время ожидания инициализации зависимостей
/// Если время превышено, то будет показан экран ошибки
/// В дальнейшем нужно убрать в env
const _initTimeout = Duration(seconds: 7);

/// Класс, реализующий раннер для конфигурирования приложения при запуске
///
/// Порядок инициализации:
/// 1. _initApp - инициализация конфигурации приложения
/// 2. инициализация репозиториев приложения (будет позже)
/// 3. runApp - запуск приложения
/// 4. _onAppLoaded - после запуска приложения
class AppRunner {
  /// Создает экземпляр раннера приложения
  ///
  /// Принимает:
  /// - [env] - тип окружения сборки приложения
  AppRunner(this.env);

  /// Тип окружения сборки приложения¬
  final AppEnv env;

  /// Контейнер зависимостей приложения
  late IDebugService _debugService;

  /// Роутер приложения
  late GoRouter router;

  /// Таймер для отслеживания времени инициализации приложения
  late TimerRunner _timerRunner;

  /// Метод для запуска приложения
  Future<void> run() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      // Инициализация сервиса отладки
      _debugService = DebugService();

      _timerRunner = TimerRunner(_debugService);

      // Инициализация Talker для логирования Bloc
      Bloc.observer = _debugService.blocObserver;

      // Инициализация приложения
      await _initApp();

      // Инициализация метода обработки ошибок
      _initErrorHandlers(_debugService);

      // Инициализация роутера
      router = AppRouter.createRouter(_debugService);

      // throw Exception('Test error');

      runApp(
        App(
          router: router,
          initDependencies: () {
            return _initDependencies(
              debugService: _debugService,
              env: env,
              timerRunner: _timerRunner,
            ).timeout(
              _initTimeout,
              onTimeout: () {
                return Future.error(
                  TimeoutException(
                    'Превышено время ожидания инициализации зависимостей',
                  ),
                );
              },
            );
          },
        ),
      );
      await _onAppLoaded();
    } on Object catch (e, stackTrace) {
      await _onAppLoaded();

      /// Если произошла ошибка при инициализации приложения,
      /// то запускаем экран ошибки
      runApp(ErrorScreen(error: e, stackTrace: stackTrace, onRetry: run));
    }
  }

  /// Метод инициализации приложения,
  /// выполняется до запуска приложения
  Future<void> _initApp() async {
    // Запрет на поворот экрана
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );

    // Заморозка первого кадра (сплеш)
    WidgetsBinding.instance.deferFirstFrame();
  }

  /// Метод срабатывает после запуска приложения
  Future<void> _onAppLoaded() async {
    // Разморозка первого кадра (сплеш)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.allowFirstFrame();
    });
  }

  // Метод для инициализации зависимостей приложения
  Future<DiContainer> _initDependencies({
    required IDebugService debugService,
    required AppEnv env,
    required TimerRunner timerRunner,
  }) async {
    // Имитация задержки инициализации
    // TODO(yura): Удалить после проверки
    await Future.delayed(const Duration(seconds: 3));
    debugService.log(() => 'Тип сборки: ${env.name}');
    final diContainer = DiContainer(
      env: env,
      dService: debugService,
    );
    await diContainer.init(
      onProgress: (name) => timerRunner.logOnProgress(name),
      onComplete: (name) {
        timerRunner
          ..logOnComplete(name)
          ..stop();
      },
      onError: (message, error, [stackTrace]) => debugService.logError(
        message,
        error: error,
        stackTrace: stackTrace,
      ),
    );
    //throw Exception('Test error');
    return diContainer;
  }
}
