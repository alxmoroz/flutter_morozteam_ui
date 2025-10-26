// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import '../config/mt_theme.dart';
import '../theme/resolved_color.dart';
import '../utils/sizing_extensions.dart';

/// Mixin for common button functionality
mixin ButtonMixin {
  /// Calculate button color based on type and state
  Color buttonColor(
    BuildContext context,
    MTButtonType type,
    Color? customColor,
    bool enabled,
  ) {
    Color baseColor = customColor ?? _getDefaultColor(context, type);
    return enabled ? baseColor : baseColor.withValues(alpha: 0.42);
  }

  /// Calculate title color based on type and state
  Color titleColor(
    BuildContext context,
    MTButtonType type,
    Color? customColor,
    bool enabled,
  ) {
    Color baseColor = customColor ?? _getDefaultTitleColor(context, type);
    return enabled ? baseColor : baseColor.withValues(alpha: 0.7);
  }

  /// Get default color for button type
  Color _getDefaultColor(BuildContext context, MTButtonType type) {
    switch (type) {
      case MTButtonType.main:
        return context.colorScheme.mainColor.resolve(context);
      case MTButtonType.danger:
        return context.colorScheme.dangerColor.resolve(context);
      case MTButtonType.safe:
        return context.colorScheme.safeColor.resolve(context);
      case MTButtonType.text:
        return Colors.transparent;
      default:
        return context.colorScheme.b3Color.resolve(context);
    }
  }

  /// Get default title color for button type
  Color _getDefaultTitleColor(BuildContext context, MTButtonType type) {
    switch (type) {
      case MTButtonType.main:
        return context.colorScheme.mainBtnTitleColor.resolve(context);
      case MTButtonType.danger:
      case MTButtonType.safe:
        return context.colorScheme.b3Color.resolve(context);
      default:
        return context.colorScheme.mainColor.resolve(context);
    }
  }

  /// Create button style
  ButtonStyle createButtonStyle({
    required BuildContext context,
    required MTButtonType type,
    required Color backgroundColor,
    required Color foregroundColor,
    required Size minSize,
    required double borderRadius,
    double? elevation,
    BorderSide? borderSide,
    EdgeInsets? padding,
  }) {
    return ElevatedButton.styleFrom(
      padding: padding ?? EdgeInsets.zero,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      disabledForegroundColor: backgroundColor,
      disabledBackgroundColor: backgroundColor,
      minimumSize: minSize,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      side: borderSide ?? (type == MTButtonType.secondary 
          ? BorderSide(color: foregroundColor, width: 1) 
          : BorderSide.none),
      splashFactory: NoSplash.splashFactory,
      visualDensity: VisualDensity.standard,
      shadowColor: context.colorScheme.b1Color.resolve(context),
      elevation: elevation ?? context.sizing.buttonElevation,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}