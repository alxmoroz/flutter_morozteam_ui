// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../config/mt_theme.dart';
import '../theme/text.dart';
import 'field_data.dart';
import 'list_tile.dart';

class MTField extends StatelessWidget {
  const MTField(
    this.fd, {
    super.key,
    this.leading,
    this.value,
    this.trailing,
    this.bottomDivider = false,
    this.dividerIndent,
    this.dividerEndIndent,
    this.margin,
    this.padding,
    this.color,
    this.minHeight,
    this.crossAxisAlignment,
    this.loading = false,
    this.onTap,
    this.onHover,
    this.compact = false,
    this.showLabel = false,
  });

  final MTFieldData fd;
  final Widget? leading;
  final Widget? value;
  final Widget? trailing;
  final Function()? onTap;
  final Function(bool)? onHover;

  final bool bottomDivider;
  final double? dividerIndent;
  final double? dividerEndIndent;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final double? minHeight;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool loading;
  final bool compact;
  final bool showLabel;

  bool get _hasValue => value != null;

  @override
  Widget build(BuildContext context) {
    return MTListTile(
      leading: leading != null
          ? Container(width: context.sizing.effectiveTappableIconSize, alignment: Alignment.center, child: leading)
          : null,
      middle: compact
          ? null
          : _hasValue && showLabel && fd.label.isNotEmpty
              ? SmallText(fd.label, color: context.colorScheme.f3Color, maxLines: 1)
              : null,
      subtitle: compact
          ? null
          : _hasValue
              ? value
              : fd.placeholder.isNotEmpty
                  ? BaseText.f3(fd.placeholder, maxLines: 1)
                  : null,
      trailing: trailing,
      bottomDivider: bottomDivider,
      dividerIndent: dividerIndent,
      dividerEndIndent: dividerEndIndent,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      margin: margin,
      padding: padding,
      color: color ?? context.colorScheme.b3Color,
      minHeight: minHeight,
      loading: fd.loading || loading,
      onTap: onTap,
      onHover: onHover,
    );
  }
}
