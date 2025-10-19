// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mt_breakpoints.dart';
import 'mt_color_scheme.dart';
import 'mt_sizing.dart';
import 'mt_theme_data.dart';
import 'mt_typography.dart';

/// Builds a ThemeData with MTThemeData extension for MorozTeam UI Kit
///
/// This function creates a ThemeData with MTThemeData extension that can be
/// passed directly to MaterialApp.theme parameter.
ThemeData buildMTTheme(
  BuildContext context, {
  MTColorScheme colorScheme = const MTColorScheme(),
  MTTypography typography = const MTTypography(),
  MTSizing sizing = const MTSizing(),
  MTBreakpoints breakpoints = const MTBreakpoints(),
  ThemeData? baseTheme,
}) {
  final brightness = MediaQuery.platformBrightnessOf(context);

  final mtTheme = MTThemeData(
    colorScheme: colorScheme,
    typography: typography,
    sizing: sizing,
    breakpoints: breakpoints,
  );

  return baseTheme?.copyWith(
        extensions: [mtTheme],
      ) ??
      ThemeData(
        useMaterial3: true,
        brightness: brightness,
        colorScheme: ColorScheme.fromSeed(
          seedColor: CupertinoDynamicColor.resolve(colorScheme.mainColor, context),
          brightness: brightness,
        ),
        extensions: [mtTheme],
      );
}

/// Extension for convenient access to theme data
extension MTThemeExtension on BuildContext {
  /// Get the complete MT theme data
  MTThemeData get mtTheme => MTThemeData.of(this);

  /// Convenient getters for frequently used theme properties
  MTColorScheme get colorScheme => mtTheme.colorScheme;
  MTTypography get typography => mtTheme.typography;
  MTSizing get sizing => mtTheme.sizing;
  MTBreakpoints get breakpoints => mtTheme.breakpoints;
}
