import 'package:i_app_services/i_app_services.dart';

/// {@template app_path_provider}
/// Класс для Аврора реализации сервиса работы с путями
/// {@endtemplate}
class AppPathProvider implements IPathProvider {
  /// {@macro app_path_provider}
  const AppPathProvider();

  /// Наименование сервиса
  static const name = 'AuroraAppPathProvider';

  @override
  Future<String> getAppDocumentsDirectoryPath() async {
    // TODO: Реализовать для AuroraOS
    throw UnimplementedError();
  }
}
