// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../config/ui_theme.dart';
import '../theme/resolved_color.dart';

/// Card with shadow and rounded corners
class MTCard extends StatelessWidget {
  const MTCard({
    super.key,
    required this.child,
    this.margin,
    this.elevation,
    this.radius,
    this.padding,
    this.borderSide,
    this.color,
  });

  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? elevation;
  final double? radius;
  final BorderSide? borderSide;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final cardColor = (color ?? context.colorScheme.b3Color).resolve(context);
    final borderRadius = radius ?? context.sizing.defaultBorderRadius;
    final shadowColor = context.colorScheme.b1Color.resolve(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: margin ?? EdgeInsets.zero,
      elevation: elevation ?? context.sizing.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: borderSide ?? BorderSide.none,
      ),
      surfaceTintColor: cardColor,
      color: cardColor,
      shadowColor: shadowColor,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
