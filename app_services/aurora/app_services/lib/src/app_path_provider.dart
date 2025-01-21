import 'package:i_app_services/i_app_services.dart';
import 'package:path_provider/path_provider.dart';

/// Класс для Aurora реализации сервиса работы с путями
class AppPathProvider implements IPathProvider {
  /// Наименование сервиса
  static const name = 'AuroraAppPathProvider';

  @override
  Future<String> getAppDocumentsDirectoryPath() async {
    return (await getApplicationDocumentsDirectory()).path;
  }
}
