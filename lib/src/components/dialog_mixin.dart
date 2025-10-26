// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';

import 'package:flutter/material.dart';

import '../config/mt_theme.dart';
import '../theme/resolved_color.dart';
import '../utils/adaptive.dart';
import '../utils/material_wrapper.dart';

/// Mixin for common dialog functionality
mixin DialogMixin {
  /// Calculate dialog constraints based on screen size
  BoxConstraints dialogConstraints(BuildContext context, {double? maxWidth}) {
    final mq = MediaQuery.of(context);
    final big = isBigScreen(context);

    if (!big) {
      return const BoxConstraints(
        maxWidth: double.infinity,
        maxHeight: double.infinity,
      );
    }

    return BoxConstraints(
      maxWidth: min(
        mq.size.width - context.sizing.hPadding,
        maxWidth ?? context.breakpoints.sWidth,
      ),
      maxHeight: mq.size.height - max(mq.padding.vertical, mq.viewPadding.vertical) - context.sizing.hPadding,
    );
  }

  /// Create constrained dialog wrapper
  Widget constrainedDialog(
    BuildContext context,
    Widget child, {
    double? maxWidth,
  }) {
    return UnconstrainedBox(
      child: ConstrainedBox(
        constraints: dialogConstraints(context, maxWidth: maxWidth),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: material(child),
        ),
      ),
    );
  }

  /// Create dialog route for big screens
  Route<T> createDialogRoute<T>(
    BuildContext context,
    Widget child, {
    double? maxWidth,
  }) {
    if (!isBigScreen(context)) {
      return PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
    }

    return DialogRoute<T>(
      context: context,
      useSafeArea: false,
      barrierColor: context.colorScheme.defaultBarrierColor.resolve(context),
      builder: (context) => constrainedDialog(context, child, maxWidth: maxWidth),
    );
  }
}
