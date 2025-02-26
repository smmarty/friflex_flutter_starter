import 'package:friflex_starter/di/di_base_repo.dart';

/// {@template IProfileScopeRepository}
///
/// {@endtemplate}
abstract interface class IProfileScopeRepository with DiBaseRepo {
  Future<String> fetchUserProfile(String id);
}
