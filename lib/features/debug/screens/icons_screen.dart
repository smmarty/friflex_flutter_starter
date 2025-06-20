import 'package:flutter/material.dart';
import 'package:friflex_starter/app/ui_kit/app_box.dart';
import 'package:friflex_starter/gen/assets.gen.dart';

/// {@template icons_screen}
/// Экран для отображения всех доступных иконок приложения.
///
/// Отвечает за:
/// - Отображение списка всех SVG иконок из assets/icons/
/// - Предоставление возможности просмотра иконок для разработчиков
/// - Демонстрацию использования системы генерации ресурсов
/// {@endtemplate}
class IconsScreen extends StatelessWidget {
  /// {@macro icons_screen}
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final iconList = Assets.icons.values
        .map((icon) => _ItemIcon(icon: icon.svg(), name: icon.path))
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Иконки')),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return iconList[index];
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: iconList.length,
        ),
      ),
    );
  }
}

/// {@template item_icon}
/// Виджет для отображения отдельной иконки в списке.
///
/// Отображает SVG иконку вместе с её названием файла
/// для удобства идентификации в процессе разработки.
/// {@endtemplate}
class _ItemIcon extends StatelessWidget {
  /// {@macro item_icon}
  const _ItemIcon({required this.icon, required this.name});

  /// SVG иконка для отображения
  final Widget icon;

  /// Название файла иконки для идентификации
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(children: [icon, const WBox(16), Text(name)]);
  }
}
