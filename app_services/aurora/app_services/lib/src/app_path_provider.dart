import 'package:i_app_services/i_app_services.dart';
import 'package:path_provider/path_provider.dart';

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
    return (await getApplicationDocumentsDirectory()).path;
  }
}
