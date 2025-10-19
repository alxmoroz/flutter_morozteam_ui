// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../config/mt_theme.dart';
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
      width: size ?? 12.0,
      height: size ?? 12.0,
      decoration: BoxDecoration(
        color: (color ?? context.colorScheme.f2Color).resolve(context),
        shape: BoxShape.circle,
        border: border ?? const Border(),
      ),
      child: child,
    );
  }
}
