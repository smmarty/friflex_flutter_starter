/// {@template UpdateConst}
///  Константы для управления процессом обновления приложения
/// {@endtemplate}
abstract final class UpdateConst {
  /// {@macro UpdateConst}
  const UpdateConst();

  /// Тип обновления обязательное
  static const String updateTypeHard = 'hard';

  /// Тип обновления мягкое
  static const String updateTypeSoft = 'soft';
}
