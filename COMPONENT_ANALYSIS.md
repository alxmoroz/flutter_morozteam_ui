# Анализ компонентов из 4 проектов

## Статистика проектов

| Проект | Кол-во компонентов | Последнее обновление |
|--------|-------------------|---------------------|
| **avanplan** | 61 | Sept 15, 2024 |
| **mamagochi** | 51 | Oct 14, 2024 (самый свежий!) |
| **leitsy** | 38 | - |
| **cast** | 28 | Oct 7-9, 2024 |

## Матрица компонентов по проектам

### ✅ Общие для всех 4 проектов (критически важные)

| Компонент | Победитель | Причина |
|-----------|-----------|---------|
| **button.dart** | cast | Более минималистичный (3 типа), добавлены borderRadiusGeometry, mainAxisAlignment |
| **list_tile.dart** | cast (Oct 7) | Самая свежая версия |
| **dialog.dart** | cast | Есть параметр `forceCenter` |
| **page.dart** | mamagochi (Oct 14) | Самая свежая версия |
| **toolbar.dart** | mamagochi (Oct 14) | Самая свежая версия |
| **text_field.dart** | leitsy | Параметр `fillColor` в decoration, более гибкий |
| **card.dart** | avanplan | Уже портирован |
| **circle.dart** | avanplan | Уже портирован |
| **circular_progress.dart** | avanplan | Уже портирован |
| **divider.dart** | avanplan | Уже портирован |
| **loader.dart** | avanplan | Уже портирован |
| **page_title.dart** | avanplan | Уже портирован |
| **refresh.dart** | avanplan | Уже портирован |
| **scrollable.dart** | avanplan | Уже портирован |
| **scrollable_centered.dart** | avanplan | Не портирован, нужно добавить |
| **shadowed.dart** | avanplan | Уже портирован |
| **adaptive.dart** | avanplan | Уже портирован |
| **background.dart** | avanplan | Уже портирован |
| **close_dialog_button.dart** | любой | Простой компонент |
| **constants.dart** | avanplan | Уже в пакете как theme/constants |
| **gesture.dart** | avanplan | Уже портирован |
| **icons.dart** | cast (Oct 9) | Самая свежая |
| **material_wrapper.dart** | avanplan | Уже портирован |

### 📋 Есть в 3 проектах (avanplan, mamagochi, leitsy)

| Компонент | Победитель | Нужен? |
|-----------|-----------|--------|
| **alert_dialog.dart** | mamagochi | ⏳ Да |
| **avatar.dart** | leitsy/avanplan | ⏳ Да |
| **field.dart** | mamagochi | ⏳ Да |
| **field_data.dart** | mamagochi | ⏳ Да |
| **images.dart** | любой | ⏳ Да |
| **snackbar_dialog.dart** | mamagochi | ⏳ Да |
| **webview_dialog.dart** | avanplan | ❓ Специфичный |

### 🔧 Есть в 2 проектах (avanplan, mamagochi)

| Компонент | Победитель | Нужен? |
|-----------|-----------|--------|
| **checkbox.dart** | avanplan | ✅ Да, есть параметр `uf` |
| **dropdown.dart** | avanplan/mamagochi | ✅ Да (убрать зависимость RPersistable) |
| **grid_button.dart** | avanplan | ❓ Специфичный |
| **grid_multiselect_button.dart** | avanplan | ❓ Специфичный |
| **pie_chart.dart** | avanplan | ❓ Специфичный |
| **progress.dart** | avanplan | ✅ Уже портирован |
| **text_field_inline.dart** | mamagochi | ⏳ Да |
| **toolbar_controller.dart** | mamagochi | ❌ Mobx зависимость |
| **vertical_toolbar.dart** | avanplan | ❓ Специфичный |

### 🎯 Уникальные компоненты (пока не портировать)

**mamagochi:**
- `datetime_picker.dart` - ⏳ Позже

**avanplan:**
- `price.dart` - ❓ Специфичный для бизнес-логики
- `painters.dart` - ❓ Проверить
- `barrier.dart` - ⏳ Возможно нужен
- `select_dialog.dart` - ⏳ Возможно нужен

**leitsy:**
- `content_empty_pane.dart` - ⏳ Позже
- `fade_in_image_or_gray_box.dart` - ⏳ Позже
- `folding_section.dart` - ⏳ Позже
- `upload_image_box.dart` - ❓ Специфичный
- `html.dart` - ⏳ Позже

**cast:**
- `image_svg_asset.dart` - ⏳ Позже
- `markdown.dart` - ⏳ Позже

## 🎯 Приоритетный план портирования

### 1. Критически важные (требуют обновления)
- [x] ~~button.dart~~ - **ОБНОВИТЬ из cast**
- [ ] list_tile.dart - **ОБНОВИТЬ из cast**
- [ ] dialog.dart - **ДОБАВИТЬ из cast** (убрать mobx/router зависимости)
- [ ] page.dart - **ОБНОВИТЬ из mamagochi**
- [ ] toolbar.dart - **ОБНОВИТЬ из mamagochi**
- [ ] text_field.dart - **ДОБАВИТЬ из leitsy**
- [ ] icons.dart - **ОБНОВИТЬ из cast**

### 2. Важные компоненты форм
- [ ] checkbox.dart - из avanplan
- [ ] dropdown.dart - из avanplan (убрать RPersistable)
- [ ] field.dart - из mamagochi
- [ ] field_data.dart - из mamagochi
- [ ] text_field_inline.dart - из mamagochi
- [ ] datetime_picker.dart - из mamagochi

### 3. Дополнительные полезные
- [ ] scrollable_centered.dart - из avanplan
- [ ] alert_dialog.dart - из mamagochi
- [ ] snackbar_dialog.dart - из mamagochi
- [ ] avatar.dart - из leitsy/avanplan
- [ ] images.dart - любой
- [ ] html.dart - из leitsy/cast
- [ ] markdown.dart - из cast
- [ ] content_empty_pane.dart - из leitsy
- [ ] fade_in_image_or_gray_box.dart - из leitsy
- [ ] folding_section.dart - из leitsy
- [ ] image_svg_asset.dart - из cast

### 4. Проверить необходимость
- [ ] text.dart из mamagochi - что это?
- [ ] painters.dart из avanplan
- [ ] barrier.dart из avanplan
- [ ] select_dialog.dart из avanplan

## ⚠️ Замечания

1. **Mobx зависимости** в dialog, page - нужно убрать или сделать опциональными
2. **Router зависимости** в dialog - нужно убрать `globalContext`
3. **RPersistable** в dropdown - нужно сделать generic без доменной зависимости
4. **toolbar_controller** - mobx, не портировать

## 📊 Итого для версии 0.1.0

**Минимум для полноценного использования:**
- Обновить 7 критичных компонентов
- Добавить 6 компонентов форм
- Добавить 5 дополнительных полезных компонентов

**Итого: ~18 новых/обновленных компонента**

**Приоритет:**
1. Критичные компоненты (7)
2. Компоненты форм (6) 
3. Дополнительные (5)
4. Уникальные (позже)

