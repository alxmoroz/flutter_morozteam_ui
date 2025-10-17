// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

/// Конфигурация UI Kit для настройки цветов, типографики и spacing
class UIKitConfig {
  const UIKitConfig({
    // Цветовая схема
    required this.b0Color,
    required this.b1Color,
    required this.b2Color,
    required this.b3Color,
    required this.f1Color,
    required this.f2Color,
    required this.f3Color,
    required this.mainColor,
    required this.dangerColor,
    this.safeColor,
    this.warningColor,
    this.mainBtnTitleColor,
    this.navbarColor,
    this.defaultBarrierColor,

    // Типографика
    this.baseFontSize = 16.0,
    this.fontFamily = 'Roboto',
    this.fontFamilyNumbers = 'Montserrat',
    this.fontFamilyDecorative = 'Comfortaa',

    // Typography - Headings (defaults from Avanplan)
    this.h1FontSize = 28.0,
    this.h1FontWeight = FontWeight.w300, // Light, like Avanplan
    this.h2FontSize = 25.0,
    this.h2FontWeight = FontWeight.w400, // Regular, like Avanplan
    this.h3FontSize = 21.0,
    this.h3FontWeight = FontWeight.w400, // Regular, like Avanplan
    this.h4FontSize = 18.0,
    this.h4FontWeight = FontWeight.w500, // Medium

    // Typography - Body (defaults from Avanplan)
    this.bodyFontSize = 18.0, // Like Avanplan baseFontSize
    this.bodyFontWeight = FontWeight.w400,
    this.smallFontSize = 15.0, // Like Avanplan SmallText
    this.smallFontWeight = FontWeight.w400,

    // Typography - Special
    this.buttonFontSize = 16.0,
    this.buttonFontWeight = FontWeight.w500,
    this.linkFontSize = 14.0,
    this.linkFontWeight = FontWeight.w400,
    this.numbersFontSize = 20.0, // Like Avanplan DText
    this.numbersFontWeight = FontWeight.w400,

    // Spacing
    this.baseSpacing = 6.0,

    // Border radius
    this.defaultBorderRadius = 12.0,
    this.buttonBorderRadius,

    // Elevation
    this.cardElevation = 1.0,
    this.buttonElevation = 1.0,

    // Размеры
    this.minButtonHeight = 48.0,
    this.defaultBarHeight = 48.0,
    this.tappableIconSize = 36.0,

    // Breakpoints
    this.xxsWidth = 290.0,
    this.xsWidth = 364.0,
    this.xsHeight = 480.0,
    this.sWidth = 480.0,
    this.sHeight = 640.0,
    this.mWidth = 640.0,
    this.mHeight = 860.0,
    this.lWidth = 760.0,
    this.xlWidth = 960.0,
    this.xxlWidth = 1280.0,
  });

  // Цвета фона (b0 - самый темный, b3 - самый светлый)
  final Color b0Color;
  final Color b1Color;
  final Color b2Color;
  final Color b3Color;

  // Цвета текста (f1 - основной, f3 - самый светлый)
  final Color f1Color;
  final Color f2Color;
  final Color f3Color;

  // Акцентные цвета
  final Color mainColor;
  final Color dangerColor;
  final Color? safeColor;
  final Color? warningColor;

  // Специальные цвета
  final Color? mainBtnTitleColor;
  final Color? navbarColor;
  final Color? defaultBarrierColor;

  // Типографика
  final double baseFontSize;
  final String fontFamily;
  final String fontFamilyNumbers;
  final String fontFamilyDecorative;

  // Typography - Headings
  final double h1FontSize;
  final FontWeight h1FontWeight;
  final double h2FontSize;
  final FontWeight h2FontWeight;
  final double h3FontSize;
  final FontWeight h3FontWeight;
  final double h4FontSize;
  final FontWeight h4FontWeight;

  // Typography - Body
  final double bodyFontSize;
  final FontWeight bodyFontWeight;
  final double smallFontSize;
  final FontWeight smallFontWeight;

  // Typography - Special
  final double buttonFontSize;
  final FontWeight buttonFontWeight;
  final double linkFontSize;
  final FontWeight linkFontWeight;
  final double numbersFontSize;
  final FontWeight numbersFontWeight;

  // Spacing (базовое значение для сетки)
  final double baseSpacing;

  // Border radius
  final double defaultBorderRadius;
  final double? buttonBorderRadius;

  // Elevation
  final double cardElevation;
  final double buttonElevation;

  // Размеры
  final double minButtonHeight;
  final double defaultBarHeight;
  final double tappableIconSize;

  // Breakpoints для адаптивности
  final double xxsWidth;
  final double xsWidth;
  final double xsHeight;
  final double sWidth;
  final double sHeight;
  final double mWidth;
  final double mHeight;
  final double lWidth;
  final double xlWidth;
  final double xxlWidth;

  /// Получить радиус для кнопок (по умолчанию половина высоты)
  double get buttonRadius => buttonBorderRadius ?? (minButtonHeight / 2);

