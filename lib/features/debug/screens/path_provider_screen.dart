import 'dart:io';

import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/ui_kit/app_box.dart';
import 'package:i_app_services/i_app_services.dart';

/// {@template path_provider_screen}
/// Экран для отладки и тестирования плагина path_provider.
///
/// Отвечает за:
/// - Тестирование работы реализаций плагина для получения путей к директориям приложения
/// - Демонстрацию содержимого директории файлов приложения
/// {@endtemplate}
class PathProviderScreen extends StatefulWidget {
  /// {@macro path_provider_screen}
  const PathProviderScreen({super.key});

  @override
  State<PathProviderScreen> createState() => _PathProviderScreenState();
}

class _PathProviderScreenState extends State<PathProviderScreen> {
  /// Плагин для работы с путями в приложении
  late final IPathProvider _pathProvider;

  /// Корневой путь к директории файлов приложения
  String? _rootPath;

  /// Текущий путь к директории, отображаемой в списке
  String? _currentPath;

  /// Загрузка файлов
  Future<List<FileSystemEntity>?>? _loadFilesFuture;

  @override
  void initState() {
    super.initState();
    _pathProvider = context.di.services.pathProvider;
    _loadFilesFuture = _initRoot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Path Provider')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Реализация Path Provider: ${context.di.services.pathProvider.nameImpl}'),
            const HBox(8),
            Text('Содержимое папки документов приложения:'),
            const HBox(8),
            Text('Текущий путь:'),
            const HBox(8),
            Text(_currentPath ?? ''),
            const HBox(8),
            ElevatedButton(
              onPressed: _currentPath != null && _rootPath != null && _currentPath != _rootPath
                  ? _goBack
                  : null,
              child: const Text('Назад'),
            ),
            Expanded(
              child: FutureBuilder<List<FileSystemEntity>?>(
                future: _loadFilesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Ошибка: \\${snapshot.error}'));
                  }
                  final files = snapshot.data;
                  if (files == null) {
                    return const Center(child: Text('Недоступно'));
                  }
                  if (files.isEmpty) {
                    return const Center(child: Text('Папка пуста'));
                  }
                  return ListView(
                    children: files
                        .map(
                          (item) => ListTile(
                            leading: Icon(
                              item is Directory ? Icons.folder : Icons.insert_drive_file,
                            ),
                            title: Text(item.path.split(Platform.pathSeparator).last),
                            onTap: item is Directory ? () => _openDir(item.path) : null,
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Метод для инициализации корневой директории и загрузки её содержимого
  Future<List<FileSystemEntity>?> _initRoot() async {
    final dirPath = await _pathProvider.getAppDocumentsDirectoryPath();
    if (dirPath == null) {
      setState(() {
        _rootPath = null;
        _currentPath = null;
      });
      return null;
    }
    final files = Directory(dirPath).listSync();
    setState(() {
      _rootPath = dirPath;
      _currentPath = dirPath;
    });
    return files;
  }

  /// Метод для загрузки файлов в указанной директории
  List<FileSystemEntity>? _loadFiles(String path) {
    return Directory(path).listSync();
  }

  /// Метод для открытия директории и загрузки её содержимого
  void _openDir(String path) async {
    setState(() {
      _currentPath = path;
      _loadFilesFuture = Future.value(_loadFiles(path));
    });
  }

  /// Метод для перехода к родительской директории
  void _goBack() async {
    if (_currentPath == null || _rootPath == null || _currentPath == _rootPath) return;
    final parent = Directory(_currentPath!).parent.path;
    if (parent.length < _rootPath!.length) return;
    final files = _loadFiles(parent);
    setState(() {
      _currentPath = parent;
      _loadFilesFuture = Future.value(files);
    });
  }
}
