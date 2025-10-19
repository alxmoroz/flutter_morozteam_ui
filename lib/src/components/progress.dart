// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../config/ui_theme.dart';
import '../theme/resolved_color.dart';

/// Progress mark
class MTProgressMark {
  const MTProgressMark(
    this.child, {
    this.size,
    this.color,
  });

  final Widget child;
  final Color? color;
  final Size? size;
}

/// Progress bar
class MTProgress extends StatelessWidget {
  const MTProgress(
    this.value, {
    super.key,
    this.color,
    this.mark,
    this.borderWidth,
  });

  final double value;
  final Color? color;
  final MTProgressMark? mark;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final w = max(value * size.maxWidth, size.maxHeight);

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              width: w,
              child: Container(
                decoration: BoxDecoration(
                  color: (color ?? context.colorScheme.mainColor).resolve(context),
                  borderRadius: BorderRadius.circular(size.maxHeight / 2),
                ),
              ),
            ),
            if (mark != null)
              Positioned(
                left: w - (mark!.size?.width ?? 0) / 2,
                top: (mark!.size?.height ?? 0) - (borderWidth ?? 0),
                child: mark!.child,
              ),
          ],
        );
      },
    );
  }
}
