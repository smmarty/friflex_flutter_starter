import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Тип функции для построения виджета с учетом локализации
typedef LocalizationBuilder = Widget Function();

/// {@template localization_consumer}
/// Виджет для подписки на изменения локализации приложения.
///
/// Автоматически перестраивает дочерние виджеты при изменении языка,
/// обеспечивая реактивность интерфейса к изменениям настроек локализации.
/// {@endtemplate}
class LocalizationConsumer extends StatelessWidget {
  /// {@macro localization_consumer}
  const LocalizationConsumer({required this.builder, super.key});

  /// Функция для построения виджета с учетом текущей локализации
  final LocalizationBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationNotifier>(
      builder: (_, _, _) {
        return builder();
      },
    );
  }
}

/// {@template localization_notifier}
/// Класс для управления локализацией приложения.
///
/// Отвечает за:
/// - Хранение текущей локали приложения
/// - Уведомление подписчиков об изменениях языка
/// - Переключение между поддерживаемыми языками
/// {@endtemplate}
final class LocalizationNotifier extends ChangeNotifier {
  /// {@macro localization_notifier}
  LocalizationNotifier();

  /// Текущая локаль приложения
  /// По умолчанию используется русский язык
  Locale _locale = const Locale('ru', 'RU');

  /// Получение текущей локали
  Locale get locale => _locale;

  /// Получение текущего языка в виде кода языка
  String get language => _locale.languageCode;

  /// Метод для изменения локали приложения.
  ///
  /// Принимает:
  /// - [locale] - новая локаль для установки
  ///
  /// Уведомляет всех подписчиков об изменении локали.
  void changeLocal(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
