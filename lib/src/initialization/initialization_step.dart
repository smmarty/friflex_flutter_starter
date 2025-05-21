import 'dart:async';

import 'package:friflex_starter/src/initialization/initialization_step_label.dart';

abstract class InitializableStep<L extends InitializableStepLabel, T> {
  const InitializableStep({
    required this.label,
  });

  final L label;

  FutureOr<T> initialize();
}
