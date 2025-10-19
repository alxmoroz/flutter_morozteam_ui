// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/mt_theme.dart';
import '../theme/resolved_color.dart';
import 'circle.dart';

/// SVG icon from assets
class MTSvgIcon extends StatelessWidget {
  const MTSvgIcon(this.name, {this.color, this.size, super.key});

  final String name;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final iconSize = size ?? context.sizing.hPadding;
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      width: iconSize,
      height: iconSize,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}

/// Base class for icons
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
    final rColor = (color ?? context.colorScheme.mainColor).resolve(context);
    final iconSize = size ?? context.sizing.defaultIconSize;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (circled == true)
          MTCircle(
            color: solid == true ? rColor.withValues(alpha: 0.12) : Colors.transparent,
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

// Popular icons for quick access

/// Plus icon
class PlusIcon extends MTIcon {
  const PlusIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.add);
}

/// Close icon
class CloseIcon extends MTIcon {
  const CloseIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.xmark);
}

/// Person no avatar icon
class PersonNoAvatarIcon extends MTIcon {
  const PersonNoAvatarIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.person);
}

/// Back icon
class BackIcon extends MTIcon {
  const BackIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.back);
}

/// Down arrow icon
class ChevronDownIcon extends MTIcon {
  const ChevronDownIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.chevron_down);
}

/// Up arrow icon
class ChevronUpIcon extends MTIcon {
  const ChevronUpIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.chevron_up);
}

/// Right arrow icon
class ChevronRightIcon extends MTIcon {
  const ChevronRightIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.chevron_right);
}

/// Left arrow icon
class ChevronLeftIcon extends MTIcon {
  const ChevronLeftIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.chevron_left);
}

/// Menu icon
class MenuIcon extends MTIcon {
  const MenuIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.bars);
}

/// Search icon
class SearchIcon extends MTIcon {
  const SearchIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.search);
}

/// Settings icon
class SettingsIcon extends MTIcon {
  const SettingsIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.settings);
}

/// Edit icon
class EditIcon extends MTIcon {
  const EditIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.pencil);
}

/// Delete icon
class DeleteIcon extends MTIcon {
  const DeleteIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.delete);
}

/// Check icon
class CheckIcon extends MTIcon {
  const CheckIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.check_mark);
}

/// Info icon
class InfoIcon extends MTIcon {
  const InfoIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.info);
}

/// Warning icon
class WarningIcon extends MTIcon {
  const WarningIcon({
    super.key,
    super.color,
    super.size,
    super.circled,
  }) : super(CupertinoIcons.exclamationmark_triangle);
}
