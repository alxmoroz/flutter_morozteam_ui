// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../config/ui_theme.dart';
import '../theme/constants.dart';
import '../theme/resolved_color.dart';

/// Circular progress indicator
class MTCircularProgress extends StatelessWidget {
  const MTCircularProgress({
    super.key,
    this.size,
    this.color,
    this.strokeWidth = 4,
    this.unbound = false,
  });

  final double? size;
  final Color? color;
  final double strokeWidth;
  final bool unbound;

  @override
  Widget build(BuildContext context) {
    final ci = CircularProgressIndicator(
      color: (color ?? context.uiConfig.mainColor).resolve(context),
      strokeWidth: strokeWidth,
      strokeCap: StrokeCap.round,
    );

    return unbound
        ? ci
        : SizedBox(
            height: size ?? constants.P6,
            width: size ?? constants.P6,
            child: ci,
          );
  }
}
