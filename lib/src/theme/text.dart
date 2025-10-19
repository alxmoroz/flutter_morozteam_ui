// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

import '../config/ui_theme.dart';
import '../config/ui_typography.dart';
import 'resolved_color.dart';

// Const color constants for use in const constructors
const _f2Color = CupertinoDynamicColor.withBrightness(
  color: Color.fromARGB(255, 172, 178, 194),
  darkColor: Color.fromARGB(255, 172, 176, 194),
);

const _f3Color = CupertinoDynamicColor.withBrightness(
  color: Color.fromARGB(255, 172, 178, 216),
  darkColor: Color.fromARGB(255, 92, 98, 112),
);

const _mainColor = CupertinoDynamicColor.withBrightness(
  color: Color.fromARGB(255, 90, 111, 228),
  darkColor: Color.fromARGB(255, 100, 170, 255),
);

/// Base class for text with configuration support
class BaseText extends StatelessWidget {
  const BaseText(
    this.text, {
    super.key,
    this.sizeScale,
    this.color,
    this.weight,
    this.maxLines,
    this.align,
    this.padding,
    this.height,
    this.decoration,
  });

  const BaseText.f2(
    this.text, {
    super.key,
    this.sizeScale,
    this.weight,
    this.maxLines,
    this.align,
    this.padding,
    this.height,
    this.decoration,
  }) : color = _f2Color;

  const BaseText.f3(
    this.text, {
    super.key,
    this.sizeScale,
    this.weight,
    this.maxLines,
    this.align,
    this.padding,
    this.height,
    this.decoration,
  }) : color = _f3Color;

  const BaseText.medium(
    this.text, {
    super.key,
    this.sizeScale,
    this.maxLines,
    this.align,
    this.padding,
    this.height,
    this.color,
    this.decoration,
  }) : weight = FontWeight.w500;

  const BaseText.bold(
    this.text, {
    super.key,
    this.sizeScale,
    this.maxLines,
    this.align,
    this.padding,
    this.height,
    this.color,
    this.decoration,
  }) : weight = FontWeight.w700;

  final String text;
  final double? sizeScale;
  final Color? color;
  final FontWeight? weight;
  final int? maxLines;
  final TextAlign? align;
  final EdgeInsets? padding;
  final double? height;
  final TextDecoration? decoration;

  /// Get UITypography from global state
  UITypography _getTypography(BuildContext context) {
    return context.typography;
  }

  TextStyle style(BuildContext context) {
    final typography = _getTypography(context);

    final cupertinoTS = CupertinoTheme.of(context).textTheme.textStyle;
    // if line height is explicitly specified, keep it.
    final double h = height ?? {1: 1.0, 2: 1.1, 3: 1.15, 4: 1.2}[maxLines] ?? 1.3;

    // Use typography values instead of baseFontSize * sizeScale
    final double fs = sizeScale != null ? typography.bodyFontSize * sizeScale! : typography.bodyFontSize;

    final textColor = color ?? context.colorScheme.f1Color.resolve(context);

    final rColor = CupertinoDynamicColor.maybeResolve(textColor, context);

    return cupertinoTS.copyWith(
      fontFamily: typography.fontFamily,
      color: rColor,
      decorationColor: rColor,
      fontWeight: weight ?? typography.bodyFontWeight,
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

/// H1 heading
class H1 extends BaseText {
  const H1(super.text, {super.key, super.color, super.maxLines = 2, super.height = 1.1, super.align, super.padding});

  @override
  TextStyle style(BuildContext context) {
    final typography = _getTypography(context);
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: typography.h1FontSize,
      fontWeight: typography.h1FontWeight,
    );
  }
}

/// H2 heading
class H2 extends BaseText {
  const H2(super.text, {super.key, super.color, super.maxLines = 3, super.height = 1.1, super.align, super.padding});

  @override
  TextStyle style(BuildContext context) {
    final typography = _getTypography(context);
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: typography.h2FontSize,
      fontWeight: typography.h2FontWeight,
    );
  }
}

/// H3 heading
class H3 extends BaseText {
  const H3(super.text, {super.key, super.maxLines = 5, super.height = 1.2, super.color, super.align, super.padding});

  const H3.f2(super.text, {super.key, super.maxLines = 5, super.height = 1.2, super.align, super.padding}) : super.f2();

  @override
  TextStyle style(BuildContext context) {
    final typography = _getTypography(context);
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: typography.h3FontSize,
      fontWeight: typography.h3FontWeight,
    );
  }
}

/// H4 heading
class H4 extends BaseText {
  const H4(super.text, {super.key, super.color, super.maxLines, super.height, super.align, super.padding});

  @override
  TextStyle style(BuildContext context) {
    final typography = _getTypography(context);
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: typography.h4FontSize,
      fontWeight: typography.h4FontWeight,
    );
  }
}

/// Text for numbers
class NumbersText extends BaseText {
  const NumbersText(super.text, {super.key, super.maxLines = 1, super.color, super.align, super.padding});

  @override
  TextStyle style(BuildContext context) {
    final typography = _getTypography(context);
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: typography.numbersFontSize,
      fontWeight: typography.numbersFontWeight,
      fontFamily: typography.fontFamilyNumbers,
    );
  }
}

/// Small text
class SmallText extends BaseText {
  const SmallText(super.text, {super.key, super.maxLines = 1, super.color, super.align, super.padding});

  @override
  TextStyle style(BuildContext context) {
    final typography = _getTypography(context);
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: typography.smallFontSize,
      fontWeight: typography.smallFontWeight,
    );
  }
}

/// Text for buttons
class ButtonText extends BaseText {
  const ButtonText(super.text, {super.key, super.maxLines, super.color, super.align = TextAlign.center, super.padding});

  const ButtonText.f2(super.text, {super.key, super.maxLines = 1, super.align = TextAlign.center, super.padding})
      : super.f2();

  @override
  TextStyle style(BuildContext context) {
    final typography = _getTypography(context);
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: typography.buttonFontSize,
      fontWeight: typography.buttonFontWeight,
    );
  }
}

/// Link text
class LinkText extends BaseText {
  const LinkText(
    super.text, {
    super.key,
    super.align,
    super.padding,
    super.maxLines,
    Color? color,
  }) : super(
          color: color ?? _mainColor,
          decoration: TextDecoration.underline,
        );

  @override
  TextStyle style(BuildContext context) {
    final typography = _getTypography(context);
    final baseStyle = super.style(context);

    return baseStyle.copyWith(
      fontSize: typography.linkFontSize,
      fontWeight: typography.linkFontWeight,
    );
  }
}
