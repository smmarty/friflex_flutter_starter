import 'package:flutter/material.dart';
import 'package:friflex_starter/src/initialization/initialization_controller.dart';
import 'package:friflex_starter/src/initialization/initialization_scope.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final IInitializationController _initializationController;

  @override
  void initState() {
    super.initState();

    _initializationController = InitializationScope.of(context).controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: _initializationController,
            builder: (context, state, _) {
              final String displayedText;
              switch (state) {
                case InitializationState$NotStarted():
                  displayedText = 'Инициализация не начата';
                  break;
                case InitializationState$InProgress():
                  displayedText =
                      'Загружаем ${((state.completedSteps / state.totalSteps) * 100).toInt()}%';
                  break;
                case InitializationState$Completed():
                  final seconds = state.completionTime.inSeconds;
                  displayedText =
                      'Загрузка завершена (${seconds > 0 ? '$seconds сек. ${state.completionTime.inMilliseconds % Duration.millisecondsPerSecond} мс' : '${state.completionTime.inMilliseconds} мс'} )';
                  break;
                case InitializationState$Failed():
                  displayedText =
                      'Ошибка загрузки (${state.completedSteps}/${state.totalSteps})';
                  break;
              }

              return Text(displayedText);
            },
          ),
        ),
      ),
    );
  }
}
