# Flutter MorozTeam UI

Универсальный UI kit для Flutter приложений с гибкой системой конфигурации цветов, типографики и spacing.

## Особенности

- 🎨 **Гибкая система тем** - настраиваемые цвета, типографика и spacing
- 📱 **Адаптивный дизайн** - поддержка различных размеров экранов
- 🎯 **Консистентность** - единообразные компоненты и стили
- ⚡ **Производительность** - оптимизированные виджеты
- 🔧 **Кастомизация** - легкая настройка под любой проект

## Установка

Добавьте в `pubspec.yaml`:

```yaml
dependencies:
  flutter_morozteam_ui: ^0.1.0
```

Затем выполните:

```bash
flutter pub get
```

## Быстрый старт

### 1. Настройка темы

Оберните ваше приложение в `UIThemeProvider`:

```dart
import 'package:flutter_morozteam_ui/flutter_morozteam_ui.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: UIThemeProvider(
        config: myConfig,
        child: MyHomePage(),
      ),
    );
  }
}
```

### 2. Создание конфигурации

```dart
const myConfig = UIKitConfig(
  // Цвета фона
  b0Color: Color(0xFF1A1A1A),
  b1Color: Color(0xFF2A2A2A),
  b2Color: Color(0xFF3A3A3A),
  b3Color: Color(0xFFF5F5F5),
  
  // Цвета текста
  f1Color: Color(0xFF1A1A1A),
  f2Color: Color(0xFF666666),
  f3Color: Color(0xFF999999),
  
  // Акцентные цвета
  mainColor: Color(0xFF007AFF),
  dangerColor: Color(0xFFFF3B30),
  safeColor: Color(0xFF34C759),
  
  // Типографика
  fontFamily: 'SF Pro Text',
  fontFamilyNumbers: 'SF Mono',
  baseFontSize: 16.0,
  
  // Spacing
  baseSpacing: 6.0,
  
  // Размеры
  minButtonHeight: 48.0,
  defaultBorderRadius: 12.0,
);
```

### 3. Использование компонентов

```dart
// Кнопки
MTButton.main(
  titleText: 'Главная кнопка',
  onTap: () => print('Нажата!'),
)

MTButton.secondary(
  titleText: 'Вторичная кнопка',
  onTap: () => print('Нажата!'),
)

// Текст
H1('Заголовок 1')
H2('Заголовок 2')
BaseText('Обычный текст')
BaseText.medium('Полужирный текст')
SmallText('Мелкий текст')

// Адаптивные контейнеры
MTAdaptive.xxs(
  child: Container(
    child: Text('Узкий контейнер'),
  ),
)
```

## Компоненты

### Кнопки и элементы списка

- `MTButton` - универсальная кнопка с 5 вариантами
- `MTListTile` - элемент списка
- `MTSectionTitle` - заголовок секции
- `MTListText` - текстовый элемент списка

### Контейнеры и карточки

- `MTCard` - карточка с тенью
- `MTCircle` - круглый элемент
- `MTBackgroundWrapper` - обертка с градиентным фоном

### Индикаторы

- `MTLoader` - загрузчик с полупрозрачным фоном
- `MTCircularProgress` - круговой индикатор
- `MTProgress` - прогресс бар
- `MTDivider` - разделительная линия

### Иконки

- `MTIcon` - базовый класс
- `PlusIcon`, `CloseIcon`, `BackIcon` и другие

### Страницы и навигация

- `MTPage` - базовый виджет страницы
- `MTTopBar` / `MTBottomBar` - панели навигации
- `PageTitle` - заголовок страницы

### Скроллинг и тени

- `MTScrollable` - скроллируемый контейнер с тенями
- `MTShadowed` - виджет с тенями
- `MTRefresh` - pull-to-refresh

### Типографика

- `H1`, `H2`, `H3` - заголовки
- `BaseText` - основной текст
- `BaseText.medium()` - полужирный текст
- `BaseText.bold()` - жирный текст
- `SmallText` - мелкий текст
- `NumbersText` - текст для цифр
- `LinkText` - ссылки

### Утилиты

- `MTAdaptive` - адаптивные контейнеры
- `GestureManaging` - миксин для управления жестами
- `FocusDroppable` - убирает фокус при нажатии

## Система цветов

UI Kit использует семантическую систему цветов:

- **B0-B3** - цвета фона (от темного к светлому)
- **F1-F3** - цвета текста (от основного к светлому)
- **mainColor** - основной акцентный цвет
- **dangerColor** - цвет для опасных действий
- **safeColor** - цвет для безопасных действий

## Система spacing

Базовое значение `P = 6.0` (настраивается):

- `P` = 6.0
- `P2` = 12.0
- `P3` = 18.0
- `P4` = 24.0
- и т.д.

## Пример

Смотрите папку `example/` для полного примера использования.

## Лицензия

MIT License

## Автор

Alexandr Moroz - MorozTeam