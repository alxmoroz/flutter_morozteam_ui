import 'package:flutter/material.dart';

import 'ui_breakpoints.dart';
import 'ui_sizing.dart';
import 'ui_typography.dart';

class UIKitExtension extends ThemeExtension<UIKitExtension> {
  const UIKitExtension({
    required this.b0Color,
    required this.b1Color,
    required this.b2Color,
    required this.b3Color,
    required this.f1Color,
    required this.f2Color,
    required this.f3Color,
    required this.warningColor,
    required this.barColor,
    required this.navbarColor,
    required this.defaultBarrierColor,
    required this.sizing,
    required this.breakpoints,
    required this.typography,
  });

  final Color b0Color;
  final Color b1Color;
  final Color b2Color;
  final Color b3Color;
  final Color f1Color;
  final Color f2Color;
  final Color f3Color;
  final Color warningColor;
  final Color barColor;
  final Color navbarColor;
  final Color defaultBarrierColor;
  final UISizing sizing;
  final UIBreakpoints breakpoints;
  final UITypography typography;

  @override
  UIKitExtension copyWith({
    Color? b0Color,
    Color? b1Color,
    Color? b2Color,
    Color? b3Color,
    Color? f1Color,
    Color? f2Color,
    Color? f3Color,
    Color? warningColor,
    Color? barColor,
    Color? navbarColor,
    Color? defaultBarrierColor,
    UISizing? sizing,
    UIBreakpoints? breakpoints,
    UITypography? typography,
  }) {
    return UIKitExtension(
      b0Color: b0Color ?? this.b0Color,
      b1Color: b1Color ?? this.b1Color,
      b2Color: b2Color ?? this.b2Color,
      b3Color: b3Color ?? this.b3Color,
      f1Color: f1Color ?? this.f1Color,
      f2Color: f2Color ?? this.f2Color,
      f3Color: f3Color ?? this.f3Color,
      warningColor: warningColor ?? this.warningColor,
      barColor: barColor ?? this.barColor,
      navbarColor: navbarColor ?? this.navbarColor,
      defaultBarrierColor: defaultBarrierColor ?? this.defaultBarrierColor,
      sizing: sizing ?? this.sizing,
      breakpoints: breakpoints ?? this.breakpoints,
      typography: typography ?? this.typography,
    );
  }

  @override
  UIKitExtension lerp(ThemeExtension<UIKitExtension>? other, double t) {
    if (other is! UIKitExtension) {
      return this;
    }

    return UIKitExtension(
      b0Color: Color.lerp(b0Color, other.b0Color, t)!,
      b1Color: Color.lerp(b1Color, other.b1Color, t)!,
      b2Color: Color.lerp(b2Color, other.b2Color, t)!,
      b3Color: Color.lerp(b3Color, other.b3Color, t)!,
      f1Color: Color.lerp(f1Color, other.f1Color, t)!,
      f2Color: Color.lerp(f2Color, other.f2Color, t)!,
      f3Color: Color.lerp(f3Color, other.f3Color, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      barColor: Color.lerp(barColor, other.barColor, t)!,
      navbarColor: Color.lerp(navbarColor, other.navbarColor, t)!,
      defaultBarrierColor: Color.lerp(defaultBarrierColor, other.defaultBarrierColor, t)!,
      sizing: t < 0.5 ? sizing : other.sizing,
      breakpoints: t < 0.5 ? breakpoints : other.breakpoints,
      typography: t < 0.5 ? typography : other.typography,
    );
  }
}
