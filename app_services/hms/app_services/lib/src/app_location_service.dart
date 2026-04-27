import 'package:i_app_services/i_app_services.dart';

/// {@template app_location_service}
/// Реализация сервиса для работы с гео на HarmonyOS.
/// {@endtemplate}
class AppLocationService implements ILocationService {
  /// {@macro app_location_service}
  const AppLocationService();

  /// Наименование сервиса
  static const name = 'HarmonyAppLocationService';

  @override
  Future<Object?> getCurrentPosition() {
    // TODO: Реализовать получение текущей позиции в HarmonyOS
    throw UnimplementedError();
  }
}
