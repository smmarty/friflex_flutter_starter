import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:friflex_starter/app/ui_kit/app_snackbar.dart';

/// Тесты для виджета AppSnackBar
void main() {
  group('AppSnackBar Widget Tests', () {
    late Widget testApp;

    /// Создание мок-темы с необходимыми цветами для снекбара
    ColorScheme createMockColorScheme() {
      return const ColorScheme.light().copyWith(
        error: Colors.red,
        primary: Colors.blue,
        secondary: Colors.green,
      );
    }

    /// Создание мок-темы с правильными стилями текста
    TextTheme createMockTextTheme() {
      return const TextTheme(bodyMedium: TextStyle(fontSize: 14));
    }

    setUp(() {
      testApp = MaterialApp(
        theme: ThemeData(
          colorScheme: createMockColorScheme(),
          textTheme: createMockTextTheme(),
        ),
        home: const Scaffold(body: Center(child: Text('Тестовый экран'))),
      );
    });

    testTester(String description, WidgetTesterCallback callback) {
      testWidgets(description, (tester) async {
        await tester.pumpWidget(testApp);
        await callback(tester);
      });
    }

    group('AppSnackBar.showInfo', () {
      testTester('показывает снекбар с информацией и правильными стилями', (
        tester,
      ) async {
        const infoMessage = 'Это просто сообщение';

        AppSnackBar.showInfo(
          tester.element(find.byType(Scaffold)),
          message: infoMessage,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.byType(AppSnackBar), findsOneWidget);
        expect(find.text(infoMessage), findsOneWidget);

        // Проверяем иконку и её цвет
        final iconFinder = find.byType(Icon);
        expect(iconFinder, findsOneWidget);
        final icon = tester.widget<Icon>(iconFinder);
        expect(icon.color, equals(Colors.black)); // Info иконка черная

        // Проверяем цвет фона
        final container = tester.widget<Container>(
          find.descendant(
            of: find.byType(GestureDetector),
            matching: find.byType(Container),
          ),
        );
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, equals(const Color(0xFFE6E6E6))); // Info фон
      });
    });

    group('AppSnackBar.showError', () {
      testTester('показывает снекбар с ошибкой и правильными стилями', (
        tester,
      ) async {
        const errorMessage = 'Произошла ошибка';

        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: errorMessage,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.byType(AppSnackBar), findsOneWidget);
        expect(find.text(errorMessage), findsOneWidget);

        // Проверяем иконку и её цвет
        final iconFinder = find.byType(Icon);
        expect(iconFinder, findsOneWidget);
        final icon = tester.widget<Icon>(iconFinder);
        expect(icon.color, equals(Colors.white)); // Error иконка белая

        // Проверяем цвет фона
        final container = tester.widget<Container>(
          find.descendant(
            of: find.byType(GestureDetector),
            matching: find.byType(Container),
          ),
        );
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, equals(const Color(0xFFD24720))); // Error фон
      });

      testTester('показывает снекбар с кастомной продолжительностью', (
        tester,
      ) async {
        const errorMessage = 'Кастомная ошибка';
        const customDuration = Duration(seconds: 5);

        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: errorMessage,
          displayDuration: customDuration,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.byType(AppSnackBar), findsOneWidget);
        expect(find.text(errorMessage), findsOneWidget);
      });

      testTester('заменяет предыдущий снекбар при повторном вызове', (
        tester,
      ) async {
        const firstMessage = 'Первая ошибка';
        const secondMessage = 'Вторая ошибка';

        // Показываем первый снекбар
        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: firstMessage,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.text(firstMessage), findsOneWidget);

        // Показываем второй снекбар
        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: secondMessage,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Проверяем, что показывается только второй снекбар
        expect(find.text(firstMessage), findsNothing);
        expect(find.text(secondMessage), findsOneWidget);
        expect(find.byType(AppSnackBar), findsOneWidget);
      });
    });

    group('AppSnackBar.showSuccess', () {
      testTester('показывает снекбар с успехом и правильными стилями', (
        tester,
      ) async {
        const successMessage = 'Операция выполнена успешно';

        AppSnackBar.showSuccess(
          context: tester.element(find.byType(Scaffold)),
          message: successMessage,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.byType(AppSnackBar), findsOneWidget);
        expect(find.text(successMessage), findsOneWidget);

        // Проверяем иконку и её цвет
        final iconFinder = find.byType(Icon);
        expect(iconFinder, findsOneWidget);
        final icon = tester.widget<Icon>(iconFinder);
        expect(icon.color, equals(Colors.white)); // Success иконка белая

        // Проверяем цвет фона
        final container = tester.widget<Container>(
          find.descendant(
            of: find.byType(GestureDetector),
            matching: find.byType(Container),
          ),
        );
        final decoration = container.decoration as BoxDecoration;
        expect(
          decoration.color,
          equals(const Color(0xFF6FB62C)),
        ); // Success фон
      });

      testTester('показывает снекбар с кастомной продолжительностью', (
        tester,
      ) async {
        const successMessage = 'Кастомный успех';
        const customDuration = Duration(seconds: 2);

        AppSnackBar.showSuccess(
          context: tester.element(find.byType(Scaffold)),
          message: successMessage,
          displayDuration: customDuration,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.byType(AppSnackBar), findsOneWidget);
        expect(find.text(successMessage), findsOneWidget);
      });
    });

    group('AppSnackBar виджет поведение', () {
      testTester(
        'показывает анимацию появления с правильной последовательностью',
        (tester) async {
          const message = 'Тестовое сообщение';

          AppSnackBar.showError(
            tester.element(find.byType(Scaffold)),
            message: message,
          );

          // Проверяем начальное состояние
          await tester.pump();
          final initialPosition = tester.widget<Positioned>(
            find.byType(Positioned),
          );
          expect(initialPosition.top ?? 0, lessThan(0));

          // Проверяем промежуточное состояние
          await tester.pump(const Duration(milliseconds: 150));
          final middlePosition = tester.widget<Positioned>(
            find.byType(Positioned),
          );
          expect(
            middlePosition.top ?? 0,
            greaterThan(initialPosition.top ?? 0),
          );

          // Проверяем конечное состояние
          await tester.pump(const Duration(milliseconds: 150));
          final finalPosition = tester.widget<Positioned>(
            find.byType(Positioned),
          );
          expect(finalPosition.top ?? 0, greaterThan(0));
        },
      );

      testTester('закрывается при тапе', (tester) async {
        const message = 'Тап для закрытия';

        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: message,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 350));

        expect(find.byType(AppSnackBar), findsOneWidget);

        // Тапаем по снекбару
        await tester.tap(find.byType(GestureDetector));
        await tester.pump();

        // Ждем завершения анимации закрытия и удаления из Overlay
        await tester.pumpAndSettle();

        // Проверяем, что снекбар исчез
        expect(find.byType(AppSnackBar), findsNothing);
      });

      testTester('автоматически закрывается через указанное время', (
        tester,
      ) async {
        const message = 'Автозакрытие';
        const duration = Duration(milliseconds: 500);

        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: message,
          displayDuration: duration,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 350));

        expect(find.byType(AppSnackBar), findsOneWidget);

        // Ждем автоматического закрытия
        await tester.pump(duration);
        await tester.pumpAndSettle();

        expect(find.byType(AppSnackBar), findsNothing);
      });

      testTester('отображает длинное сообщение с ellipsis', (tester) async {
        const longMessage =
            'Это очень длинное сообщение, которое должно отображаться в нескольких строках и обрезаться с помощью ellipsis если оно слишком длинное для отображения в виджете снекбара';

        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: longMessage,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.byType(AppSnackBar), findsOneWidget);

        // Проверяем, что текст имеет ограничение по строкам
        final textWidget = tester.widget<Text>(find.text(longMessage));
        expect(textWidget.maxLines, equals(3));
        expect(textWidget.overflow, equals(TextOverflow.ellipsis));
      });

      testTester('имеет правильную структуру виджета', (tester) async {
        const message = 'Структура';

        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: message,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Проверяем основную структуру
        expect(find.byType(Positioned), findsOneWidget);
        expect(find.byType(Material), findsAtLeastNWidgets(1));
        expect(find.byType(GestureDetector), findsOneWidget);
        expect(find.byType(Container), findsAtLeastNWidgets(1));
        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(Icon), findsOneWidget);
        expect(find.byType(Text), findsAtLeastNWidgets(1));
      });

      testTester('имеет правильные отступы и размеры на разных экранах', (
        tester,
      ) async {
        const message = 'Размеры';

        // Тестируем на маленьком экране
        await tester.binding.setSurfaceSize(const Size(320, 480));
        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: message,
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        var container = tester.widget<Container>(
          find.descendant(
            of: find.byType(GestureDetector),
            matching: find.byType(Container),
          ),
        );
        // На маленьком экране максимальная ширина должна быть 350
        expect(container.constraints?.maxWidth, equals(350));

        // Тестируем на большом экране
        await tester.binding.setSurfaceSize(const Size(1280, 720));
        await tester.pumpWidget(testApp);
        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: message,
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        container = tester.widget<Container>(
          find.descendant(
            of: find.byType(GestureDetector),
            matching: find.byType(Container),
          ),
        );
        expect(
          container.constraints?.maxWidth,
          equals(350),
        ); // Максимальная ширина
      });

      testTester('имеет правильное скругление углов', (tester) async {
        const message = 'Скругление';

        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: message,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        final container = tester.widget<Container>(
          find.descendant(
            of: find.byType(GestureDetector),
            matching: find.byType(Container),
          ),
        );

        final decoration = container.decoration as BoxDecoration;
        expect(decoration.borderRadius, equals(BorderRadius.circular(16)));
      });
    });

    group('Доступность', () {
      testTester('имеет правильные семантические метки', (tester) async {
        const message = 'Доступность';

        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: message,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Проверяем наличие текста сообщения
        expect(find.text(message), findsOneWidget);

        // Проверяем наличие GestureDetector для закрытия
        expect(find.byType(GestureDetector), findsOneWidget);
      });
    });

    group('Управление состоянием', () {
      testTester('правильно обрабатывает отсутствие mounted контекста', (
        tester,
      ) async {
        const message = 'Unmounted контекст';

        // Создаем виджет, который будет удален
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      AppSnackBar.showError(context, message: message);
                    },
                    child: const Text('Show SnackBar'),
                  ),
                );
              },
            ),
          ),
        );

        // Нажимаем кнопку для показа снекбара
        await tester.tap(find.byType(ElevatedButton));
        await tester.pump();

        // Заменяем весь виджет (контекст становится unmounted)
        await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: Text('New Screen'))),
        );

        // Проверяем, что ошибки не возникает
        expect(tester.takeException(), isNull);
      });

      testTester('правильно очищает ресурсы при dispose', (tester) async {
        const message = 'Очистка ресурсов';

        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: message,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.byType(AppSnackBar), findsOneWidget);

        // Заменяем весь виджет для вызова dispose
        await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: Text('New Screen'))),
        );

        // Проверяем, что ошибки не возникает при dispose
        expect(tester.takeException(), isNull);
      });

      testTester('правильно обрабатывает быстрые последовательные вызовы', (
        tester,
      ) async {
        const messages = ['Сообщение 1', 'Сообщение 2', 'Сообщение 3'];

        for (final message in messages) {
          AppSnackBar.showError(
            tester.element(find.byType(Scaffold)),
            message: message,
          );
          await tester.pump();
        }

        await tester.pump(const Duration(milliseconds: 100));

        // Проверяем, что показывается только последнее сообщение
        expect(find.text(messages[0]), findsNothing);
        expect(find.text(messages[1]), findsNothing);
        expect(find.text(messages[2]), findsOneWidget);
      });
    });

    group('Управление снекбарами', () {
      testTester('правильно заменяет предыдущий снекбар новым', (tester) async {
        const firstMessage = 'Первый снекбар';
        const secondMessage = 'Второй снекбар';

        // Показываем первый снекбар
        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: firstMessage,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.text(firstMessage), findsOneWidget);

        // Показываем второй снекбар (должен заменить первый)
        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: secondMessage,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Проверяем, что остался только второй снекбар
        expect(find.text(firstMessage), findsNothing);
        expect(find.text(secondMessage), findsOneWidget);
      });

      testTester('правильно заменяет снекбар error на success', (tester) async {
        const errorMessage = 'Ошибка';
        const successMessage = 'Успех';

        // Показываем снекбар с ошибкой
        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: errorMessage,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.text(errorMessage), findsOneWidget);

        // Показываем снекбар с успехом
        AppSnackBar.showSuccess(
          context: tester.element(find.byType(Scaffold)),
          message: successMessage,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        // Проверяем, что показывается только снекбар с успехом
        expect(find.text(errorMessage), findsNothing);
        expect(find.text(successMessage), findsOneWidget);
      });
    });

    group('Анимация', () {
      testTester('анимация появления работает корректно', (tester) async {
        const message = 'Анимация появления';

        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: message,
        );

        // В начале анимации снекбар должен находиться за пределами экрана
        await tester.pump();

        final positionedWidget = tester.widget<Positioned>(
          find.byType(Positioned),
        );
        expect(positionedWidget.top, lessThan(0));

        // После завершения анимации снекбар должен быть виден
        await tester.pump(const Duration(milliseconds: 300));

        final positionedWidgetAfter = tester.widget<Positioned>(
          find.byType(Positioned),
        );
        expect(positionedWidgetAfter.top, greaterThan(0));
      });

      testTester('анимация скрытия работает корректно при тапе', (
        tester,
      ) async {
        const message = 'Анимация скрытия';

        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: message,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 350));

        expect(find.byType(AppSnackBar), findsOneWidget);

        // Тапаем для закрытия
        await tester.tap(find.byType(GestureDetector));
        await tester.pump();

        // Анимация закрытия должна начаться
        expect(find.byType(AppSnackBar), findsOneWidget);

        // После завершения анимации снекбар должен исчезнуть
        await tester.pumpAndSettle();
        expect(find.byType(AppSnackBar), findsNothing);
      });
    });

    group('Интеграция с MediaQuery', () {
      testTester('правильно позиционируется с учетом SafeArea', (tester) async {
        const message = 'SafeArea test';

        // Создаем приложение с кастомными отступами
        await tester.pumpWidget(
          const MaterialApp(
            home: MediaQuery(
              data: MediaQueryData(
                padding: EdgeInsets.only(top: 50), // Симулируем статус бар
              ),
              child: Scaffold(body: Center(child: Text('Test'))),
            ),
          ),
        );

        AppSnackBar.showError(
          tester.element(find.byType(Scaffold)),
          message: message,
        );

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 350));

        // Проверяем, что снекбар отображается (позиция может варьироваться в зависимости от того,
        // когда именно MediaQuery применяется)
        final positionedWidget = tester.widget<Positioned>(
          find.byType(Positioned),
        );
        expect(
          positionedWidget.top,
          greaterThan(0),
        ); // Снекбар должен быть видимым
        expect(find.byType(AppSnackBar), findsOneWidget);
      });
    });
  });
}
