// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../config/ui_theme.dart';
import '../theme/constants.dart';
import '../theme/resolved_color.dart';

/// Circular element
class MTCircle extends StatelessWidget {
  const MTCircle({
    super.key,
    this.color,
    this.size,
    this.border,
    this.child,
  });

  final Color? color;
  final double? size;
  final Border? border;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? constants.P2,
      height: size ?? constants.P2,
      decoration: BoxDecoration(
        color: (color ?? context.uiConfig.f2Color).resolve(context),
        shape: BoxShape.circle,
        border: border ?? const Border(),
      ),
      child: child,
    );
  }
}
