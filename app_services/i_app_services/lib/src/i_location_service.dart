/// {@template i_location_service}
/// Интерфейс для работы с геопозицией пользователя
/// {@endtemplate}
abstract interface class ILocationService {
  static const name = 'ILocationService';

  /// Метод для получения координат пользователя
  Future<dynamic> getCurrentPosition();
}
