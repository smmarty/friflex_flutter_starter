import 'package:flutter/material.dart';
import 'package:friflex_starter/src/initialization/app_initialization_step_label.dart';
import 'package:friflex_starter/src/initialization/app_initialization_steps.dart';
import 'package:friflex_starter/src/initialization/initialization_scope.dart';
import 'package:friflex_starter/src/router/app_router_delegate.dart';
import 'package:friflex_starter/src/splash_screen.dart';

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GlobalKey<NavigatorState> _navigatorKey;
  late final AppRouterDelegate _routerDelegate;

  @override
  void initState() {
    super.initState();

    _navigatorKey = GlobalKey<NavigatorState>();
    _routerDelegate = AppRouterDelegate(
      navigatorKey: _navigatorKey,
      homePage: const MaterialPage(
        child: SplashScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _routerDelegate.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InitializationScope<AppInitializableStepLabel,
        AppInitializationStep>(
      labels: AppInitializableStepLabels.values,
      // Factory метод для создания объектов для каждого шага
      // При добавлении новых значений в AppInitializableStepLabels.values, здесь необходимо добавить их обработку
      createStep: (context, label) {
        if (label == AppInitializableStepLabels.step0) {
          return const Step0();
        } else if (label == AppInitializableStepLabels.step1) {
          return const Step1();
        } else if (label == AppInitializableStepLabels.step2) {
          return const Step2();
        } else if (label == AppInitializableStepLabels.step3) {
          return const Step3();
        } else {
          throw StateError('Не указан шаг инициализации для "$label"');
        }
      },
      // Здесь описываются взаимосвязи между шагами инициализации для выстраивания корректной последовательности выполнения
      relations: <AppInitializableStepLabel, Set<AppInitializableStepLabel>>{
        AppInitializableStepLabels.step3: {
          AppInitializableStepLabels.step2,
        },
        AppInitializableStepLabels.step2: {
          AppInitializableStepLabels.step1,
        },
      },
      child: MaterialApp.router(
        routerDelegate: _routerDelegate,
      ),
    );
  }
}
