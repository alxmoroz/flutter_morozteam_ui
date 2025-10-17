// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text.dart';
import '../theme/constants.dart';
import '../utils/adaptive.dart';
import '../utils/gesture.dart';
import '../utils/material_wrapper.dart';

/// Типы кнопок
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

/// Универсальная кнопка с различными стилями
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

  /// Основная кнопка
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

  /// Вторичная кнопка
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

  /// Опасная кнопка
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

  /// Безопасная кнопка
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

  /// Иконка кнопка
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
    final uiColors = colors;
    Color tc = (titleColor ??
            (type.isMain
                ? uiColors.mainBtnTitleColor
                : [MTButtonType.danger, MTButtonType.safe].contains(type)
                    ? uiColors.b3Color
                    : uiColors.mainColor))
        .resolve(context);

    return _enabled || type.isCustom ? tc : tc.withValues(alpha: 0.7);
  }

  Size get _minSize => minSize ?? Size(constants.minBtnHeight, constants.minBtnHeight);
  double get _radius => borderRadius ?? (type.isCard ? constants.defBorderRadius : _minSize.height / 2);

  ButtonStyle _style(BuildContext context) {
    final uiColors = colors;
    Color btnColor = (color ??
            (type.isMain
                ? uiColors.mainColor
                : type.isDanger
                    ? uiColors.dangerColor
                    : type.isSafe
                        ? uiColors.safeColor
                        : uiColors.b3Color))
        .resolve(context);
    if (!(_enabled || type.isCustom)) btnColor = btnColor.withValues(alpha: 0.42);

    Color titleColor = _titleColor(context);

    return ElevatedButton.styleFrom(
      padding: padding ?? EdgeInsets.zero,
      foregroundColor: titleColor,
      backgroundColor: btnColor,
      disabledForegroundColor: btnColor,
      disabledBackgroundColor: btnColor,
      minimumSize: _minSize,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadiusGeometry ?? BorderRadius.circular(_radius)
      ),
      side: borderSide ?? (type.isSecondary ? BorderSide(color: titleColor, width: 1) : BorderSide.none),
      splashFactory: NoSplash.splashFactory,
      visualDensity: VisualDensity.standard,
      shadowColor: uiColors.b1Color.resolve(context),
      elevation: elevation ?? constants.buttonElevation,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Function()? get _onPressed => _enabled && onTap != null 
      ? () => tapAction(uf, onTap!, fbType: FeedbackType.light) 
      : null;

  Widget _button(BuildContext context) {
    final child = Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[leading!, const SizedBox(width: 12)], // P2
        middle ??
            (titleText != null
                ? Flexible(
                    child: BaseText.medium(
                      titleText!,
                      align: titleTextAlign,
                      color: _titleColor(context),
                      maxLines: 1,
                    ))
                : const SizedBox()),
        if (trailing != null) ...[const SizedBox(width: 6), trailing!], // P
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
                minimumSize: Size.zero,
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
    // TODO: Добавить MTListTile когда будет портирован
    final btn = type == MTButtonType.text
        ? Container(
            padding: padding ?? const EdgeInsets.symmetric(vertical: 6), // P
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              children: [
                if (leading != null) ...[leading!, const SizedBox(width: 12)],
                middle ??
                    (titleText != null
                        ? BaseText(
                            titleText!,
                            color: _titleColor(context),
                            maxLines: 1,
                            align: titleTextAlign ?? TextAlign.center,
                          )
                        : const SizedBox()),
                if (trailing != null) ...[const SizedBox(width: 6), trailing!],
              ],
            ),
          )
        : Padding(
            padding: margin ?? EdgeInsets.zero,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.passthrough,
              children: [
                _button(context),
                if (loading == true) 
                  Container(
                    width: 20,
                    height: 20,
                    child: const CupertinoActivityIndicator(),
                  ),
              ],
            ),
          );
    
    return type == MTButtonType.icon || !constrained ? btn : MTAdaptive.xxs(child: btn);
  }
}
