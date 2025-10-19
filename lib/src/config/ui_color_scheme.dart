// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

/// Color scheme for UI Kit with light/dark theme support
/// 
/// This class provides all colors used throughout the UI Kit.
/// Colors are defined as CupertinoDynamicColor to support both light and dark themes.
/// All colors can be overridden when creating a custom UIKitConfig.
class UIColorScheme {
  const UIColorScheme({
    this.b0Color = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 130, 140, 190),
      darkColor: Color.fromARGB(255, 2, 6, 24),
    ),
    this.b1Color = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 210, 216, 238),
      darkColor: Color.fromARGB(255, 24, 30, 56),
    ),
    this.b2Color = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 239, 242, 251),
      darkColor: Color.fromARGB(255, 43, 48, 73),
    ),
    this.b3Color = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 255, 254, 253),
      darkColor: Color.fromARGB(255, 54, 60, 86),
    ),
    this.f1Color = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 114, 120, 172),
      darkColor: Color.fromARGB(255, 130, 134, 168),
    ),
    this.f2Color = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 172, 178, 194),
      darkColor: Color.fromARGB(255, 172, 176, 194),
    ),
    this.f3Color = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 172, 178, 216),
      darkColor: Color.fromARGB(255, 92, 98, 112),
    ),
    this.mainColor = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 90, 111, 228),
      darkColor: Color.fromARGB(255, 100, 170, 255),
    ),
    this.dangerColor = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 255, 140, 80),
      darkColor: Color.fromARGB(255, 255, 142, 90),
    ),
    this.safeColor = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 31, 188, 180),
      darkColor: Color.fromARGB(255, 44, 197, 189),
    ),
    this.warningColor = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 255, 192, 8),
      darkColor: Color.fromARGB(255, 255, 200, 20),
    ),
    this.mainBtnTitleColor = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 239, 242, 251),
      darkColor: Color.fromARGB(255, 43, 48, 73),
    ),
    this.barColor = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 239, 242, 251),
      darkColor: Color.fromARGB(255, 43, 48, 73),
    ),
    this.navbarColor = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(0, 255, 255, 255),
      darkColor: Color.fromARGB(0, 0, 0, 0),
    ),
    this.defaultBarrierColor = const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(240, 210, 216, 238),
      darkColor: Color.fromARGB(240, 24, 30, 56),
    ),
  });

  // Background colors (b0 - darkest, b3 - lightest)
  final Color b0Color;
  final Color b1Color;
  final Color b2Color;
  final Color b3Color;

  // Text colors (f1 - primary, f3 - lightest)
  final Color f1Color;
  final Color f2Color;
  final Color f3Color;

  // Accent colors
  final Color mainColor;
  final Color dangerColor;
  final Color safeColor;
  final Color warningColor;

  // Special colors
  final Color mainBtnTitleColor;
  final Color barColor;
  final Color navbarColor;
  final Color defaultBarrierColor;

  /// Create a copy of color scheme with modified parameters
  UIColorScheme copyWith({
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
    Color? barColor,
    Color? navbarColor,
    Color? defaultBarrierColor,
  }) {
    return UIColorScheme(
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
      barColor: barColor ?? this.barColor,
      navbarColor: navbarColor ?? this.navbarColor,
      defaultBarrierColor: defaultBarrierColor ?? this.defaultBarrierColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UIColorScheme &&
        other.b0Color == b0Color &&
        other.b1Color == b1Color &&
        other.b2Color == b2Color &&
        other.b3Color == b3Color &&
        other.f1Color == f1Color &&
        other.f2Color == f2Color &&
        other.f3Color == f3Color &&
        other.mainColor == mainColor &&
        other.dangerColor == dangerColor &&
        other.safeColor == safeColor &&
        other.warningColor == warningColor &&
        other.mainBtnTitleColor == mainBtnTitleColor &&
        other.barColor == barColor &&
        other.navbarColor == navbarColor &&
        other.defaultBarrierColor == defaultBarrierColor;
  }

  @override
  int get hashCode {
    return Object.hash(
      b0Color,
      b1Color,
      b2Color,
      b3Color,
      f1Color,
      f2Color,
      f3Color,
      mainColor,
      dangerColor,
      safeColor,
      warningColor,
      mainBtnTitleColor,
      barColor,
      navbarColor,
      defaultBarrierColor,
    );
  }
}
