// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/constants.dart';

/// Круговой индикатор прогресса
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
      color: (color ?? colors.mainColor).resolve(context),
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
