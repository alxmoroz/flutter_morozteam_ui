// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../config/ui_theme.dart';
import '../theme/constants.dart';
import '../theme/resolved_color.dart';
import '../theme/text.dart';
import '../utils/gesture.dart';
import '../utils/material_wrapper.dart';
import 'divider.dart';
import 'loader.dart';

/// Universal list item
class MTListTile extends StatelessWidget with GestureManaging {
  const MTListTile({
    super.key,
    this.leading,
    this.middle,
    this.subtitle,
    this.titleText = '',
    this.trailing,
    this.onTap,
    this.onHover,
    this.color = Colors.transparent,
    this.padding,
    this.verticalPadding,
    this.margin,
    this.topMargin = 0,
    this.dividerIndent,
    this.dividerEndIndent,
    this.topDivider = false,
    this.bottomDivider = false,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.uf = true,
    this.loading,
    this.minHeight,
    this.titleTextColor,
    this.splashColor,
    this.titleTextMaxLines,
    this.titleTextAlign,
    this.decoration,
    this.leadingSpacing,
  });

  final Widget? leading;
  final Widget? middle;
  final Widget? subtitle;
  final String titleText;
  final Widget? trailing;
  final Function()? onTap;
  final Function(bool)? onHover;
  final Color color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double topMargin;
  final double? verticalPadding;
  final double? dividerIndent;
  final double? dividerEndIndent;
  final bool topDivider;
  final bool bottomDivider;
  final CrossAxisAlignment crossAxisAlignment;
  final bool uf;
  final bool? loading;
  final double? minHeight;
  final Color? splashColor;
  final Color? titleTextColor;
  final int? titleTextMaxLines;
  final TextAlign? titleTextAlign;
  final BoxDecoration? decoration;
  final double? leadingSpacing;

  Widget get _divider => MTDivider(
        indent: dividerIndent ?? padding?.left ?? constants.defHP,
        endIndent: dividerEndIndent ?? padding?.right ?? constants.defHP,
      );

  EdgeInsets get _defaultPadding => EdgeInsets.symmetric(horizontal: constants.defHP, vertical: verticalPadding ?? constants.defVP);

  @override
  Widget build(BuildContext context) {
    final hoverColor = (splashColor ?? context.uiConfig.mainColor).resolve(context).withValues(alpha: 0.03);

    final hasMiddle = middle != null || titleText.isNotEmpty;
    final hasSubtitle = subtitle != null;
    final bgColor = color.resolve(context);

    return Stack(
      alignment: Alignment.center,
      fit: StackFit.passthrough,
      children: [
        Container(
          margin: margin ?? EdgeInsets.only(top: topMargin),
          decoration: decoration ?? BoxDecoration(color: bgColor),
          child: material(
            InkWell(
              onTap: onTap != null ? () => tapAction(uf, onTap!) : null,
              onHover: onHover,
              hoverColor: hoverColor,
              highlightColor: hoverColor,
              splashColor: (splashColor ?? context.uiConfig.mainColor).resolve(context).withValues(alpha: 0.06),
              canRequestFocus: false,
              focusColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (topDivider) _divider,
                  Padding(
                    padding: padding ?? _defaultPadding,
                    child: Row(
                      crossAxisAlignment: crossAxisAlignment,
                      children: [
                        SizedBox(height: minHeight ?? constants.defTappableIconSize),
                        if (leading != null) ...[leading!, if (hasMiddle || hasSubtitle) SizedBox(width: leadingSpacing ?? constants.P2)],
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (hasMiddle)
                                middle ??
                                    BaseText(
                                      titleText,
                                      color: titleTextColor,
                                      maxLines: titleTextMaxLines,
                                      align: titleTextAlign,
                                    ),
                              if (hasSubtitle) ...[
                                if (hasMiddle) SizedBox(height: constants.P),
                                subtitle!,
                              ],
                            ],
                          ),
                        ),
                        if (trailing != null) trailing!,
                      ],
                    ),
                  ),
                  if (bottomDivider) _divider,
                ],
              ),
            ),
          ),
        ),
        if (loading == true) const MTLoader(),
      ],
    );
  }
}

/// Section title
class MTSectionTitle extends MTListTile {
  MTSectionTitle(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    double? verticalPadding,
    double? topMargin,
    super.titleTextColor,
    super.titleTextAlign,
    super.titleTextMaxLines,
    double? leadingSpacing,
    double? minHeight,
    super.onTap,
  }) : super(
          titleText: text,
          verticalPadding: verticalPadding ?? constants.defVP / 2,
          topMargin: topMargin ?? constants.defVP / 2,
          leadingSpacing: leadingSpacing ?? constants.P,
          minHeight: minHeight ?? 0,
        );
}

