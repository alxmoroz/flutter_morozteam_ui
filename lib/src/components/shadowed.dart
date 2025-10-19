// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../config/ui_theme.dart';
import '../theme/resolved_color.dart';

/// Widget with shadows from top and/or bottom
class MTShadowed extends StatelessWidget {
  const MTShadowed({
    super.key,
    required this.child,
    this.shadowColor,
    this.topShadow = true,
    this.bottomShadow = false,
    this.topIndent,
    this.topShadowPadding,
    this.bottomIndent,
  });

  final Widget child;
  final Color? shadowColor;
  final bool topShadow;
  final bool bottomShadow;
  final double? topIndent;
  final double? topShadowPadding;
  final double? bottomIndent;

  Widget _shadow(BuildContext context, bool top) {
    final mqPadding = MediaQuery.paddingOf(context);
    final startColor = (shadowColor ?? context.colorScheme.b1Color).resolve(context).withValues(alpha: 0.5);
    final endColor = startColor.withValues(alpha: 0);

    return Positioned(
      left: 0,
      right: 0,
      top: top ? (topShadowPadding ?? mqPadding.top) : null,
      bottom: top ? null : mqPadding.bottom,
      height: 8,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: top ? Alignment.topCenter : Alignment.bottomCenter,
            end: top ? Alignment.bottomCenter : Alignment.topCenter,
            colors: [startColor, endColor],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final mqPadding = mq.padding;

    return Stack(
      children: [
        MediaQuery(
          data: mq.copyWith(
            padding: mqPadding.copyWith(
              top: mqPadding.top + (topIndent ?? 0),
              bottom: mqPadding.bottom + (bottomIndent ?? (bottomShadow ? context.sizing.hPadding : 0)),
            ),
          ),
          child: child,
        ),
        if (topShadow) _shadow(context, true),
        if (bottomShadow) _shadow(context, false),
      ],
    );
  }
}
