import 'package:equatable/equatable.dart';
import 'package:friflex_starter/src/initialization/initialization_step.dart';
import 'package:friflex_starter/src/initialization/initialization_step_label.dart';
import 'package:meta/meta.dart';

@immutable
sealed class InitializationStepResult<R, L extends InitializableStepLabel,
    S extends InitializableStep<L, R>> with EquatableMixin {
  const InitializationStepResult({
    required this.step,
  });

  final S step;

  @override
  @mustCallSuper
  List<Object?> get props => [step];
}

class InitializationStepResult$NotInitialized<R,
        L extends InitializableStepLabel, S extends InitializableStep<L, R>>
    extends InitializationStepResult<R, L, S> {
  const InitializationStepResult$NotInitialized({
    required super.step,
  });
}

class InitializationStepResult$InProgress<R, L extends InitializableStepLabel,
        S extends InitializableStep<L, R>>
    extends InitializationStepResult<R, L, S> {
  const InitializationStepResult$InProgress({
    required super.step,
  });
}

class InitializationStepResult$Completed<R, L extends InitializableStepLabel,
        S extends InitializableStep<L, R>>
    extends InitializationStepResult<R, L, S> {
  const InitializationStepResult$Completed({
    required this.result,
    required super.step,
  });

  final R result;

  @override
  List<Object?> get props => [
        result,
        super.props,
      ];
}

class InitializationStepResult$Failed<R, L extends InitializableStepLabel,
        S extends InitializableStep<L, R>>
    extends InitializationStepResult<R, L, S> {
  const InitializationStepResult$Failed({
    required this.e,
    required this.s,
    required this.completionTimeInMicroseconds,
    required super.step,
  });

  final Object e;
  final StackTrace s;
  final int completionTimeInMicroseconds;

  @override
  List<Object?> get props => [
        e,
        s,
        completionTimeInMicroseconds,
        super.props,
      ];
}
