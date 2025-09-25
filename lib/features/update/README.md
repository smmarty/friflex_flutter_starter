# Модуль Hard/Soft Updates

Модуль для управления обновлениями приложения. Поддерживает мягкие (soft) и обязательные (hard) обновления.

## Ключевые сущности и состояния

- **`UpdateEntity`**: доменная сущность с данными об обновлении
  - `availableVersion`: доступная версия
  - `updateUrl`: ссылка на обновление
  - `updateType`: тип (`soft` | `hard`), см. `UpdateType`
  - `whatIsNew`: описание изменений

- **`UpdateType`**: перечисление типов обновления
  - `UpdateType.soft`
  - `UpdateType.hard`
  - `UpdateType.none`

- **`UpdateCubit`**: управление состоянием проверки обновлений
  - Состояния: `UpdateInitialState`, `UpdateLoadingState`, `UpdateSuccessState(UpdateEntity?)`, `UpdateErrorState(message)`
  - Метод: `checkForUpdates({required String versionCode, required String platform})`

## Репозитории

- **`IUpdateRepository`**: Интерфейс, описывающий методы для проверки обновлений.
  - Возвращает `Future<UpdateEntity>` (не может быть `null`)

- **`UpdateRepository`**: заготовка для реальной интеграции (бэкенд/стор)
  - Реализуйте логику в `checkForUpdates`

- **`UpdateMockRepository`**: мок-реализация для разработки/демо
  - Возвращает фиктивное обновление (по умолчанию soft)

## UI

- **Soft update** — `SoftUpdateModal`
  - BottomSheet с заголовком, списком изменений и кнопками: «Отложить» и «Обновить»
  - Статический метод `show` безопасно не откроет модалку, если `updateEntity == null`

Пример показа модального окна:
```dart
await SoftUpdateModal.show(
  context,
  updateEntity: updateEntity, // экземпляр UpdateEntity
  onUpdate: () {
    // TODO: переход в стор/браузер по updateEntity.updateUrl
  },
);
```

- **Hard update** — `HardUpdateScreen`
  - Блокирующий экран, информирует и не даёт продолжить без обновления

## Роуты

- `UpdateRoutes.buildRoutes()` — регистрирует экран hard-обновления по пути `/update`


## Структура модуля

```
features/update/
├── data/
│   └── repository/
│       ├── update_repository.dart        # реализация для интеграции
│       └── update_mock_repository.dart   # мок-репозиторий
├── domain/
│   ├── entity/
│   │   └── update_entity.dart            # доменная сущность
│   ├── repository/
│   │   └── i_update_repository.dart      # контракт репозитория
│   └── state/
│       └── cubit/
│           ├── update_cubit.dart         # кубит и логика
│           └── update_state.dart         # состояния
├── presentation/
│   ├── components/
│   │   └── soft_modal_sheet.dart         # модалка для soft-обновления
│   └── screens/
│       └── hard_update_screen.dart       # экран для hard-обновления
├── update_type.dart                       # константы типов обновления
└── update_routes.dart                     # роут на hard-экран
```

## Заметки по реализации

- Для продакшена реализуйте переход в магазин или браузер по `updateUrl`
- Для soft-обновления не блокируйте UX; для hard — перенаправляйте на блокирующий экран
- Возвращайте `null` из репозитория, если обновлений нет
