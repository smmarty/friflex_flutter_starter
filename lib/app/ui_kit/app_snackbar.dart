import 'dart:async';

import 'package:flutter/material.dart';
import 'package:friflex_starter/app/app_context_ext.dart';
import 'package:friflex_starter/app/theme/app_colors_scheme.dart';
import 'package:friflex_starter/app/ui_kit/app_box.dart';

/// {@template app_snackbar}
/// Перечисление для типов снекбаров
/// Используется для определения цвета и назначения снекбара
/// {@endtemplate}
enum TypeSnackBar {
  /// Снекбар с успехом
  success,

  /// Снекбар с ошибкой
  error,
}

/// {@template app_snackbar}
/// Менеджер для управления снекбарами
/// Используется для показа снекбаров в верхней части экрана
/// Имеет статические методы для показа снекбаров с разными типами
/// [showError] - для показа снекбара с ошибкой,
/// [showSuccess] - для показа снекбара с успехом
/// {@endtemplate}
class AppSnackBar extends StatefulWidget {
  /// {@macro app_snackbar}
  const AppSnackBar._({
    required this.message,
    required this.type,
    required this.displayDuration,
    this.onDismiss,
  });

  /// Сообщение, которое будет отображаться в снекбаре
  final String message;

  /// Тип снекбара, определяющий его цвет и назначение
  final TypeSnackBar type;

  /// Продолжительность отображения снекбара
  final Duration displayDuration;

  /// Функция, вызываемая при закрытии снекбара
  final VoidCallback? onDismiss;

  @override
  State<AppSnackBar> createState() => _AppSnackBarState();

  /// Показать снекбар с ошибкой
  /// [context] - контекст, в котором будет показан снекбар
  /// [message] - сообщение, которое будет отображаться в снекбаре
  /// [displayDuration] - продолжительность отображения снекбара
  /// По умолчанию 3 секунды
  static void showError(
    BuildContext context, {
    required String message,
    Duration displayDuration = const Duration(seconds: 3),
  }) {
    _show(
      context: context,
      message: message,
      type: TypeSnackBar.error,
      displayDuration: displayDuration,
    );
  }

  /// Показать снекбар с успехом
  /// [context] - контекст, в котором будет показан снекбар
  /// [message] - сообщение, которое будет отображаться в снекбаре
  /// [displayDuration] - продолжительность отображения снекбара
  /// По умолчанию 3 секунды
  static void showSuccess({
    required BuildContext context,
    required String message,
    Duration displayDuration = const Duration(seconds: 3),
  }) {
    _show(
      context: context,
      message: message,
      type: TypeSnackBar.success,
      displayDuration: displayDuration,
    );
  }

  /// Приватный метод для показа снекбара
  /// Используется статическими методами [showError] и [showSuccess]
  static void _show({
    required BuildContext context,
    required String message,
    required TypeSnackBar type,
    required Duration displayDuration,
  }) {
    // Удаляем предыдущий снекбар
    _removeCurrentSnackBar();

    if (!context.mounted) return;

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => AppSnackBar._(
        message: message,
        type: type,
        displayDuration: displayDuration,
        onDismiss: _removeCurrentSnackBar,
      ),
    );

    _currentSnackBar = overlayEntry;
    overlay.insert(overlayEntry);
  }

  static OverlayEntry? _currentSnackBar;

  static void _removeCurrentSnackBar() {
    _currentSnackBar?.remove();
    _currentSnackBar = null;
  }
}

class _AppSnackBarState extends State<AppSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  Timer? _dismissTimer;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _initAnimation();
      _startDismissTimer();
      _isInitialized = true;
    }
  }

  /// Инициализация анимации для снекбара
  /// Используется для определения начальной и конечной позиции снекбара
  /// Начальная позиция - за пределами экрана, конечная - 15 пикселей ниже верхнего отступа
  void _initAnimation() {
    final topPadding = MediaQuery.of(context).padding.top;
    // Начальная позиция снекбара - за пределами экрана
    final startPosition = -200.0;
    // Конечная позиция снекбара - 15 пикселей ниже верхнего отступа
    final endPosition = topPadding + 15;
    // Создание анимации с использованием Tween
    _slideAnimation = Tween<double>(begin: startPosition, end: endPosition)
        .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward();
  }

  /// Запуск таймера для автоматического закрытия снекбара
  /// Таймер срабатывает по истечении [widget.displayDuration]
  /// и вызывает метод [_dismiss] для закрытия снекбара
  void _startDismissTimer() {
    _dismissTimer = Timer(widget.displayDuration, _dismiss);
  }

  /// Закрытие снекбара
  /// Отменяет таймер, если он существует, и запускает обратную анимацию
  /// После завершения анимации вызывает функцию [widget.onDismiss], если она задана
  /// Если виджет не смонтирован, ничего не делает
  void _dismiss() {
    if (!mounted) return;

    _dismissTimer?.cancel();
    _animationController.reverse().then((_) {
      if (mounted) {
        widget.onDismiss?.call();
      }
    });
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return Positioned(
          left: 0,
          right: 0,
          top: _slideAnimation.value,
          child: Material(
            child: GestureDetector(
              onTap: _dismiss,
              behavior: HitTestBehavior.opaque,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 350),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: _getBackgroundColor(widget.type),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    _Icon(type: widget.type),
                    const WBox(10),
                    Flexible(
                      child: Text(
                        widget.message,
                        style: TextStyle(color: Colors.white),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Получение цвета фона снекбара в зависимости от его типа
  /// Возвращает [Color] в зависимости от типа снекбара
  /// [TypeSnackBar.success] - цвет успеха
  /// [TypeSnackBar.error] - цвет ошибки
  Color _getBackgroundColor(TypeSnackBar type) {
    return switch (type) {
      TypeSnackBar.success => context.colors.successSnackbarBackground,
      TypeSnackBar.error => context.colors.errorSnackbarBackground,
    };
  }
}

/// {@template _Icon}
/// Виджет для отображения иконки в снекбаре
/// Используется для отображения иконки в зависимости от типа снекбара
/// {@endtemplate}
class _Icon extends StatelessWidget {
  /// {@macro _Icon}
  /// Создает экземпляр иконки для снекбара
  /// Принимает [type] - тип снекбара, определяющий иконку
  /// Используется для отображения иконки успеха или ошибки
  const _Icon({required this.type});

  /// Тип снекбара, определяющий иконку
  final TypeSnackBar type;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      TypeSnackBar.success => Icon(
        Icons.check_circle,
        color: Colors.white,
        size: 32,
      ),
      TypeSnackBar.error => Icon(Icons.error, color: Colors.white, size: 32),
    };
  }
}
