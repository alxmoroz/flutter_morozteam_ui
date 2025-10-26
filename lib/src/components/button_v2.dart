// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/mt_theme.dart';
import '../utils/gesture.dart';
import '../utils/material_wrapper.dart';
import '../utils/sizing_extensions.dart';
import 'button_mixin.dart';

/// Simplified button component with full functionality
class MTButtonV2 extends StatelessWidget with GestureManaging, ButtonMixin {
  const MTButtonV2({
    super.key,
    required this.type,
    this.titleText,
    this.titleTextAlign,
    this.icon,
    this.leading,
    this.trailing,
    this.onTap,
    this.onHover,
    this.loading = false,
    this.enabled = true,
    this.color,
    this.titleColor,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderRadiusGeometry,
    this.minSize,
    this.borderSide,
    this.elevation,
    this.constrained = false,
    this.uf = true,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  final MTButtonType type;
  final String? titleText;
  final TextAlign? titleTextAlign;
  final Widget? icon;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Function(bool)? onHover;
  final bool loading;
  final bool enabled;
  final Color? color;
  final Color? titleColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final Size? minSize;
  final BorderSide? borderSide;
  final double? elevation;
  final bool constrained;
  final bool uf; // unfocus parameter
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final isEnabled = enabled && !loading && onTap != null;
    final effectiveMinSize = minSize ?? _getMinSize(context);
    final effectiveRadius = borderRadius ?? _getRadius(context);

    final backgroundColor = buttonColor(context, type, color, isEnabled);
    final foregroundColor = titleColor(context, type, titleColor, isEnabled);

    final style = createButtonStyle(
      context: context,
      type: type,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      minSize: effectiveMinSize,
      borderRadius: effectiveRadius,
      elevation: elevation,
      borderSide: borderSide,
      padding: padding,
    );

    return Container(
      margin: margin,
      child: _buildButton(context, style, isEnabled),
    );
  }

  Size _getMinSize(BuildContext context) {
    return minSize ?? 
        (type == MTButtonType.text
            ? Size(0, context.sizing.hPadding)
            : Size(context.sizing.minButtonHeight, context.sizing.minButtonHeight));
  }

  double _getRadius(BuildContext context) {
    return borderRadius ?? 
        (type == MTButtonType.card 
            ? context.sizing.defBorderRadius 
            : _getMinSize(context).height / 2);
  }

  Widget _buildButton(BuildContext context, ButtonStyle style, bool isEnabled) {
    final child = _buildContent(context);
    final onPressed = isEnabled ? () => tapAction(uf, onTap!, fbType: FeedbackType.light) : null;

    // Use different button types based on MTButtonType
    if ([MTButtonType.main, MTButtonType.secondary, MTButtonType.danger, MTButtonType.safe, MTButtonType.card].contains(type)) {
      return OutlinedButton(
        onPressed: onPressed,
        onHover: onHover,
        style: style,
        clipBehavior: Clip.hardEdge,
        child: child,
      );
    } else {
      // Text and icon buttons use InkWell
      return material(
        InkWell(
          onHover: onHover,
          onTap: onHover != null ? () {} : null,
          borderRadius: borderRadiusGeometry ?? BorderRadius.circular(_getRadius(context)),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          canRequestFocus: false,
          focusColor: Colors.transparent,
          child: CupertinoButton(
            onPressed: onPressed,
            minimumSize: _getMinSize(context),
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      );
    }
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

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          leading!, 
          SizedBox(width: context.sizing.vPadding)
        ],
        _buildMiddle(context),
        if (trailing != null) ...[
          SizedBox(width: context.sizing.smallSpacing), 
          trailing!
        ],
      ],
    );
  }

