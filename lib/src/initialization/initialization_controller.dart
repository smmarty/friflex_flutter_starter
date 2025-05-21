import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:friflex_starter/src/initialization/initialization_step.dart';
import 'package:friflex_starter/src/initialization/initialization_step_label.dart';
import 'package:friflex_starter/src/initialization/initialization_step_result.dart';

abstract class IInitializationController<L extends InitializableStepLabel,
        S extends InitializableStep<L, Object?>>
    implements ValueListenable<InitializationState> {
  Future<void> initialize(
    Set<S> steps,
    Map<L, Set<L>> relations,
  );
}

class InitializationController<L extends InitializableStepLabel,
        S extends InitializableStep<L, Object?>>
    extends ValueNotifier<InitializationState>
    implements IInitializationController<L, S> {
  InitializationController() : super(const InitializationState$NotStarted());

  @override
  Future<void> initialize(
    Set<S> steps,
    Map<L, Set<L>> relations,
  ) async {
    final initializationSw = Stopwatch()..start();
    final totalSteps = steps.length;
    var completedStepsCount = 0;
    try {
      value = InitializationState$InProgress(
        completedSteps: completedStepsCount,
        totalSteps: totalSteps,
      );
      final stepsToPerform = <L, S>{};
      final initialSteps = <S>{};
      for (final step in steps) {
        stepsToPerform[step.label] = step;

        final stepDependencies = relations[step.label];
        if (stepDependencies == null || stepDependencies.isEmpty) {
          initialSteps.add(step);
        }
      }
      if (initialSteps.isEmpty) {
        initializationSw.stop();
        Error.throwWithStackTrace(
          StateError(
            'Не найден ни один шаг без зависимостей, нет точки входа для инициализации',
          ),
          StackTrace.current,
        );
      }

      final initializedStepsLabels = <L>{};
      final notInitializedStepsLabels = <L>{...stepsToPerform.keys};
      final results = <L, InitializationStepResult<Object?, L, S>>{
        for (final entry in stepsToPerform.entries)
          entry.key: InitializationStepResult$NotInitialized(step: entry.value),
      };
      final stepsInProgress = <L>{};

      Future<void> handleSteps(Set<S> stepsToHandle) {
        print(
          stepsToHandle.length == 1
              ? 'PERFORMING EXACT STEP ${stepsToHandle.first.runtimeType}'
              : 'PERFORMING STEPS ${stepsToHandle.map((s) => s.runtimeType)}',
        );

        return Future.wait(
          stepsToHandle.map((step) async {
            final sw = Stopwatch()..start();
            results[step.label] =
                InitializationStepResult$InProgress(step: step);
            stepsInProgress.add(step.label);

            try {
              final rawResult = await step.initialize();
              results[step.label] = InitializationStepResult$Completed(
                result: rawResult,
                step: step,
              );
              completedStepsCount += 1;
              final currentValue = value;
              switch (currentValue) {
                case InitializationState$Completed():
                  // потенциально невозможный кейс
                  break;
                case InitializationState$NotStarted():
                case InitializationState$InProgress():
                  value = InitializationState$InProgress(
                    completedSteps: completedStepsCount,
                    totalSteps: totalSteps,
                  );
                  break;
                case InitializationState$Failed():
                  value = InitializationState$Failed(
                    completedSteps: completedStepsCount,
                    totalSteps: totalSteps,
                  );
              }

              print('STEP COMPLETED ${step.runtimeType}');

              initializedStepsLabels.add(step.label);
              notInitializedStepsLabels.remove(step.label);

              if (notInitializedStepsLabels.isEmpty) {
                return;
              }

              final nextStepsToInitialize = <S>{};
              for (final notInitializedStepLabel in notInitializedStepsLabels) {
                final stepRelationsLabels = relations[notInitializedStepLabel];
                if (stepRelationsLabels == null ||
                    stepRelationsLabels.isEmpty) {
                  if (results[notInitializedStepLabel]
                      is InitializationStepResult$NotInitialized) {
                    // TODO bang
                    nextStepsToInitialize.add(
                      stepsToPerform[notInitializedStepLabel]!,
                    );
                  }
                  continue;
                }

                var hasUninitializedRelation = false;
                for (final stepRelationLabel in stepRelationsLabels) {
                  if (notInitializedStepsLabels.contains(stepRelationLabel)) {
                    hasUninitializedRelation = true;
                    break;
                  }
                }
                if (!hasUninitializedRelation &&
                    results[notInitializedStepLabel]
                        is InitializationStepResult$NotInitialized) {
                  // TODO bang
                  nextStepsToInitialize.add(
                    stepsToPerform[notInitializedStepLabel]!,
                  );
                  continue;
                }
              }

              // TODO сюда sw для подсчета времени инициализации конкретного шага
              if (nextStepsToInitialize.isNotEmpty) {
                await handleSteps(nextStepsToInitialize);
              }
            } on Object catch (e, s) {
              sw.stop();
              results[step.label] = InitializationStepResult$Failed(
                e: e,
                s: s,
                completionTimeInMicroseconds: sw.elapsedMicroseconds,
                step: step,
              );
              print('STEP FAILED ${step.runtimeType}');
              rethrow;
            } finally {
              stepsInProgress.remove(step.label);
            }
          }),
        );
      }

      await handleSteps(initialSteps);
      initializationSw.stop();
      if (completedStepsCount != totalSteps) {
        Error.throwWithStackTrace(
          StateError(
            'Какой-то из шагов инициализации был завершён с ошибкой',
          ),
          StackTrace.current,
        );
      }
      print(
        'INITIALIZATION COMPLETED (${initializationSw.elapsedMilliseconds} ms)',
      );
      value = InitializationState$Completed(
        completionTime: Duration(
          milliseconds: initializationSw.elapsedMilliseconds,
        ),
      );
    } on Object catch (e, s) {
      print(
        'INITIALIZATION FAILED ($completedStepsCount/$totalSteps | ${initializationSw.elapsedMilliseconds} ms)',
      );
      value = InitializationState$Failed(
        completedSteps: completedStepsCount,
        totalSteps: totalSteps,
      );
    }
  }
}

@immutable
sealed class InitializationState with EquatableMixin {
  const InitializationState();

  @override
  @mustCallSuper
  List<Object?> get props => [];
}

class InitializationState$NotStarted extends InitializationState {
  const InitializationState$NotStarted();
}

class InitializationState$InProgress extends InitializationState {
  const InitializationState$InProgress({
    required this.completedSteps,
    required this.totalSteps,
  });

  final int completedSteps;
  final int totalSteps;

  @override
  List<Object?> get props => [
        completedSteps,
        totalSteps,
        super.props,
      ];
}

class InitializationState$Completed extends InitializationState {
  const InitializationState$Completed({
    required this.completionTime,
  });

  final Duration completionTime;

  @override
  List<Object?> get props => [
        completionTime,
        super.props,
      ];
}

class InitializationState$Failed extends InitializationState {
  const InitializationState$Failed({
    required this.completedSteps,
    required this.totalSteps,
  });

  final int completedSteps;
  final int totalSteps;

  @override
  List<Object?> get props => [
        completedSteps,
        totalSteps,
        super.props,
      ];
}
