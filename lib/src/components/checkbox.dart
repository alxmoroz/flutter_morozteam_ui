// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/text.dart';
import 'list_tile.dart';

/// Чекбокс в виде элемента списка
class MTCheckBoxTile extends StatelessWidget {
  const MTCheckBoxTile({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
    this.description,
    this.titleColor,
    this.color,
    this.leading,
    this.bottomDivider = false,
    this.dividerIndent,
    this.uf = true,
  });

  final String title;
  final bool value;
  final String? description;
  final Color? titleColor;
  final Color? color;
  final Widget? leading;
  final Function(bool?)? onChanged;
  final bool bottomDivider;
  final double? dividerIndent;
  final bool uf;

  bool get _disabled => onChanged == null;

  @override
  Widget build(BuildContext context) => MTListTile(
        leading: leading,
        middle: BaseText(
          title,
          color: _disabled ? colors.f3Color : titleColor,
          maxLines: 2,
        ),
        subtitle: description != null && description!.isNotEmpty
            ? SmallText(
                description!,
                color: _disabled ? colors.f3Color : null,
                maxLines: 1,
              )
            : null,
        trailing: Icon(
          value ? Icons.check_box : Icons.check_box_outline_blank,
          color: _disabled ? colors.f3Color.resolve(context) : colors.mainColor.resolve(context),
        ),
        color: color ?? colors.b3Color,
        bottomDivider: bottomDivider,
        dividerIndent: dividerIndent,
        uf: uf,
        onTap: onChanged != null ? () => onChanged!(!value) : null,
      );
}
