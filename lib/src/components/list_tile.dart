// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../config/mt_theme.dart';
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

  Widget _divider(BuildContext context) => MTDivider(
        indent: dividerIndent ?? padding?.left ?? context.sizing.hPadding,
        endIndent: dividerEndIndent ?? padding?.right ?? context.sizing.hPadding,
      );

  EdgeInsets _defaultPadding(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: context.sizing.hPadding, vertical: verticalPadding ?? context.sizing.vPadding);

  @override
  Widget build(BuildContext context) {
    final hoverColor = (splashColor ?? context.colorScheme.mainColor).resolve(context).withValues(alpha: 0.03);

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
              splashColor: (splashColor ?? context.colorScheme.mainColor).resolve(context).withValues(alpha: 0.06),
              canRequestFocus: false,
              focusColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (topDivider) _divider(context),
                  Padding(
                    padding: padding ?? _defaultPadding(context),
                    child: Row(
                      crossAxisAlignment: crossAxisAlignment,
                      children: [
                        SizedBox(height: minHeight ?? context.sizing.effectiveTappableIconSize),
                        if (leading != null) ...[leading!, if (hasMiddle || hasSubtitle) SizedBox(width: leadingSpacing ?? context.sizing.vPadding)],
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (hasMiddle)
                                middle ??
                                    MText(
                                      titleText,
                                      color: titleTextColor,
                                      maxLines: titleTextMaxLines,
                                      align: titleTextAlign,
                                    ),
                              if (hasSubtitle) ...[
                                if (hasMiddle) SizedBox(height: context.sizing.vPadding / 2),
                                subtitle!,
                              ],
                            ],
                          ),
                        ),
                        if (trailing != null) trailing!,
                      ],
                    ),
                  ),
                  if (bottomDivider) _divider(context),
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
  const MTSectionTitle(
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
          verticalPadding: verticalPadding ?? 6.0, // DEF_VP / 2
          topMargin: topMargin ?? 6.0, // DEF_VP / 2
          leadingSpacing: leadingSpacing ?? 8.0, // P
          minHeight: minHeight ?? 0,
        );
}

/// Text list item
class MTListText extends MTListTile {
  const MTListText(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    super.verticalPadding = 0,
    super.topMargin = 6.0,
    super.titleTextColor,
    super.titleTextAlign,
    super.titleTextMaxLines,
    super.leadingSpacing = 6.0,
    super.minHeight = 0,
    super.onTap,
  }) : super(titleText: text);

  MTListText.medium(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    super.verticalPadding = 0,
    super.topMargin = 6.0,
    super.titleTextColor,
    super.titleTextAlign,
    super.titleTextMaxLines,
    super.leadingSpacing = 6.0,
    super.minHeight = 0,
    super.onTap,
  }) : super(middle: MText.medium(text, maxLines: titleTextMaxLines, align: titleTextAlign, color: titleTextColor));

  MTListText.h2(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    super.topMargin = 12.0,
    super.verticalPadding = 0,
    super.titleTextColor,
    super.titleTextAlign,
    super.titleTextMaxLines,
    super.leadingSpacing = 6.0,
    super.minHeight = 0,
    super.onTap,
  }) : super(middle: MText.h2(text, maxLines: titleTextMaxLines ?? 1000, align: titleTextAlign ?? TextAlign.start, color: titleTextColor));

  MTListText.h3(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    super.topMargin = 12.0,
    super.verticalPadding = 0,
    super.titleTextColor,
    super.titleTextAlign,
    super.titleTextMaxLines,
    super.leadingSpacing = 6.0,
    super.minHeight = 0,
    super.onTap,
  }) : super(middle: MText.h3(text, maxLines: titleTextMaxLines ?? 1000, align: titleTextAlign ?? TextAlign.start, color: titleTextColor));

  MTListText.small(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    super.topMargin = 6.0,
    super.verticalPadding = 0,
    super.titleTextColor,
    super.titleTextAlign,
    super.titleTextMaxLines,
    super.leadingSpacing = 6.0,
    super.minHeight = 0,
    super.onTap,
  }) : super(middle: MText.small(text, maxLines: titleTextMaxLines ?? 1000, align: titleTextAlign ?? TextAlign.start, color: titleTextColor));

  MTListText.h1(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    super.topMargin = 12.0,
    super.verticalPadding = 0,
    super.titleTextColor,
    super.titleTextAlign,
    super.titleTextMaxLines,
    super.leadingSpacing = 6.0,
    super.minHeight = 0,
    super.onTap,
  }) : super(middle: MText.h1(text, maxLines: titleTextMaxLines ?? 1000, align: titleTextAlign ?? TextAlign.start, color: titleTextColor));

  MTListText.h4(
    String text, {
    super.key,
    super.leading,
    super.trailing,
    super.topMargin = 12.0,
    super.verticalPadding = 0,
    super.titleTextColor,
    super.titleTextAlign,
    super.titleTextMaxLines,
    super.leadingSpacing = 6.0,
    super.minHeight = 0,
    super.onTap,
  }) : super(middle: MText.h4(text, maxLines: titleTextMaxLines ?? 1000, align: titleTextAlign ?? TextAlign.start, color: titleTextColor));

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
          middle: MText.numbers(
            text,
            maxLines: titleTextMaxLines ?? 1000,
            align: titleTextAlign ?? TextAlign.start,
            color: titleTextColor,
          ),
          topMargin: topMargin ?? 6.0, // DEF_VP / 2
          verticalPadding: verticalPadding ?? 0,
          leadingSpacing: leadingSpacing ?? 8.0, // P
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
          middle: MText.button(
            text,
            maxLines: titleTextMaxLines ?? 1000,
            align: titleTextAlign ?? TextAlign.start,
            color: titleTextColor,
          ),
          topMargin: topMargin ?? 6.0, // DEF_VP / 2
          verticalPadding: verticalPadding ?? 0,
          leadingSpacing: leadingSpacing ?? 8.0, // P
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
          middle: MText.link(
            text,
            maxLines: titleTextMaxLines,
            align: titleTextAlign,
            color: titleTextColor,
          ),
          topMargin: topMargin ?? 6.0, // DEF_VP / 2
          verticalPadding: verticalPadding ?? 0,
          leadingSpacing: leadingSpacing ?? 8.0, // P
          minHeight: minHeight ?? 0,
        );
}
