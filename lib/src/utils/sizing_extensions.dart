// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../config/mt_theme.dart';

/// Extensions for common sizing patterns
extension MTSizingExtensions on BuildContext {
  /// Common padding patterns
  EdgeInsets get defPadding => EdgeInsets.all(sizing.p * 4); // 16px default
  EdgeInsets get smallPadding => EdgeInsets.all(sizing.p * 2); // 8px small

  /// Common margin patterns
  EdgeInsets get defMargin => EdgeInsets.all(sizing.p * 4); // 16px default

  /// Common spacing patterns
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: sizing.hPadding);
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: sizing.vPadding);

  /// Icon container with standard sizing
  Widget iconContainer(Widget child) {
    return Container(
      width: sizing.effectiveTappableIconSize,
      alignment: Alignment.center,
      child: child,
    );
  }

  /// Standard button constraints
  Size get buttonMinSize => Size(sizing.minButtonHeight, sizing.minButtonHeight);
  double get buttonRadius => sizing.defBorderRadius;
}
