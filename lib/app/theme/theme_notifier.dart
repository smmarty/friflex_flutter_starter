import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Тип функции для построения виджета с учетом темы
typedef ThemeBuilder = Widget Function();

/// {@template theme_consumer}
/// Виджет для подписки на изменения темы приложения.
///
/// Автоматически перестраивает дочерние виджеты при изменении темы,
/// обеспечивая реактивность интерфейса к изменениям настроек темы.
/// {@endtemplate}
class ThemeConsumer extends StatelessWidget {
  /// {@macro theme_consumer}
  const ThemeConsumer({required this.builder, super.key});

  /// Функция для построения виджета с учетом текущей темы
  final ThemeBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (_, _, _) {
        return builder();
      },
    );
  }
}

/// {@template theme_notifier}
/// Класс для управления темой приложения.
///
/// Отвечает за:
/// - Хранение текущего режима темы (светлая/темная/системная)
/// - Уведомление подписчиков об изменениях темы
/// - Переключение между режимами темы
/// {@endtemplate}
final class ThemeNotifier extends ChangeNotifier {
  /// {@macro theme_notifier}
  ThemeNotifier();

  /// Текущий режим темы приложения
  /// По умолчанию используется системная тема
  ThemeMode _themeMode = ThemeMode.system;

  /// Получение текущего режима темы
  ThemeMode get themeMode => _themeMode;

  /// Метод для переключения темы приложения.
  ///
  /// Переключает между светлой и темной темой.
  /// Если текущая тема светлая, переключает на темную и наоборот.
  void changeTheme() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }
}
