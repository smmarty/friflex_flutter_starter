import 'package:friflex_starter/features/main/domain/repository/i_main_repository.dart';

/// {@template MainMockRepository}
/// Мок реализация репозитория главного сервиса
/// {@endtemplate}
final class MainMockRepository implements IMainRepository {
  /// {@macro MainMockRepository}
  const MainMockRepository();

  @override
  String get name => 'MainMockRepository';
}