  Widget _buildMiddle(BuildContext context) {
    if (icon != null) {
      return icon!;
    }

    if (titleText != null) {
      return Flexible(
        child: Text(
          titleText!,
          textAlign: titleTextAlign,
          style: TextStyle(
            color: titleColor(context, type, titleColor, enabled && onTap != null),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
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
    TextAlign? titleTextAlign,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    Function(bool)? onHover,
    bool loading = false,
    bool enabled = true,
    Color? color,
    Color? titleColor,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? borderRadius,
    BorderRadiusGeometry? borderRadiusGeometry,
    Size? minSize,
    BorderSide? borderSide,
    double? elevation,
    bool constrained = true,
    bool uf = true,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  }) {
    return MTButtonV2(
      type: MTButtonType.main,
      titleText: titleText,
      titleTextAlign: titleTextAlign,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      onHover: onHover,
      loading: loading,
      enabled: enabled,
      color: color,
      titleColor: titleColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      borderRadiusGeometry: borderRadiusGeometry,
      minSize: minSize,
      borderSide: borderSide,
      elevation: elevation,
      constrained: constrained,
      uf: uf,
      mainAxisAlignment: mainAxisAlignment,
    );
  }

  static MTButtonV2 secondary({
    required String titleText,
    TextAlign? titleTextAlign,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    Function(bool)? onHover,
    bool loading = false,
    bool enabled = true,
    Color? color,
    Color? titleColor,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? borderRadius,
    BorderRadiusGeometry? borderRadiusGeometry,
    Size? minSize,
    BorderSide? borderSide,
    double? elevation,
    bool constrained = true,
    bool uf = true,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  }) {
    return MTButtonV2(
      type: MTButtonType.secondary,
      titleText: titleText,
      titleTextAlign: titleTextAlign,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      onHover: onHover,
      loading: loading,
      enabled: enabled,
      color: color,
      titleColor: titleColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      borderRadiusGeometry: borderRadiusGeometry,
      minSize: minSize,
      borderSide: borderSide,
      elevation: elevation,
      constrained: constrained,
      uf: uf,
      mainAxisAlignment: mainAxisAlignment,
    );
  }

  static MTButtonV2 text({
    required String titleText,
    TextAlign? titleTextAlign,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    Function(bool)? onHover,
    bool loading = false,
    bool enabled = true,
    Color? color,
    Color? titleColor,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? borderRadius,
    BorderRadiusGeometry? borderRadiusGeometry,
    Size? minSize,
    bool uf = true,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  }) {
    return MTButtonV2(
      type: MTButtonType.text,
      titleText: titleText,
      titleTextAlign: titleTextAlign,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      onHover: onHover,
      loading: loading,
      enabled: enabled,
      color: color,
      titleColor: titleColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      borderRadiusGeometry: borderRadiusGeometry,
      minSize: minSize,
      uf: uf,
      mainAxisAlignment: mainAxisAlignment,
    );
  }

  static MTButtonV2 icon({
    required Widget icon,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    Function(bool)? onHover,
    bool loading = false,
    bool enabled = true,
    Color? color,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? borderRadius,
    BorderRadiusGeometry? borderRadiusGeometry,
    Size? minSize,
    bool uf = true,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  }) {
    return MTButtonV2(
      type: MTButtonType.icon,
      icon: icon,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      onHover: onHover,
      loading: loading,
      enabled: enabled,
      color: color,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      borderRadiusGeometry: borderRadiusGeometry,
      minSize: minSize,
      uf: uf,
      mainAxisAlignment: mainAxisAlignment,
    );
  }

  static MTButtonV2 danger({
    required String titleText,
    TextAlign? titleTextAlign,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    Function(bool)? onHover,
    bool loading = false,
    bool enabled = true,
    Color? color,
    Color? titleColor,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? borderRadius,
    BorderRadiusGeometry? borderRadiusGeometry,
    Size? minSize,
    BorderSide? borderSide,
    double? elevation,
    bool constrained = true,
    bool uf = true,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  }) {
    return MTButtonV2(
      type: MTButtonType.danger,
      titleText: titleText,
      titleTextAlign: titleTextAlign,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      onHover: onHover,
      loading: loading,
      enabled: enabled,
      color: color,
      titleColor: titleColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      borderRadiusGeometry: borderRadiusGeometry,
      minSize: minSize,
      borderSide: borderSide,
      elevation: elevation,
      constrained: constrained,
      uf: uf,
      mainAxisAlignment: mainAxisAlignment,
    );
  }

  static MTButtonV2 safe({
    required String titleText,
    TextAlign? titleTextAlign,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    Function(bool)? onHover,
    bool loading = false,
    bool enabled = true,
    Color? color,
    Color? titleColor,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? borderRadius,
    BorderRadiusGeometry? borderRadiusGeometry,
    Size? minSize,
    BorderSide? borderSide,
    double? elevation,
    bool constrained = true,
    bool uf = true,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  }) {
    return MTButtonV2(
      type: MTButtonType.safe,
      titleText: titleText,
      titleTextAlign: titleTextAlign,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      onHover: onHover,
      loading: loading,
      enabled: enabled,
      color: color,
      titleColor: titleColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      borderRadiusGeometry: borderRadiusGeometry,
      minSize: minSize,
      borderSide: borderSide,
      elevation: elevation,
      constrained: constrained,
      uf: uf,
      mainAxisAlignment: mainAxisAlignment,
    );
  }
}