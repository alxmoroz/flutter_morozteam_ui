// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

/// Typography configuration for MorozTeam UI Kit
class MTTypography {
  const MTTypography({
    this.baseFontSize = 16.0,
    this.fontFamily = 'Roboto',
    this.fontFamilyNumbers = 'Montserrat',
    this.fontFamilyDecorative = 'Comfortaa',

    // Headings
    this.h1FontSize = 28.0,
    this.h1FontWeight = FontWeight.w300,
    this.h2FontSize = 25.0,
    this.h2FontWeight = FontWeight.w400,
    this.h3FontSize = 21.0,
    this.h3FontWeight = FontWeight.w500,
    this.h4FontSize = 18.0,
    this.h4FontWeight = FontWeight.w500,

    // Body text
    this.bodyFontSize = 18.0,
    this.bodyFontWeight = FontWeight.w400,
    this.smallFontSize = 15.0,
    this.smallFontWeight = FontWeight.w400,

    // Special text
    this.buttonFontSize = 16.0,
    this.buttonFontWeight = FontWeight.w500,
    this.linkFontSize = 14.0,
    this.linkFontWeight = FontWeight.w400,
    this.numbersFontSize = 20.0,
    this.numbersFontWeight = FontWeight.w400,
  });

  // Base typography
  final double baseFontSize;
  final String fontFamily;
  final String fontFamilyNumbers;
  final String fontFamilyDecorative;

  // Headings
  final double h1FontSize;
  final FontWeight h1FontWeight;
  final double h2FontSize;
  final FontWeight h2FontWeight;
  final double h3FontSize;
  final FontWeight h3FontWeight;
  final double h4FontSize;
  final FontWeight h4FontWeight;

  // Body text
  final double bodyFontSize;
  final FontWeight bodyFontWeight;
  final double smallFontSize;
  final FontWeight smallFontWeight;

  // Special text
  final double buttonFontSize;
  final FontWeight buttonFontWeight;
  final double linkFontSize;
  final FontWeight linkFontWeight;
  final double numbersFontSize;
  final FontWeight numbersFontWeight;

  /// Create a copy of typography configuration with modified parameters
  MTTypography copyWith({
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
  }) {
    return MTTypography(
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
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MTTypography &&
        other.baseFontSize == baseFontSize &&
        other.fontFamily == fontFamily &&
        other.fontFamilyNumbers == fontFamilyNumbers &&
        other.fontFamilyDecorative == fontFamilyDecorative &&
        other.h1FontSize == h1FontSize &&
        other.h1FontWeight == h1FontWeight &&
        other.h2FontSize == h2FontSize &&
        other.h2FontWeight == h2FontWeight &&
        other.h3FontSize == h3FontSize &&
        other.h3FontWeight == h3FontWeight &&
        other.h4FontSize == h4FontSize &&
        other.h4FontWeight == h4FontWeight &&
        other.bodyFontSize == bodyFontSize &&
        other.bodyFontWeight == bodyFontWeight &&
        other.smallFontSize == smallFontSize &&
        other.smallFontWeight == smallFontWeight &&
        other.buttonFontSize == buttonFontSize &&
        other.buttonFontWeight == buttonFontWeight &&
        other.linkFontSize == linkFontSize &&
        other.linkFontWeight == linkFontWeight &&
        other.numbersFontSize == numbersFontSize &&
        other.numbersFontWeight == numbersFontWeight;
  }

  @override
  int get hashCode {
    return Object.hash(
      Object.hash(
        baseFontSize,
        fontFamily,
        fontFamilyNumbers,
        fontFamilyDecorative,
        h1FontSize,
        h1FontWeight,
        h2FontSize,
        h2FontWeight,
        h3FontSize,
        h3FontWeight,
        h4FontSize,
        h4FontWeight,
        bodyFontSize,
        bodyFontWeight,
        smallFontSize,
        smallFontWeight,
        buttonFontSize,
        buttonFontWeight,
        linkFontSize,
        linkFontWeight,
      ),
      numbersFontSize,
      numbersFontWeight,
    );
  }
}
