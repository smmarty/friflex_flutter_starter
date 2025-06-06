import 'package:flutter/material.dart';
import 'package:friflex_starter/app/ui_kit/app_box.dart';
import 'package:friflex_starter/gen/assets.gen.dart';

/// {@template IconsScreen}
///  Экран для отрисовки иконок
/// {@endtemplate}
class IconsScreen extends StatelessWidget {
  /// {@macro IconsScreen}
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

// Приватный класс для реализации элемента списка иконок
class _ItemIcon extends StatelessWidget {
  /// Создает экземпляр элемента списка иконок
  ///
  /// Принимает:
  /// - [icon] - иконка
  /// - [name] - название иконки
  const _ItemIcon({required this.icon, required this.name});

  /// Иконка
  final Widget icon;

  /// Название иконки
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(children: [icon, const WBox(16), Text(name)]);
  }
}
