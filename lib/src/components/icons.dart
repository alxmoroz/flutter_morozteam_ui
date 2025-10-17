// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/constants.dart';
import 'circle.dart';

/// Базовый класс для иконок
class MTIcon extends StatelessWidget {
  const MTIcon(
    this.iconData, {
    super.key,
    this.color,
    this.size,
    this.solid = false,
    this.circled = false,
  });

  final IconData? iconData;
  final Color? color;
  final double? size;
  final bool solid;
  final bool circled;

  @override
  Widget build(BuildContext context) {
    final rColor = (color ?? colors.mainColor).resolve(context);
    final iconSize = size ?? constants.P4;
    
    return Stack(
      alignment: Alignment.center,
      children: [
        if (circled == true)
          MTCircle(
            color: solid == true 
                ? rColor.withValues(alpha: 0.12) 
                : Colors.transparent,
            size: iconSize,
            border: Border.all(
              color: rColor,
              width: min(3, max(1, iconSize / 18)),
            ),
          ),
        if (iconData != null)
          Icon(
            iconData,
            color: rColor,
            size: iconSize - (circled == true ? (sqrt(iconSize * iconSize / 8)) : 0),
          ),
      ],
    );
  }
}

// Популярные иконки для быстрого доступа

/// Иконка "Плюс"
class PlusIcon extends MTIcon {
  const PlusIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.add);
}

/// Иконка "Закрыть"
class CloseIcon extends MTIcon {
  const CloseIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.xmark);
}

/// Иконка "Назад"
class BackIcon extends MTIcon {
  const BackIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.back);
}

/// Иконка "Стрелка вниз"
class ChevronDownIcon extends MTIcon {
  const ChevronDownIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.chevron_down);
}

/// Иконка "Стрелка вверх"
class ChevronUpIcon extends MTIcon {
  const ChevronUpIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.chevron_up);
}

/// Иконка "Стрелка вправо"
class ChevronRightIcon extends MTIcon {
  const ChevronRightIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.chevron_right);
}

/// Иконка "Стрелка влево"
class ChevronLeftIcon extends MTIcon {
  const ChevronLeftIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.chevron_left);
}

/// Иконка "Меню"
class MenuIcon extends MTIcon {
  const MenuIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.bars);
}

/// Иконка "Поиск"
class SearchIcon extends MTIcon {
  const SearchIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.search);
}

/// Иконка "Настройки"
class SettingsIcon extends MTIcon {
  const SettingsIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.settings);
}

/// Иконка "Редактировать"
class EditIcon extends MTIcon {
  const EditIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.pencil);
}

/// Иконка "Удалить"
class DeleteIcon extends MTIcon {
  const DeleteIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.delete);
}

/// Иконка "Галочка"
class CheckIcon extends MTIcon {
  const CheckIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.check_mark);
}

/// Иконка "Информация"
class InfoIcon extends MTIcon {
  const InfoIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.info);
}

/// Иконка "Предупреждение"
class WarningIcon extends MTIcon {
  const WarningIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.exclamationmark_triangle);
}
