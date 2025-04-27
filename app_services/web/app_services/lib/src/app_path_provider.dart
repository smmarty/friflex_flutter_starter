import 'package:i_app_services/i_app_services.dart';

/// {@template app_path_provider}
/// Класс для WEB реализации сервиса работы с путями
/// {@endtemplate}
class AppPathProvider implements IPathProvider {
  /// {@macro app_path_provider}
  const AppPathProvider();

  /// Наименование сервиса
  static const name = 'WebAppPathProvider';

  @override
  Future<String?> getAppDocumentsDirectoryPath() async {
    // В веб у нас нет доступа к файловой системе.
    // Возвращаем null, так как не можем предоставить путь к директории.
    return null;
  }
}
