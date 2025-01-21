import '../../domain/repository/i_main_repository.dart';

/// {@template MainMockRepository}
///
/// {@endtemplate}
final class MainMockRepository implements IMainRepository {
  @override
  String get name => 'MainMockRepository';
}