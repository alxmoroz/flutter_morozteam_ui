// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/constants.dart';

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
    final uiColors = colors;
    final cardColor = (color ?? uiColors.b3Color).resolve(context);
    final borderRadius = radius ?? constants.defBorderRadius;
    final shadowColor = uiColors.b1Color.resolve(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: margin ?? EdgeInsets.zero,
      elevation: elevation ?? constants.cardElevation,
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
