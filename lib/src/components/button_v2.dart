// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import '../config/mt_theme.dart';
import '../utils/gesture.dart';
import '../utils/sizing_extensions.dart';
import 'button_mixin.dart';

/// Simplified button component
class MTButtonV2 extends StatelessWidget with GestureManaging, ButtonMixin {
  const MTButtonV2({
    super.key,
    required this.type,
    this.titleText,
    this.icon,
    this.onTap,
    this.loading = false,
    this.enabled = true,
    this.color,
    this.titleColor,
    this.padding,
    this.margin,
    this.borderRadius,
    this.minSize,
  });

  final MTButtonType type;
  final String? titleText;
  final Widget? icon;
  final VoidCallback? onTap;
  final bool loading;
  final bool enabled;
  final Color? color;
  final Color? titleColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final Size? minSize;

  @override
  Widget build(BuildContext context) {
    final isEnabled = enabled && !loading && onTap != null;
    final effectiveMinSize = minSize ?? context.buttonMinSize;
    final effectiveRadius = borderRadius ?? context.buttonRadius;

    final backgroundColor = buttonColor(context, type, color, isEnabled);
    final foregroundColor = titleColor(context, type, titleColor, isEnabled);

    final style = createButtonStyle(
      context: context,
      type: type,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      minSize: effectiveMinSize,
      borderRadius: effectiveRadius,
    );

    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: isEnabled ? () => tapAction(true, onTap!) : null,
        style: style,
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (loading) {
      return SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            titleColor(context, type, titleColor, true),
          ),
        ),
      );
    }

    if (icon != null) {
      return icon!;
    }

    if (titleText != null) {
      return Text(
        titleText!,
        style: TextStyle(
          color: titleColor(context, type, titleColor, enabled && onTap != null),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

/// Factory methods for common button types
extension MTButtonV2Factory on MTButtonV2 {
  static MTButtonV2 main({
    required String titleText,
    VoidCallback? onTap,
    bool loading = false,
    bool enabled = true,
    Color? color,
    Color? titleColor,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? borderRadius,
    Size? minSize,
  }) {
    return MTButtonV2(
      type: MTButtonType.main,
      titleText: titleText,
      onTap: onTap,
      loading: loading,
      enabled: enabled,
      color: color,
      titleColor: titleColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      minSize: minSize,
    );
  }

  static MTButtonV2 secondary({
    required String titleText,
    VoidCallback? onTap,
    bool loading = false,
    bool enabled = true,
    Color? color,
    Color? titleColor,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? borderRadius,
    Size? minSize,
  }) {
    return MTButtonV2(
      type: MTButtonType.secondary,
      titleText: titleText,
      onTap: onTap,
      loading: loading,
      enabled: enabled,
      color: color,
      titleColor: titleColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      minSize: minSize,
    );
  }

  static MTButtonV2 icon({
    required Widget icon,
    VoidCallback? onTap,
    bool loading = false,
    bool enabled = true,
    Color? color,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? borderRadius,
    Size? minSize,
  }) {
    return MTButtonV2(
      type: MTButtonType.icon,
      icon: icon,
      onTap: onTap,
      loading: loading,
      enabled: enabled,
      color: color,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      minSize: minSize,
    );
  }
}