import 'dart:async';

import 'package:friflex_starter/src/initialization/app_initialization_step_label.dart';
import 'package:friflex_starter/src/initialization/initialization_step.dart';

abstract class AppInitializationStep<R>
    extends InitializableStep<AppInitializableStepLabel, R> {
  const AppInitializationStep({
    required super.label,
  });
}

class Step0 extends AppInitializationStep<void> {
  const Step0() : super(label: AppInitializableStepLabels.step0);

  @override
  FutureOr<void> initialize() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

class Step1 extends AppInitializationStep<void> {
  const Step1() : super(label: AppInitializableStepLabels.step1);

  @override
  FutureOr<void> initialize() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}

class Step2 extends AppInitializationStep<void> {
  const Step2() : super(label: AppInitializableStepLabels.step2);

  @override
  FutureOr<void> initialize() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}

class Step3 extends AppInitializationStep<void> {
  const Step3() : super(label: AppInitializableStepLabels.step3);

  @override
  FutureOr<void> initialize() async {
    await Future.delayed(const Duration(seconds: 4));
  }
}
