import 'package:i_app_services/i_app_services.dart';

/// {@template app_path_provider}
/// Класс для HarmonyOS реализации сервиса работы с путями
/// {@endtemplate}
class AppPathProvider implements IPathProvider {
  /// {@macro app_path_provider}
  const AppPathProvider();

  /// Наименование сервиса
  static const name = 'HarmonyAppPathProvider';

  @override
  Future<String> getAppDocumentsDirectoryPath() async {
    // TODO: Реализовать для HarmonyOS
    throw UnimplementedError();
  }
}
