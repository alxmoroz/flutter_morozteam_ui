// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import '../config/mt_theme.dart';

/// Extensions for common sizing patterns
extension MTSizingExtensions on BuildContext {
  /// Common padding patterns
  EdgeInsets get defPadding => EdgeInsets.all(sizing.defPadding);
  EdgeInsets get smallPadding => EdgeInsets.all(sizing.smallPadding);
  EdgeInsets get largePadding => EdgeInsets.all(sizing.largePadding);
  
  /// Common margin patterns
  EdgeInsets get defMargin => EdgeInsets.all(sizing.defMargin);
  EdgeInsets get smallMargin => EdgeInsets.all(sizing.smallMargin);
  EdgeInsets get largeMargin => EdgeInsets.all(sizing.largeMargin);
  
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