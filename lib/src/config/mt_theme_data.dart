// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import 'mt_breakpoints.dart';
import 'mt_color_scheme.dart';
import 'mt_sizing.dart';
import 'mt_typography.dart';

/// Main theme data class for MorozTeam UI Kit
/// 
/// This class extends ThemeExtension to integrate with Flutter's theme system.
/// It contains all configuration needed for the UI kit: colors, typography,
/// sizing, and breakpoints.
class MTThemeData extends ThemeExtension<MTThemeData> {
  /// Color scheme for the UI kit
  final MTColorScheme colorScheme;
  
  /// Typography configuration
  final MTTypography typography;
  
  /// Sizing and spacing configuration
  final MTSizing sizing;
  
  /// Breakpoints for responsive design
  final MTBreakpoints breakpoints;

  const MTThemeData({
    required this.colorScheme,
    required this.typography,
    required this.sizing,
    required this.breakpoints,
  });

  /// Factory constructor with default values
  factory MTThemeData.defaults() => const MTThemeData(
    colorScheme: MTColorScheme(),
    typography: MTTypography(),
    sizing: MTSizing(),
    breakpoints: MTBreakpoints(),
  );

  @override
  MTThemeData copyWith({
    MTColorScheme? colorScheme,
    MTTypography? typography,
    MTSizing? sizing,
    MTBreakpoints? breakpoints,
  }) {
    return MTThemeData(
      colorScheme: colorScheme ?? this.colorScheme,
      typography: typography ?? this.typography,
      sizing: sizing ?? this.sizing,
      breakpoints: breakpoints ?? this.breakpoints,
    );
  }

  @override
  MTThemeData lerp(ThemeExtension<MTThemeData>? other, double t) {
    if (other is! MTThemeData) return this;
    
    // For non-color data, use threshold-based lerp
    return MTThemeData(
      colorScheme: t < 0.5 ? colorScheme : other.colorScheme,
      typography: t < 0.5 ? typography : other.typography,
      sizing: t < 0.5 ? sizing : other.sizing,
      breakpoints: t < 0.5 ? breakpoints : other.breakpoints,
    );
  }

  /// Static getter for convenient access to theme data
  static MTThemeData of(BuildContext context) {
    final theme = Theme.of(context).extension<MTThemeData>();
    if (theme == null) {
      throw FlutterError(
        'MTThemeData not found. Make sure to add MTThemeData to your ThemeData.extensions',
      );
    }
    return theme;
  }
}
