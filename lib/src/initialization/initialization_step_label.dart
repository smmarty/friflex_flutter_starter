import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class InitializableStepLabel<T> with EquatableMixin {
  final T value;

  const InitializableStepLabel(this.value);

  @override
  @mustCallSuper
  List<Object?> get props => [value];
}