/// Text list item
class MTListText extends MTListTile {
  MTListText(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    double? verticalPadding,
    double? topMargin,
    super.titleTextColor,
    super.titleTextAlign,
    super.titleTextMaxLines,
    double? leadingSpacing,
    double? minHeight,
    super.onTap,
  }) : super(
          titleText: text,
          verticalPadding: verticalPadding ?? 0,
          topMargin: topMargin ?? constants.defVP / 2,
          leadingSpacing: leadingSpacing ?? constants.P,
          minHeight: minHeight ?? 0,
        );

  MTListText.medium(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    double? verticalPadding,
    double? topMargin,
    Color? titleTextColor,
    TextAlign? titleTextAlign,
    int? titleTextMaxLines,
    double? leadingSpacing,
    double? minHeight,
    super.onTap,
  }) : super(
          middle: BaseText.medium(
            text,
            maxLines: titleTextMaxLines,
            align: titleTextAlign,
            color: titleTextColor,
          ),
          verticalPadding: verticalPadding ?? 0,
          topMargin: topMargin ?? constants.defVP / 2,
          leadingSpacing: leadingSpacing ?? constants.P,
          minHeight: minHeight ?? 0,
        );

  MTListText.h2(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    double? topMargin,
    double? verticalPadding,
    Color? titleTextColor,
    TextAlign? titleTextAlign,
    int? titleTextMaxLines,
    double? leadingSpacing,
    double? minHeight,
    super.onTap,
  }) : super(
          middle: H2(
            text,
            maxLines: titleTextMaxLines,
            align: titleTextAlign,
            color: titleTextColor,
          ),
          topMargin: topMargin ?? constants.defVP,
          verticalPadding: verticalPadding ?? 0,
          leadingSpacing: leadingSpacing ?? constants.P,
          minHeight: minHeight ?? 0,
        );

  MTListText.h3(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    double? topMargin,
    double? verticalPadding,
    Color? titleTextColor,
    TextAlign? titleTextAlign,
    int? titleTextMaxLines,
    double? leadingSpacing,
    double? minHeight,
    super.onTap,
  }) : super(
          middle: H3(
            text,
            maxLines: titleTextMaxLines,
            align: titleTextAlign,
            color: titleTextColor,
          ),
          topMargin: topMargin ?? constants.defVP,
          verticalPadding: verticalPadding ?? 0,
          leadingSpacing: leadingSpacing ?? constants.P,
          minHeight: minHeight ?? 0,
        );

  MTListText.small(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    double? topMargin,
    double? verticalPadding,
    Color? titleTextColor,
    TextAlign? titleTextAlign,
    int? titleTextMaxLines,
    double? leadingSpacing,
    double? minHeight,
    super.onTap,
  }) : super(
          middle: SmallText(
            text,
            maxLines: titleTextMaxLines,
            align: titleTextAlign,
            color: titleTextColor,
          ),
          topMargin: topMargin ?? constants.defVP / 2,
          verticalPadding: verticalPadding ?? 0,
          leadingSpacing: leadingSpacing ?? constants.P,
          minHeight: minHeight ?? 0,
        );

  MTListText.h1(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    double? topMargin,
    double? verticalPadding,
    Color? titleTextColor,
    TextAlign? titleTextAlign,
    int? titleTextMaxLines,
    double? leadingSpacing,
    double? minHeight,
    super.onTap,
  }) : super(
          middle: H1(
            text,
            maxLines: titleTextMaxLines,
            align: titleTextAlign,
            color: titleTextColor,
          ),
          topMargin: topMargin ?? constants.defVP,
          verticalPadding: verticalPadding ?? 0,
          leadingSpacing: leadingSpacing ?? constants.P,
          minHeight: minHeight ?? 0,
        );

  MTListText.h4(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    double? topMargin,
    double? verticalPadding,
    Color? titleTextColor,
    TextAlign? titleTextAlign,
    int? titleTextMaxLines,
    double? leadingSpacing,
    double? minHeight,
    super.onTap,
  }) : super(
          middle: H4(
            text,
            maxLines: titleTextMaxLines,
            align: titleTextAlign,
            color: titleTextColor,
          ),
          topMargin: topMargin ?? constants.defVP,
          verticalPadding: verticalPadding ?? 0,
          leadingSpacing: leadingSpacing ?? constants.P,
          minHeight: minHeight ?? 0,
        );

  MTListText.numbers(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    double? topMargin,
    double? verticalPadding,
    Color? titleTextColor,
    TextAlign? titleTextAlign,
    int? titleTextMaxLines,
    double? leadingSpacing,
    double? minHeight,
    super.onTap,
  }) : super(
          middle: NumbersText(
            text,
            maxLines: titleTextMaxLines,
            align: titleTextAlign,
            color: titleTextColor,
          ),
          topMargin: topMargin ?? constants.defVP / 2,
          verticalPadding: verticalPadding ?? 0,
          leadingSpacing: leadingSpacing ?? constants.P,
          minHeight: minHeight ?? 0,
        );

  MTListText.button(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    double? topMargin,
    double? verticalPadding,
    Color? titleTextColor,
    TextAlign? titleTextAlign,
    int? titleTextMaxLines,
    double? leadingSpacing,
    double? minHeight,
    super.onTap,
  }) : super(
          middle: ButtonText(
            text,
            maxLines: titleTextMaxLines,
            align: titleTextAlign,
            color: titleTextColor,
          ),
          topMargin: topMargin ?? constants.defVP / 2,
          verticalPadding: verticalPadding ?? 0,
          leadingSpacing: leadingSpacing ?? constants.P,
          minHeight: minHeight ?? 0,
        );

  MTListText.link(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    double? topMargin,
    double? verticalPadding,
    Color? titleTextColor,
    TextAlign? titleTextAlign,
    int? titleTextMaxLines,
    double? leadingSpacing,
    double? minHeight,
    super.onTap,
  }) : super(
          middle: LinkText(
            text,
            maxLines: titleTextMaxLines,
            align: titleTextAlign,
            color: titleTextColor,
          ),
          topMargin: topMargin ?? constants.defVP / 2,
          verticalPadding: verticalPadding ?? 0,
          leadingSpacing: leadingSpacing ?? constants.P,
          minHeight: minHeight ?? 0,
        );
}
