# Стиль кода

Мы придерживаемся рекомендаций, описанных в
[Effective Dart](https://dart.dev/guides/language/effective-dart/design)

Перед каждым PR необходимо отформатировать код и проверить анализатор на отсутствие сообщений.

## Именование

### Интерфейсы

Утверждены два вида объявления интерфейсов:

1. Все интерфейсы в приложении должны начинаться с заглавной буквы "**I**".

Например: **IAuthRepository**, **IProfileRepository**, **IMainRunner** и т.д.

Таким образом, сразу видно, что работаешь с интерфейсом.
Пример:

```dart
/// Интерфейс -  **IUserRepository**
abstract interface class IUserRepository {}
/// Основная реализация (prod и stage окружения)
class UserRepository implements IUserRepository {}
/// Иная реализация (мок, локальное хранилище) должна содержать
/// постфикс функциональности: 
/// - Network - сетевое взаимодействие.
/// - Local - локальное хранилище.
/// - Mock - мок репозиторий.
class UserRepositoryLocal implements IUserRepository {}
```

### Классы - Репозитории

Репозитории должны содержать в конце название источника данных (если используется мок или локальное хранилище).\
Основная реализация, не должна содержать постфикса.

Например: Интерфейс -  **IAuthRepository**\
Основная реализация (prod и stage окружения) - **AuthRepository**  
Мок (мок данные) - **AuthRepositoryMock**\
Локальное хранилище (например бд или просто имитация данных) - **AuthRepositoryLocal**

### Файлы

Используется snake_case.
Название файла должно иметь следующую структуру: [раздел]_[тип].dart

Пример: user_details_screen.dart, shop_entity.dart

### Классы

Название классов UpperCamelCase.
Для создание приватных классов используем префикс _ . Название класса в конце должно содержать в себе тип.

Пример: **UserEntity**, **AdultDialog**

## Методы

Название метода в начале должно содержать в себе действие(глагол):

- fetch
- put
- update
- delete и так далее
  
Пример:

```dart
int fetchFirstElement(){}
```

Пример:

```dart
void updateFirstElement(){};
```

Название метода не должно содержать в себе And/Or
и метод соответственно не должен выполнять подобную логику.

## Переменные и константы

Константы именуются также lowerCamelCase.
Пример:

```dart
const String carItem 
```

или

```dart
final userName;
```

## Виджеты

Виджеты именуются UpperCamelCase.
В названии виджетов не должно содержаться слово widget.

### Экраны

Экраны, используемые в роутинге, именуются с постфиксом Screen.
Например, **ShopListScreen**.

### Содержимое экрана

Виджеты, отображающие содержимое экрана, именуются с постфиксом View.
Например, **ShopListView**.

### Глобальные виджеты

Глобальные виджеты именуются с приставкой App.
Например, **AppButton**.

## Структура класса

Объявления элементов класса должны располагаться в следующем порядке:

1. **Constructors**
     - constructors
     - named-constructors
     - factory-constructors
2. **Static**
     - public-static-methods
     - private-static-methods
     - public-static-const-fields
     - private-static-const-fields
     - public-static-final-fields
     - private-static-final-fields
     - public-static-fields
     - private-static-fields
3. **Fields**
     - public-final-fields
     - private-final-fields
     - public-fields
     - private-fields
4. **Getters/Setters**
     - public-getters-setters
     - private-getters-setters
5. **Methods**
     - overridden-methods
     - public-methods
     - protected-methods
     - private-methods
