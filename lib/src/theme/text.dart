// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

import '../config/mt_text_variant.dart';
import '../config/mt_theme.dart';
import 'resolved_color.dart';

/// Line height coefficients for different maxLines
const Map<int, double> kLineHeightMap = {
  1: 1.0,
  2: 1.1,
  3: 1.15,
  4: 1.2,
};
const double kDefaultLineHeight = 1.3;

/// Universal text component with multiple variants
///
/// Provides consistent text styling across the UI kit with support for
/// different text variants, colors, and typography customization.
///
/// ## Example
///
/// ```dart
/// MText('Regular text')
/// MText.h1('Heading 1')
/// MText.f2('Secondary text')
/// MText.medium('Medium weight text')
/// ```
///
/// See also:
/// * [MTTextVariant] for available text variants
/// * [MTTypography] for typography customization
class MText extends StatelessWidget {
  const MText._(
    this.text, {
    super.key,
    this.variant = MTTextVariant.body,
    this.color,
    this.weight,
    this.maxLines,
    this.align,
    this.padding,
    this.height,
    this.decoration,
    this.sizeScale,
  });

  /// Regular text
  const factory MText(
    String text, {
    Key? key,
    double? sizeScale,
    Color? color,
    FontWeight? weight,
    int? maxLines,
    TextAlign? align,
    EdgeInsets? padding,
    double? height,
    TextDecoration? decoration,
  }) = MText._;

  /// Heading 1
  factory MText.h1(
    String text, {
    Key? key,
    Color? color,
    int? maxLines,
    double? height,
    TextAlign? align,
    EdgeInsets? padding,
  }) =>
      MText._(
        text,
        key: key,
        variant: MTTextVariant.h1,
        color: color,
        maxLines: maxLines ?? 2,
        height: height ?? 1.1,
        align: align,
        padding: padding,
      );

  /// Heading 2
  factory MText.h2(
    String text, {
    Key? key,
    Color? color,
    int? maxLines,
    double? height,
    TextAlign? align,
    EdgeInsets? padding,
  }) =>
      MText._(
        text,
        key: key,
        variant: MTTextVariant.h2,
        color: color,
        maxLines: maxLines ?? 3,
        height: height ?? 1.1,
        align: align,
        padding: padding,
      );

  /// Heading 3
  factory MText.h3(
    String text, {
    Key? key,
    Color? color,
    int? maxLines,
    double? height,
    TextAlign? align,
    EdgeInsets? padding,
  }) =>
      MText._(
        text,
        key: key,
        variant: MTTextVariant.h3,
        color: color,
        maxLines: maxLines ?? 5,
        height: height ?? 1.2,
        align: align,
        padding: padding,
      );

  /// Heading 4
  factory MText.h4(
    String text, {
    Key? key,
    Color? color,
    int? maxLines,
    double? height,
    TextAlign? align,
    EdgeInsets? padding,
  }) =>
      MText._(
        text,
        key: key,
        variant: MTTextVariant.h4,
        color: color,
        maxLines: maxLines,
        height: height,
        align: align,
        padding: padding,
      );

  /// Small text
  factory MText.small(
    String text, {
    Key? key,
    int? maxLines,
    double? height,
    Color? color,
    TextAlign? align,
    EdgeInsets? padding,
  }) =>
      MText._(
        text,
        key: key,
        variant: MTTextVariant.small,
        maxLines: maxLines ?? 1,
        height: height,
        color: color,
        align: align,
        padding: padding,
      );

  /// Button text
  factory MText.button(
    String text, {
    Key? key,
    int? maxLines,
    Color? color,
    TextAlign? align,
    EdgeInsets? padding,
  }) =>
      MText._(
        text,
        key: key,
        variant: MTTextVariant.button,
        maxLines: maxLines,
        color: color,
        align: align ?? TextAlign.center,
        padding: padding,
      );

  /// Link text
  factory MText.link(
    String text, {
    Key? key,
    TextAlign? align,
    EdgeInsets? padding,
    int? maxLines,
    Color? color,
  }) =>
      MText._(
        text,
        key: key,
        variant: MTTextVariant.link,
        align: align,
        padding: padding,
        maxLines: maxLines,
        color: color,
        decoration: TextDecoration.underline,
      );

  /// Numbers text
  factory MText.numbers(
    String text, {
    Key? key,
    int? maxLines,
    Color? color,
    TextAlign? align,
    EdgeInsets? padding,
  }) =>
      MText._(
        text,
        key: key,
        variant: MTTextVariant.numbers,
        maxLines: maxLines ?? 1,
        color: color,
        align: align ?? TextAlign.center,
        padding: padding,
      );

  /// Text with f2 color (secondary text color)
  factory MText.f2(
    String text, {
    Key? key,
    double? sizeScale,
    FontWeight? weight,
    int? maxLines,
    TextAlign? align,
    EdgeInsets? padding,
    double? height,
    TextDecoration? decoration,
  }) =>
      MText._(
        text,
        key: key,
        sizeScale: sizeScale,
        weight: weight,
        maxLines: maxLines,
        align: align,
        padding: padding,
        height: height,
        decoration: decoration,
        variant: MTTextVariant.f2,
      );

