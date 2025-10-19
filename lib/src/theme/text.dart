// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

import '../config/mt_theme.dart';
import '../config/mt_typography.dart';
import 'resolved_color.dart';

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

  /// Creates text with f2 color (secondary text color)
  const factory BaseText.f2(
    String text, {
    Key? key,
    double? sizeScale,
    FontWeight? weight,
    int? maxLines,
    TextAlign? align,
    EdgeInsets? padding,
    double? height,
    TextDecoration? decoration,
  }) = _F2Text;

  /// Creates text with f3 color (tertiary text color)
  const factory BaseText.f3(
    String text, {
    Key? key,
    double? sizeScale,
    FontWeight? weight,
    int? maxLines,
    TextAlign? align,
    EdgeInsets? padding,
    double? height,
    TextDecoration? decoration,
  }) = _F3Text;

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

  /// Get default color for this text type
  /// Override in subclasses to provide custom default colors
  Color getDefaultColor(BuildContext context) {
    return context.colorScheme.f1Color;
  }

  /// Get font size for this text type
  /// Override in subclasses to provide custom font sizes
  double getFontSize(MTTypography typography) {
    return sizeScale != null ? typography.bodyFontSize * sizeScale! : typography.bodyFontSize;
  }

  /// Get font weight for this text type
  /// Override in subclasses to provide custom font weights
  FontWeight getFontWeight(MTTypography typography) {
    return weight ?? typography.bodyFontWeight;
  }

  /// Get font family for this text type
  /// Override in subclasses to provide custom font families
  String? getFontFamily(MTTypography typography) {
    return typography.fontFamily;
  }

  TextStyle style(BuildContext context) {
    final typography = context.typography;
    final cupertinoTS = CupertinoTheme.of(context).textTheme.textStyle;
    final double h = height ?? {1: 1.0, 2: 1.1, 3: 1.15, 4: 1.2}[maxLines] ?? 1.3;
    final double fs = getFontSize(typography);
    final textColor = color ?? getDefaultColor(context).resolve(context);
    final rColor = CupertinoDynamicColor.maybeResolve(textColor, context);

    return cupertinoTS.copyWith(
      fontFamily: getFontFamily(typography),
      color: rColor,
      decorationColor: rColor,
      fontWeight: getFontWeight(typography),
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

/// Internal class for f2 colored text
class _F2Text extends BaseText {
  const _F2Text(
    super.text, {
    super.key,
    super.sizeScale,
    super.weight,
    super.maxLines,
    super.align,
    super.padding,
    super.height,
    super.decoration,
  }) : super(color: null);

  @override
  Color getDefaultColor(BuildContext context) => context.colorScheme.f2Color;
}

/// Internal class for f3 colored text
class _F3Text extends BaseText {
  const _F3Text(
    super.text, {
    super.key,
    super.sizeScale,
    super.weight,
    super.maxLines,
    super.align,
    super.padding,
    super.height,
    super.decoration,
  }) : super(color: null);

  @override
  Color getDefaultColor(BuildContext context) => context.colorScheme.f3Color;
}

/// H1 heading
class H1 extends BaseText {
  const H1(super.text, {super.key, super.color, super.maxLines = 2, super.height = 1.1, super.align, super.padding});

  @override
  double getFontSize(MTTypography typography) => typography.h1FontSize;

  @override
  FontWeight getFontWeight(MTTypography typography) => typography.h1FontWeight;
}

/// H2 heading
class H2 extends BaseText {
  const H2(super.text, {super.key, super.color, super.maxLines = 3, super.height = 1.1, super.align, super.padding});

  @override
  double getFontSize(MTTypography typography) => typography.h2FontSize;

  @override
  FontWeight getFontWeight(MTTypography typography) => typography.h2FontWeight;
}

/// H3 heading
class H3 extends BaseText {
  const H3(super.text, {super.key, super.maxLines = 5, super.height = 1.2, super.color, super.align, super.padding});

  /// Creates H3 with f2 color
  const factory H3.f2(String text, {Key? key, int? maxLines, double? height, TextAlign? align, EdgeInsets? padding}) = _H3F2;

  @override
  double getFontSize(MTTypography typography) => typography.h3FontSize;

  @override
  FontWeight getFontWeight(MTTypography typography) => typography.h3FontWeight;
}

/// Internal class for H3.f2
class _H3F2 extends H3 {
  const _H3F2(super.text, {super.key, super.maxLines, super.height, super.align, super.padding}) : super(color: null);

  @override
  Color getDefaultColor(BuildContext context) => context.colorScheme.f2Color;
}

/// H4 heading
class H4 extends BaseText {
  const H4(super.text, {super.key, super.color, super.maxLines, super.height, super.align, super.padding});

  @override
  double getFontSize(MTTypography typography) => typography.h4FontSize;

  @override
  FontWeight getFontWeight(MTTypography typography) => typography.h4FontWeight;
}

/// Text for numbers
class NumbersText extends BaseText {
  const NumbersText(super.text, {super.key, super.maxLines = 1, super.color, super.align, super.padding});

  @override
  double getFontSize(MTTypography typography) => typography.numbersFontSize;

  @override
  FontWeight getFontWeight(MTTypography typography) => typography.numbersFontWeight;

  @override
  String? getFontFamily(MTTypography typography) => typography.fontFamilyNumbers ?? typography.fontFamily;
}

/// Small text
class SmallText extends BaseText {
  const SmallText(super.text, {super.key, super.maxLines = 1, super.color, super.align, super.padding});

  @override
  double getFontSize(MTTypography typography) => typography.smallFontSize;

  @override
  FontWeight getFontWeight(MTTypography typography) => typography.smallFontWeight;
}

/// Text for buttons
class ButtonText extends BaseText {
  const ButtonText(super.text, {super.key, super.maxLines, super.color, super.align = TextAlign.center, super.padding});

  /// Creates ButtonText with f2 color
  const factory ButtonText.f2(String text, {Key? key, int? maxLines, TextAlign? align, EdgeInsets? padding}) = _ButtonTextF2;

  @override
  double getFontSize(MTTypography typography) => typography.buttonFontSize;

  @override
  FontWeight getFontWeight(MTTypography typography) => typography.buttonFontWeight;
}

/// Internal class for ButtonText.f2
class _ButtonTextF2 extends ButtonText {
  const _ButtonTextF2(super.text, {super.key, super.maxLines, super.align, super.padding}) : super(color: null);

  @override
  Color getDefaultColor(BuildContext context) => context.colorScheme.f2Color;
}

/// Link text
class LinkText extends BaseText {
  const LinkText(
    super.text, {
    super.key,
    super.align,
    super.padding,
    super.maxLines,
    super.color,
  }) : super(
          decoration: TextDecoration.underline,
        );

  @override
  Color getDefaultColor(BuildContext context) => context.colorScheme.mainColor;

  @override
  double getFontSize(MTTypography typography) => typography.linkFontSize;

  @override
  FontWeight getFontWeight(MTTypography typography) => typography.linkFontWeight;
}
