import 'package:geolocator/geolocator.dart';
import 'package:i_app_services/i_app_services.dart';

/// {@template app_location_service}
/// Реализация сервиса для работы с гео в базовой реализацией Android/OS.
/// {@endtemplate}
class AppLocationService implements ILocationService {
  /// {@macro app_location_service}
  const AppLocationService();

  /// Наименование сервиса
  static const name = 'BaseAppLocationService';

  @override
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Службы геолокации не включены, не продолжаем
      // обращаться к позиции и запрашиваем у пользователей
      // приложения включить службы геолокации.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Разрешения отклонены, в следующий раз можно попробовать
        // запросить разрешения снова (здесь также возвращается
        // shouldShowRequestPermissionRationale Android.
        // Согласно рекомендациям Android ваше приложение
        // должно показать пояснительный интерфейс сейчас.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Разрешения отклонены навсегда, обрабатываем соответствующим образом.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // Когда мы доходим сюда, разрешения предоставлены и мы можем
    // продолжить обращение к позиции устройства.
    return await Geolocator.getCurrentPosition();
  }
}
