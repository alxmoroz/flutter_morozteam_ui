// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/mt_theme.dart';
import '../theme/resolved_color.dart';
import '../theme/text.dart';
import '../utils/adaptive.dart';
import '../utils/gesture.dart';
import '../utils/material_wrapper.dart';

/// Button types
enum MTButtonType {
  text,
  main,
  secondary,
  danger,
  safe,
  icon,
  card;

  bool get isCustom => [MTButtonType.card].contains(this);
  bool get isMain => this == main;
  bool get isSecondary => this == secondary;
  bool get isDanger => this == danger;
  bool get isText => this == text;
  bool get isCard => this == card;
  bool get isSafe => this == safe;
}

/// Universal button with various styles
///
/// Provides multiple button variants for different actions and contexts.
/// Supports loading states, custom colors, icons, and responsive behavior.
///
/// ## Example
///
/// ```dart
/// MTButton.main(
///   titleText: 'Submit',
///   onTap: () => print('Submitted'),
/// )
///
/// MTButton.secondary(
///   titleText: 'Cancel',
///   onTap: () => Navigator.pop(context),
/// )
///
/// MTButton.icon(
///   Icon(Icons.add),
///   onTap: () => showDialog(...),
/// )
/// ```
///
/// See also:
/// * [MTButtonType] for available button styles
/// * [buildMTTheme] to customize button appearance
class MTButton extends StatelessWidget with GestureManaging {
  const MTButton({
    super.key,
    this.titleText,
    this.titleTextAlign,
    this.onTap,
    this.onHover,
    this.leading,
    this.middle,
    this.trailing,
    this.color,
    this.titleColor,
    this.padding,
    this.margin,
    this.constrained = false,
    this.elevation,
    this.loading,
    this.type = MTButtonType.text,
    this.uf = true,
    this.minSize,
    this.borderSide,
    this.borderRadius,
    this.borderRadiusGeometry,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  /// Primary button
  MTButton.main({
    super.key,
    this.titleText,
    this.titleTextAlign,
    this.onTap,
    this.leading,
    this.middle,
    this.trailing,
    this.constrained = true,
    this.padding,
    this.margin,
    this.loading,
    this.minSize,
    this.borderRadius,
    this.borderRadiusGeometry,
    this.mainAxisAlignment = MainAxisAlignment.center,
  })  : type = MTButtonType.main,
        titleColor = null,
        color = null,
        elevation = null,
        borderSide = BorderSide.none,
        onHover = null,
        uf = true;

  /// Secondary button
  MTButton.secondary({
    super.key,
    this.titleText,
    this.titleTextAlign,
    this.onTap,
    this.leading,
    this.middle,
    this.trailing,
    this.constrained = true,
    this.padding,
    this.margin,
    this.loading,
    this.minSize,
    this.borderRadius,
    this.borderRadiusGeometry,
    this.mainAxisAlignment = MainAxisAlignment.center,
  })  : type = MTButtonType.secondary,
        titleColor = null,
        color = null,
        elevation = null,
        borderSide = null,
        onHover = null,
        uf = true;

  /// Danger button
  MTButton.danger({
    super.key,
    this.titleText,
    this.titleTextAlign,
    this.onTap,
    this.leading,
    this.middle,
    this.trailing,
    this.constrained = true,
    this.padding,
    this.margin,
    this.loading,
    this.minSize,
    this.borderRadius,
    this.borderRadiusGeometry,
    this.mainAxisAlignment = MainAxisAlignment.center,
  })  : type = MTButtonType.danger,
        titleColor = null,
        color = null,
        elevation = null,
        borderSide = BorderSide.none,
        onHover = null,
        uf = true;

  /// Safe button
  MTButton.safe({
    super.key,
    this.titleText,
    this.titleTextAlign,
    this.onTap,
    this.leading,
    this.middle,
    this.trailing,
    this.constrained = true,
    this.padding,
    this.margin,
    this.loading,
    this.minSize,
    this.borderRadius,
    this.borderRadiusGeometry,
    this.mainAxisAlignment = MainAxisAlignment.center,
  })  : type = MTButtonType.safe,
        titleColor = null,
        color = null,
        elevation = null,
        borderSide = BorderSide.none,
        onHover = null,
        uf = true;

  /// Icon button
  const MTButton.icon(
    Widget icon, {
    super.key,
    this.margin,
    this.padding,
    this.color,
    this.elevation,
    this.loading,
    this.onTap,
    this.onHover,
    this.uf = true,
    this.minSize,
    this.borderRadius,
    this.borderRadiusGeometry,
    this.mainAxisAlignment = MainAxisAlignment.center,
  })  : type = MTButtonType.icon,
        middle = icon,
        titleText = null,
        titleTextAlign = null,
        leading = null,
        trailing = null,
        titleColor = null,
        constrained = false,
        borderSide = null;

  final MTButtonType type;
  final TextAlign? titleTextAlign;
  final String? titleText;
  final Function()? onTap;
  final Function(bool)? onHover;
  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;
  final Color? color;
  final Color? titleColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool constrained;
  final double? elevation;
  final double? borderRadius;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final BorderSide? borderSide;
  final MainAxisAlignment mainAxisAlignment;
  final bool? loading;
  final bool uf;
  final Size? minSize;

  bool get _enabled => loading != true && onTap != null;

  Color _titleColor(BuildContext context) {
    Color tc = (titleColor ??
            (type.isMain
                ? context.colorScheme.mainBtnTitleColor
                : [MTButtonType.danger, MTButtonType.safe].contains(type)
                    ? context.colorScheme.b3Color
                    : context.colorScheme.mainColor.resolve(context)))
        .resolve(context);

    return _enabled || type.isCustom ? tc : tc.withValues(alpha: 0.7);
  }

  Size _minSize(BuildContext context) =>
      minSize ??
      (type.isText
          ? Size(0, context.sizing.hPadding)
          : Size(context.sizing.minButtonHeight, context.sizing.minButtonHeight));
  double _radius(BuildContext context) =>
      borderRadius ?? (type.isCard ? context.sizing.defBorderRadius : _minSize(context).height / 2);

  ButtonStyle _style(BuildContext context) {
    Color btnColor = (color ??
            (type.isMain
                ? context.colorScheme.mainColor
                : type.isDanger
                    ? context.colorScheme.dangerColor
                    : type.isSafe
                        ? context.colorScheme.safeColor
                        : type.isText
                            ? Colors.transparent
                            : context.colorScheme.b3Color))
        .resolve(context);
    if (!(_enabled || type.isCustom)) btnColor = btnColor.withValues(alpha: 0.42);

    Color titleColor = _titleColor(context);

    return ElevatedButton.styleFrom(
      padding: padding ?? EdgeInsets.zero,
      foregroundColor: titleColor,
      backgroundColor: btnColor,
      disabledForegroundColor: btnColor,
      disabledBackgroundColor: btnColor,
      minimumSize: _minSize(context),
      shape: RoundedRectangleBorder(borderRadius: borderRadiusGeometry ?? BorderRadius.circular(_radius(context))),
      side: borderSide ?? (type.isSecondary ? BorderSide(color: titleColor, width: 1) : BorderSide.none),
      splashFactory: NoSplash.splashFactory,
      visualDensity: VisualDensity.standard,
      shadowColor: context.colorScheme.b1Color.resolve(context),
      elevation: elevation ?? context.sizing.buttonElevation,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Function()? get _onPressed =>
      _enabled && onTap != null ? () => tapAction(uf, onTap!, fbType: FeedbackType.light) : null;

  Widget _button(BuildContext context) {
    final child = Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[leading!, SizedBox(width: context.sizing.vPadding)],
        middle ??
            (titleText != null
                ? Flexible(
                    child: MText.medium(
                      titleText!,
                      align: titleTextAlign,
                      color: _titleColor(context),
                      maxLines: 1,
                    ),
                  )
                : const SizedBox()),
        if (trailing != null) ...[SizedBox(width: context.sizing.smallSpacing), trailing!],
      ],
    );

    return [
      MTButtonType.main,
      MTButtonType.secondary,
      MTButtonType.danger,
      MTButtonType.safe,
      MTButtonType.card,
    ].contains(type)
        ? OutlinedButton(
            onPressed: _onPressed,
            onHover: onHover,
            style: _style(context),
            clipBehavior: Clip.hardEdge,
            child: child,
          )
        : material(
            InkWell(
              onHover: onHover,
              onTap: onHover != null ? () {} : null,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              canRequestFocus: false,
              focusColor: Colors.transparent,
              child: CupertinoButton(
                onPressed: _onPressed,
                minimumSize: _minSize(context),
                padding: padding ?? EdgeInsets.zero,
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
                child: child,
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final btn = Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          _button(context),
          if (loading == true)
            SizedBox(
              width: context.sizing.loadingIconSize,
              height: context.sizing.loadingIconSize,
              child: const CupertinoActivityIndicator(),
            ),
        ],
      ),
    );
    return type == MTButtonType.icon || !constrained ? btn : MTAdaptive.xxs(child: btn);
  }
}
