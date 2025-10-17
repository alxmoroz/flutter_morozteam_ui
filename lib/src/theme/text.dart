// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

import '../config/ui_config.dart';
import 'colors.dart';

/// Базовый класс для текста с поддержкой конфигурации
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
  }) : color = null; // Будет использован f2Color из конфига

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
  }) : color = null; // Будет использован f3Color из конфига

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

  /// Get UIKitConfig from global state
  UIKitConfig _getConfig() {
    // Access config through global colors instance
    return colors.config;
  }

  TextStyle style(BuildContext context) {
    final config = _getConfig();
    final uiColors = colors;

    final cupertinoTS = CupertinoTheme.of(context).textTheme.textStyle;
    // если указан явно межстрочный интервал, то оставляем его.
    final double h = height ?? {1: 1.0, 2: 1.1, 3: 1.15, 4: 1.2}[maxLines] ?? 1.3;

    // Use config values instead of baseFontSize * sizeScale
    final double fs = sizeScale != null ? config.bodyFontSize * sizeScale! : config.bodyFontSize;

    // Определяем цвет текста
    Color textColor;
    if (color != null) {
      textColor = color!;
    } else {
      textColor = uiColors.f1Color;
    }

    final rColor = CupertinoDynamicColor.maybeResolve(textColor, context);

    return cupertinoTS.copyWith(
      fontFamily: config.fontFamily,
      color: rColor,
      decorationColor: rColor,
      fontWeight: weight ?? config.bodyFontWeight,
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

/// Заголовок H1
class H1 extends BaseText {
  const H1(super.text, {super.key, super.color, super.maxLines = 2, super.height = 1.1, super.align, super.padding});

  @override
  TextStyle style(BuildContext context) {
    final config = _getConfig();
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: config.h1FontSize,
      fontWeight: config.h1FontWeight,
    );
  }
}

/// Заголовок H2
class H2 extends BaseText {
  const H2(super.text, {super.key, super.color, super.maxLines = 3, super.height = 1.1, super.align, super.padding});

  @override
  TextStyle style(BuildContext context) {
    final config = _getConfig();
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: config.h2FontSize,
      fontWeight: config.h2FontWeight,
    );
  }
}

/// Заголовок H3
class H3 extends BaseText {
  const H3(super.text, {super.key, super.maxLines = 5, super.height = 1.2, super.color, super.align, super.padding});

  const H3.f2(super.text, {super.key, super.maxLines = 5, super.height = 1.2, super.align, super.padding}) : super.f2();

  @override
  TextStyle style(BuildContext context) {
    final config = _getConfig();
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: config.h3FontSize,
      fontWeight: config.h3FontWeight,
    );
  }
}

/// Заголовок H4
class H4 extends BaseText {
  const H4(super.text, {super.key, super.color, super.maxLines, super.height, super.align, super.padding});

  @override
  TextStyle style(BuildContext context) {
    final config = _getConfig();
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: config.h4FontSize,
      fontWeight: config.h4FontWeight,
    );
  }
}

/// Текст для цифр
class NumbersText extends BaseText {
  const NumbersText(super.text, {super.key, super.maxLines = 1, super.color, super.align, super.padding});

  @override
  TextStyle style(BuildContext context) {
    final config = _getConfig();
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: config.numbersFontSize,
      fontWeight: config.numbersFontWeight,
      fontFamily: config.fontFamilyNumbers,
    );
  }
}

/// Мелкий текст
class SmallText extends BaseText {
  const SmallText(super.text, {super.key, super.maxLines = 1, super.color, super.align, super.padding});

  @override
  TextStyle style(BuildContext context) {
    final config = _getConfig();
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: config.smallFontSize,
      fontWeight: config.smallFontWeight,
    );
  }
}

/// Текст для кнопок
class ButtonText extends BaseText {
  const ButtonText(super.text, {super.key, super.maxLines, super.color, super.align = TextAlign.center, super.padding});

  const ButtonText.f2(super.text, {super.key, super.maxLines = 1, super.align = TextAlign.center, super.padding})
      : super.f2();

  @override
  TextStyle style(BuildContext context) {
    final config = _getConfig();
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: config.buttonFontSize,
      fontWeight: config.buttonFontWeight,
    );
  }
}

/// Текст-ссылка
class LinkText extends BaseText {
  const LinkText(
    super.text, {
    super.key,
    super.maxLines = 1,
    super.color,
    super.align,
    super.padding,
    super.decoration = TextDecoration.underline,
  });

  @override
  TextStyle style(BuildContext context) {
    final config = _getConfig();
    final uiColors = colors;
    final baseStyle = super.style(context);
    return baseStyle.copyWith(
      fontSize: config.linkFontSize,
      fontWeight: config.linkFontWeight,
      color: color ?? uiColors.mainColor,
      decorationColor: color ?? uiColors.mainColor,
    );
  }
}