  /// Text with f3 color (tertiary text color)
  factory MText.f3(
    String text, {
    Key? key,
    double? sizeScale,
    FontWeight? weight,
    int? maxLines,
    TextAlign? align,
    EdgeInsets? padding,
    double? height,
    TextDecoration? decoration,
  }) =>
      MText._(
        text,
        key: key,
        sizeScale: sizeScale,
        weight: weight,
        maxLines: maxLines,
        align: align,
        padding: padding,
        height: height,
        decoration: decoration,
        variant: MTTextVariant.f3,
      );

  /// Medium weight text
  factory MText.medium(
    String text, {
    Key? key,
    double? sizeScale,
    int? maxLines,
    TextAlign? align,
    EdgeInsets? padding,
    double? height,
    Color? color,
    TextDecoration? decoration,
  }) =>
      MText._(
        text,
        key: key,
        sizeScale: sizeScale,
        maxLines: maxLines,
        align: align,
        padding: padding,
        height: height,
        color: color,
        decoration: decoration,
        weight: FontWeight.w500,
      );

  /// Bold weight text
  factory MText.bold(
    String text, {
    Key? key,
    double? sizeScale,
    int? maxLines,
    TextAlign? align,
    EdgeInsets? padding,
    double? height,
    Color? color,
    TextDecoration? decoration,
  }) =>
      MText._(
        text,
        key: key,
        sizeScale: sizeScale,
        maxLines: maxLines,
        align: align,
        padding: padding,
        height: height,
        color: color,
        decoration: decoration,
        weight: FontWeight.w700,
      );

  final String text;
  final MTTextVariant variant;
  final double? sizeScale;
  final Color? color;
  final FontWeight? weight;
  final int? maxLines;
  final TextAlign? align;
  final EdgeInsets? padding;
  final double? height;
  final TextDecoration? decoration;

  /// Get default color for this text variant
  Color _getDefaultColor(BuildContext context) {
    switch (variant) {
      case MTTextVariant.f2:
        return context.colorScheme.f2Color;
      case MTTextVariant.f3:
        return context.colorScheme.f3Color;
      case MTTextVariant.link:
        return context.colorScheme.mainColor;
      default:
        return context.colorScheme.f1Color;
    }
  }

  /// Get font size for this text variant
  double _getFontSize(BuildContext context) {
    final typography = context.typography;
    final baseSize = sizeScale != null ? typography.bodyFontSize * sizeScale! : typography.bodyFontSize;

    switch (variant) {
      case MTTextVariant.h1:
        return typography.h1FontSize;
      case MTTextVariant.h2:
        return typography.h2FontSize;
      case MTTextVariant.h3:
        return typography.h3FontSize;
      case MTTextVariant.h4:
        return typography.h4FontSize;
      case MTTextVariant.small:
        return typography.smallFontSize;
      case MTTextVariant.button:
        return typography.buttonFontSize;
      case MTTextVariant.link:
        return typography.linkFontSize;
      case MTTextVariant.numbers:
        return typography.numbersFontSize;
      default:
        return baseSize;
    }
  }

  /// Get font weight for this text variant
  FontWeight _getFontWeight(BuildContext context) {
    final typography = context.typography;
    if (weight != null) return weight!;

    switch (variant) {
      case MTTextVariant.h1:
        return typography.h1FontWeight;
      case MTTextVariant.h2:
        return typography.h2FontWeight;
      case MTTextVariant.h3:
        return typography.h3FontWeight;
      case MTTextVariant.h4:
        return typography.h4FontWeight;
      case MTTextVariant.small:
        return typography.smallFontWeight;
      case MTTextVariant.button:
        return typography.buttonFontWeight;
      case MTTextVariant.link:
        return typography.linkFontWeight;
      case MTTextVariant.numbers:
        return typography.numbersFontWeight;
      default:
        return typography.bodyFontWeight;
    }
  }

  /// Get font family for this text variant
  String? _getFontFamily(BuildContext context) {
    final typography = context.typography;
    switch (variant) {
      case MTTextVariant.numbers:
        return typography.fontFamilyNumbers ?? typography.fontFamily;
      default:
        return typography.fontFamily;
    }
  }

  TextStyle style(BuildContext context) {
    final cupertinoTS = CupertinoTheme.of(context).textTheme.textStyle;
    final double h = height ?? kLineHeightMap[maxLines] ?? kDefaultLineHeight;
    final double fs = _getFontSize(context);
    final textColor = color ?? _getDefaultColor(context);
    final rColor = CupertinoDynamicColor.maybeResolve(textColor.resolve(context), context);

    return cupertinoTS.copyWith(
      fontFamily: _getFontFamily(context),
      color: rColor,
      decorationColor: rColor,
      fontWeight: _getFontWeight(context),
      fontSize: fs,
      height: h,
      inherit: true,
      decoration: decoration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        style: style(context),
        textAlign: align,
        maxLines: maxLines ?? 1000,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
