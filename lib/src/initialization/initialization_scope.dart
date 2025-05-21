import 'package:flutter/material.dart';
import 'package:friflex_starter/src/initialization/initialization_controller.dart';
import 'package:friflex_starter/src/initialization/initialization_step.dart';
import 'package:friflex_starter/src/initialization/initialization_step_label.dart';

class InitializationScope<L extends InitializableStepLabel,
    S extends InitializableStep<L, Object?>> extends StatefulWidget {
  const InitializationScope({
    required this.labels,
    required this.createStep,
    required this.relations,
    required this.child,
    super.key,
  });

  final Set<L> labels;
  final S? Function(BuildContext context, L label) createStep;
  final Map<L, Set<L>> relations;
  final Widget child;

  static InitializationInheritedScope of(
    BuildContext context, {
    bool listen = false,
  }) {
    // TODO bang
    return _maybeOf(context, listen: listen)!;
  }

  static InitializationInheritedScope? _maybeOf(
    BuildContext context, {
    bool listen = false,
  }) {
    return listen
        ? context
            .dependOnInheritedWidgetOfExactType<InitializationInheritedScope>()
        : context.getInheritedWidgetOfExactType<InitializationInheritedScope>();
  }

  @override
  State<InitializationScope<L, S>> createState() =>
      _InitializationScopeState<L, S>();
}

class _InitializationScopeState<L extends InitializableStepLabel,
        S extends InitializableStep<L, Object?>>
    extends State<InitializationScope<L, S>> {
  late final InitializationController<L, S> _initializationController;

  @override
  void initState() {
    super.initState();

    final labelsWithSteps = <L, S>{};
    for (final label in widget.labels) {
      final createdStep = widget.createStep(context, label);
      if (createdStep == null) continue;
      labelsWithSteps[label] = createdStep;
    }

    _initializationController = InitializationController()
      ..initialize(
        labelsWithSteps.values.toSet(),
        widget.relations,
      );
  }

  @override
  void dispose() {
    _initializationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InitializationInheritedScope(
      controller: _initializationController,
      child: widget.child,
    );
  }
}

class InitializationInheritedScope extends InheritedWidget {
  const InitializationInheritedScope({
    required this.controller,
    required super.child,
    super.key,
  });

  final IInitializationController controller;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget is InitializationInheritedScope &&
        oldWidget.controller != controller;
  }
}
