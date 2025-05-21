import 'package:friflex_starter/src/initialization/initialization_step_label.dart';

abstract class AppInitializableStepLabels {
  const AppInitializableStepLabels._();

  static const step0 = AppInitializableStepLabel('step0');
  static const step1 = AppInitializableStepLabel('step1');
  static const step2 = AppInitializableStepLabel('step2');
  static const step3 = AppInitializableStepLabel('step3');

  static Set<AppInitializableStepLabel> values = {
    step0,
    step1,
    step2,
    step3,
  };
}

class AppInitializableStepLabel extends InitializableStepLabel<String> {
  const AppInitializableStepLabel(super.value);
}
