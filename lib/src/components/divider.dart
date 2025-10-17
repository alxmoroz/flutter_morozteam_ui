// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import '../theme/colors.dart';

/// Разделительная линия
class MTDivider extends StatelessWidget {
  const MTDivider({
    super.key,
    this.color,
    this.height,
    this.indent,
    this.endIndent,
    this.verticalIndent,
  });

  final Color? color;
  final double? height;
  final double? indent;
  final double? endIndent;
  final double? verticalIndent;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (color ?? colors.b1Color).resolve(context),
      margin: EdgeInsets.symmetric(vertical: verticalIndent ?? 0)
          .copyWith(left: indent ?? 0, right: endIndent ?? 0),
      height: height ?? 1,
    );
  }
}
