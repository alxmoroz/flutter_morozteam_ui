# План создания flutter_morozteam_ui package

## Решения по архитектуре

**Принятые решения:**
- Название: `flutter_morozteam_ui`
- Расположение: `/Users/alexandr/MorozTeam/projects/flutter_morozteam_ui/`
- GitHub репозиторий: `flutter_morozteam_ui`
- Конфигурация: UIKitConfig класс (глобальная настройка темы)
- Шрифты: предоставляются приложением через конфиг
- Сетка: настраиваемое значение P (по умолчанию 6.0)
- Компоненты: все общие компоненты (~25-30)
- Миграция: постепенная, начиная с наиболее совместимого проекта

## Текущий статус

### ✅ Завершено

1. **Создана структура пакета** - Flutter package с правильной структурой папок
2. **Git репозиторий** - инициализирован, ветка main
3. **Конфигурационный слой** - UIKitConfig и UITheme классы
4. **Базовая тема** (частично):
   - ✅ `lib/src/config/ui_config.dart` - класс конфигурации
   - ✅ `lib/src/config/ui_theme.dart` - InheritedWidget для темы
   - ✅ `lib/src/theme/colors.dart` - система цветов
   - ✅ `lib/src/theme/constants.dart` - константы spacing и размеров
   - ✅ `lib/src/theme/text.dart` - типографика (требует исправления)
   - ✅ `lib/flutter_morozteam_ui.dart` - главный файл экспорта

### ✅ Завершено (обновлено)

1. **Исправление ошибок в text.dart** ✅:
   - ✅ Исправлена ошибка на строке 192: `UITheme.of(context).config` → `UITheme.of(context)`
   - ✅ Удалены неиспользуемые импорты
   - ✅ Удалены неиспользуемые классы `_F2Text` и `_F3Text`
   - ✅ Обновлен `ui_theme.dart` для правильной инициализации
   - ✅ Обновлен `flutter_morozteam_ui.dart` с правильными экспортами
   - ✅ Обновлен `pubspec.yaml` с метаданными
   - ✅ Исправлены тесты
   - ✅ Создан example приложение
   - ✅ Написана документация (README.md, CHANGELOG.md)
   - ✅ Пакет готов к публикации (dry-run успешен)

### 📋 Осталось сделать

#### 2. Портирование компонентов

**Утилиты (базовые зависимости для других компонентов):**
- [ ] `lib/src/utils/adaptive.dart` - MTAdaptive, isBigScreen, screenSize
- [ ] `lib/src/utils/gesture.dart` - GestureManaging mixin, FocusDroppable
- [ ] `lib/src/utils/material_wrapper.dart` - обертка для Material виджетов

**Базовые UI компоненты:**
- [ ] `lib/src/components/button.dart` - MTButton (main, secondary, danger, safe, icon, card)
- [ ] `lib/src/components/card.dart` - MTCard
- [ ] `lib/src/components/loader.dart` / `circular_progress.dart` - индикаторы загрузки
- [ ] `lib/src/components/progress.dart` - прогресс бары
- [ ] `lib/src/components/divider.dart` - разделители
- [ ] `lib/src/components/circle.dart` - круглые элементы

**Компоненты форм:**
- [ ] `lib/src/components/text_field.dart` - поля ввода текста
- [ ] `lib/src/components/field_data.dart` - вспомогательные типы для полей
- [ ] `lib/src/components/checkbox.dart` - чекбоксы
- [ ] `lib/src/components/dropdown.dart` - выпадающие списки

**Навигация и Layout:**
- [ ] `lib/src/components/dialog.dart` - MTDialog, showMTDialog, MTDialogPage
- [ ] `lib/src/components/page.dart` - MTPage
- [ ] `lib/src/components/toolbar.dart` - MTToolbar, MTTopBar
- [ ] `lib/src/components/page_title.dart` - заголовки страниц
- [ ] `lib/src/components/list_tile.dart` - элементы списка

**Дополнительные компоненты:**
- [ ] `lib/src/components/icons.dart` - иконки
- [ ] `lib/src/components/background.dart` - фоновые элементы
- [ ] `lib/src/components/shadowed.dart` - элементы с тенью
- [ ] `lib/src/components/scrollable.dart` / `scrollable_centered.dart` - скроллируемые контейнеры
- [ ] `lib/src/components/refresh.dart` - pull-to-refresh

#### 3. Example приложение

Создать `example/lib/main.dart` с демонстрацией:
- Инициализация UIKitConfig с разными темами
- Все варианты кнопок
- Типографика (H1, H2, H3, BaseText, SmallText и т.д.)
- Формы
- Диалоги
- Цветовая схема

#### 4. Документация

- [ ] `README.md` - описание, установка, быстрый старт, примеры
- [ ] `CHANGELOG.md` - версия 0.1.0 с описанием функционала
- [ ] API документация в комментариях к коду

#### 5. Публикация

- [ ] Проверка через `dart pub publish --dry-run`
- [ ] Создание GitHub репозитория
- [ ] Push в GitHub
- [ ] Публикация на pub.dev

#### 6. Миграция проектов

После публикации проанализировать совместимость:
- **avanplan**: математическая цветовая схема - хорошая совместимость ✅
- **mamagochi**: похожа на avanplan - хорошая совместимость ✅
- **leitsy**: статичные цвета - средняя совместимость
- **cast**: упрощенная схема, GeistMono - требует адаптации

## Ключевые файлы из проектов для изучения

**Цвета:**
- `/Users/alexandr/MorozTeam/projects/avanplan_frontend/lib/L3_app/theme/colors.dart`

**Типографика:**
- `/Users/alexandr/MorozTeam/projects/avanplan_frontend/lib/L3_app/theme/text.dart`

**Компоненты:**
- `/Users/alexandr/MorozTeam/projects/avanplan_frontend/lib/L3_app/components/button.dart`
- `/Users/alexandr/500na700/cast/lib/L3_app/components/dialog.dart`
- `/Users/alexandr/MorozTeam/projects/avanplan_frontend/lib/L3_app/components/`

## Известные проблемы

1. **text.dart ошибка на строке 192**: неправильное обращение к config
2. **Неиспользуемые импорты** в text.dart
3. **Info warnings** про naming (P2, P3 и т.д.) - можно игнорировать, это намеренный стиль

## Команды для работы

```bash
# Переключиться в проект
cd /Users/alexandr/MorozTeam/projects/flutter_morozteam_ui

# Установить зависимости
flutter pub get

# Анализ кода
dart analyze lib/

# Запуск example
cd example && flutter run

# Проверка перед публикацией
dart pub publish --dry-run

# Публикация
dart pub publish
```

## Следующие шаги

1. Исправить ошибки в text.dart
2. Портировать утилиты (adaptive, gesture, material_wrapper)
3. Портировать базовые компоненты (button, card, loader)
4. Создать минимальное example приложение
5. Написать README.md
6. Опубликовать на pub.dev

