## [0.1.0] - 2025-01-17

### Added
- **Конфигурационная система**
  - `UIKitConfig` - класс для настройки темы
  - `UITheme` и `UIThemeProvider` - система тем
  - Поддержка настраиваемых цветов, типографики и spacing

- **Система цветов**
  - `UIColors` - семантические цвета (B0-B3, F1-F3)
  - Поддержка акцентных цветов (main, danger, safe)
  - Интеграция с CupertinoDynamicColor

- **Система констант**
  - `UIConstants` - настраиваемая система spacing (P, P2, P3...)
  - Breakpoints для адаптивности
  - Стандартные размеры и отступы

- **Типографика**
  - `BaseText` - базовый текстовый виджет
  - `H1`, `H2`, `H3` - заголовки
  - `BaseText.medium()`, `BaseText.bold()` - варианты веса
  - `SmallText`, `NumbersText`, `LinkText` - специализированные тексты

- **Компоненты**
  - `MTButton` - универсальная кнопка с различными стилями
  - `MTButton.main()`, `MTButton.secondary()`, `MTButton.danger()`, `MTButton.safe()`, `MTButton.icon()`

- **Утилиты**
  - `MTAdaptive` - адаптивные контейнеры
  - `GestureManaging` - миксин для управления жестами
  - `FocusDroppable` - убирает фокус при нажатии
  - `material()` - обертка для Material виджетов

- **Документация**
  - README.md с примерами использования
  - Example приложение с демонстрацией всех компонентов

### Technical Details
- Flutter SDK: >=3.0.0
- Поддержка всех платформ (iOS, Android, Web, Desktop)
- Оптимизированная производительность
- Строгая типизация
