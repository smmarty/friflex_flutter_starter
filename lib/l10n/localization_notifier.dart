import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef LocalizationBuilder = Widget Function();

/// Виджет для перестройки виджета в зависимости от  локализации
class LocalizationConsumer extends StatelessWidget {
  const LocalizationConsumer({required this.builder, super.key});

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

/// Класс для управления локализацией
final class LocalizationNotifier extends ChangeNotifier {
  Locale _locale = const Locale('en', 'US');

  Locale get locale => _locale;

  void changeLocal(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
