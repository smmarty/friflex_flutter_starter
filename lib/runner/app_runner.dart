import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:friflex_starter/app/app.dart';
import 'package:friflex_starter/app/app_env.dart';
import 'package:friflex_starter/di/di_container.dart';
import 'package:friflex_starter/features/debug/app_debug_service.dart';
import 'package:friflex_starter/features/debug/i_debug_service.dart';
import 'package:friflex_starter/features/error/error_screen.dart';
import 'package:friflex_starter/router/app_router.dart';
import 'package:friflex_starter/runner/timer_runner.dart';
import 'package:go_router/go_router.dart';

part 'errors_handlers.dart';

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
  late final IDebugService _debugService;

  /// Роутер приложения
  late final GoRouter router;

  /// Таймер для отслеживания времени инициализации приложения
  late final TimerRunner _timerRunner;

  /// Метод для запуска приложения
  Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Инициализация сервиса отладки
    _debugService = AppDebugService();
    
    _timerRunner = TimerRunner(_debugService);

    // Инициализация приложения
    await _initApp();

    // Инициализация метода обработки ошибок
    _initErrorHandlers(_debugService);

    // Инициализация репозиториев и сервисов
    final diContainer = await _initDependencies(_debugService);

    // Инициализация роутера
    router = AppRouter.createRouter(_debugService);

    runApp(
      App(diContainer: diContainer, router: router),
    );
    await _onAppLoaded();
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

    _timerRunner.stop();
  }

  /// Метод для инициализации зависимостей приложения
  Future<DiContainer> _initDependencies(IDebugService debugService) async {
    debugService.log('Тип сборки: ${env.name}');
    final diContainer = DiContainer(
      env: env,
      dService: debugService,
    );
    await diContainer.init(
      onProgress: _timerRunner.logOnProgress,
      onComplete: _timerRunner.logOnComplete,
      onError: _timerRunner.logOnError,
    );

    return diContainer;
  }
}
