import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ui_breakpoints.dart';
import 'ui_color_scheme.dart';
import 'ui_sizing.dart';
import 'ui_theme_extension.dart';
import 'ui_typography.dart';

class UIThemeBuilder {
  UIThemeBuilder._();

  static ThemeData build(
    BuildContext context, {
    UIColorScheme colorScheme = const UIColorScheme(),
    UITypography typography = const UITypography(),
    UISizing sizing = const UISizing(),
    UIBreakpoints breakpoints = const UIBreakpoints(),
  }) {
    final brightness = MediaQuery.platformBrightnessOf(context);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: CupertinoDynamicColor.resolve(colorScheme.mainColor, context),
        brightness: brightness,
        primary: CupertinoDynamicColor.resolve(colorScheme.mainColor, context),
        surface: CupertinoDynamicColor.resolve(colorScheme.b0Color, context),
        error: CupertinoDynamicColor.resolve(colorScheme.warningColor, context),
        onPrimary: CupertinoDynamicColor.resolve(colorScheme.f1Color, context),
        onSurface: CupertinoDynamicColor.resolve(colorScheme.f1Color, context),
        onError: CupertinoDynamicColor.resolve(colorScheme.f1Color, context),
      ),
      extensions: [
        UIKitExtension(
          b0Color: CupertinoDynamicColor.resolve(colorScheme.b0Color, context),
          b1Color: CupertinoDynamicColor.resolve(colorScheme.b1Color, context),
          b2Color: CupertinoDynamicColor.resolve(colorScheme.b2Color, context),
          b3Color: CupertinoDynamicColor.resolve(colorScheme.b3Color, context),
          f1Color: CupertinoDynamicColor.resolve(colorScheme.f1Color, context),
          f2Color: CupertinoDynamicColor.resolve(colorScheme.f2Color, context),
          f3Color: CupertinoDynamicColor.resolve(colorScheme.f3Color, context),
          warningColor: CupertinoDynamicColor.resolve(colorScheme.warningColor, context),
          barColor: CupertinoDynamicColor.resolve(colorScheme.barColor, context),
          navbarColor: CupertinoDynamicColor.resolve(colorScheme.navbarColor, context),
          defaultBarrierColor: CupertinoDynamicColor.resolve(colorScheme.defaultBarrierColor, context),
          sizing: sizing,
          breakpoints: breakpoints,
          typography: typography,
        ),
      ],
    );
  }
}
