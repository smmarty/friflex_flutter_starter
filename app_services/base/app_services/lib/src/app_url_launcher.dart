import 'package:i_app_services/i_app_services.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

/// {@template app_url_launcher}
/// Класс для базовой реализации сервиса работы с URL
/// {@endtemplate}
class AppUrlLauncher implements IUrlLauncher {
  /// {@macro app_url_launcher}
  AppUrlLauncher();

  /// Наименование сервиса
  static const String name = 'BaseAppUrlLauncher';

  @override
  String get nameImpl => AppUrlLauncher.name;

  @override
  Future<bool> canLaunchUrl(Uri url) async {
    return url_launcher.canLaunchUrl(url);
  }

  @override
  Future<bool> launchUrl(Uri url) async {
    return url_launcher.launchUrl(url);
  }
}