  /// Создать копию конфигурации с измененными параметрами
  UIKitConfig copyWith({
    Color? b0Color,
    Color? b1Color,
    Color? b2Color,
    Color? b3Color,
    Color? f1Color,
    Color? f2Color,
    Color? f3Color,
    Color? mainColor,
    Color? dangerColor,
    Color? safeColor,
    Color? warningColor,
    Color? mainBtnTitleColor,
    Color? navbarColor,
    Color? defaultBarrierColor,
    double? baseFontSize,
    String? fontFamily,
    String? fontFamilyNumbers,
    String? fontFamilyDecorative,
    double? h1FontSize,
    FontWeight? h1FontWeight,
    double? h2FontSize,
    FontWeight? h2FontWeight,
    double? h3FontSize,
    FontWeight? h3FontWeight,
    double? h4FontSize,
    FontWeight? h4FontWeight,
    double? bodyFontSize,
    FontWeight? bodyFontWeight,
    double? smallFontSize,
    FontWeight? smallFontWeight,
    double? buttonFontSize,
    FontWeight? buttonFontWeight,
    double? linkFontSize,
    FontWeight? linkFontWeight,
    double? numbersFontSize,
    FontWeight? numbersFontWeight,
    double? baseSpacing,
    double? defaultBorderRadius,
    double? buttonBorderRadius,
    double? cardElevation,
    double? buttonElevation,
    double? minButtonHeight,
    double? defaultBarHeight,
    double? tappableIconSize,
    double? xxsWidth,
    double? xsWidth,
    double? xsHeight,
    double? sWidth,
    double? sHeight,
    double? mWidth,
    double? mHeight,
    double? lWidth,
    double? xlWidth,
    double? xxlWidth,
  }) {
    return UIKitConfig(
      b0Color: b0Color ?? this.b0Color,
      b1Color: b1Color ?? this.b1Color,
      b2Color: b2Color ?? this.b2Color,
      b3Color: b3Color ?? this.b3Color,
      f1Color: f1Color ?? this.f1Color,
      f2Color: f2Color ?? this.f2Color,
      f3Color: f3Color ?? this.f3Color,
      mainColor: mainColor ?? this.mainColor,
      dangerColor: dangerColor ?? this.dangerColor,
      safeColor: safeColor ?? this.safeColor,
      warningColor: warningColor ?? this.warningColor,
      mainBtnTitleColor: mainBtnTitleColor ?? this.mainBtnTitleColor,
      navbarColor: navbarColor ?? this.navbarColor,
      defaultBarrierColor: defaultBarrierColor ?? this.defaultBarrierColor,
      baseFontSize: baseFontSize ?? this.baseFontSize,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyNumbers: fontFamilyNumbers ?? this.fontFamilyNumbers,
      fontFamilyDecorative: fontFamilyDecorative ?? this.fontFamilyDecorative,
      h1FontSize: h1FontSize ?? this.h1FontSize,
      h1FontWeight: h1FontWeight ?? this.h1FontWeight,
      h2FontSize: h2FontSize ?? this.h2FontSize,
      h2FontWeight: h2FontWeight ?? this.h2FontWeight,
      h3FontSize: h3FontSize ?? this.h3FontSize,
      h3FontWeight: h3FontWeight ?? this.h3FontWeight,
      h4FontSize: h4FontSize ?? this.h4FontSize,
      h4FontWeight: h4FontWeight ?? this.h4FontWeight,
      bodyFontSize: bodyFontSize ?? this.bodyFontSize,
      bodyFontWeight: bodyFontWeight ?? this.bodyFontWeight,
      smallFontSize: smallFontSize ?? this.smallFontSize,
      smallFontWeight: smallFontWeight ?? this.smallFontWeight,
      buttonFontSize: buttonFontSize ?? this.buttonFontSize,
      buttonFontWeight: buttonFontWeight ?? this.buttonFontWeight,
      linkFontSize: linkFontSize ?? this.linkFontSize,
      linkFontWeight: linkFontWeight ?? this.linkFontWeight,
      numbersFontSize: numbersFontSize ?? this.numbersFontSize,
      numbersFontWeight: numbersFontWeight ?? this.numbersFontWeight,
      baseSpacing: baseSpacing ?? this.baseSpacing,
      defaultBorderRadius: defaultBorderRadius ?? this.defaultBorderRadius,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
      cardElevation: cardElevation ?? this.cardElevation,
      buttonElevation: buttonElevation ?? this.buttonElevation,
      minButtonHeight: minButtonHeight ?? this.minButtonHeight,
      defaultBarHeight: defaultBarHeight ?? this.defaultBarHeight,
      tappableIconSize: tappableIconSize ?? this.tappableIconSize,
      xxsWidth: xxsWidth ?? this.xxsWidth,
      xsWidth: xsWidth ?? this.xsWidth,
      xsHeight: xsHeight ?? this.xsHeight,
      sWidth: sWidth ?? this.sWidth,
      sHeight: sHeight ?? this.sHeight,
      mWidth: mWidth ?? this.mWidth,
      mHeight: mHeight ?? this.mHeight,
      lWidth: lWidth ?? this.lWidth,
      xlWidth: xlWidth ?? this.xlWidth,
      xxlWidth: xxlWidth ?? this.xxlWidth,
    );
  }
}
