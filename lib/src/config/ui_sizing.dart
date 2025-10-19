// Copyright (c) 2025. Alexandr Moroz

import '../theme/constants.dart';

/// Sizing configuration for UI Kit
class UISizing {
  const UISizing({
    this.minButtonHeight = MIN_BTN_HEIGHT,
    this.defaultBarHeight = DEF_BAR_HEIGHT,
    this.tappableIconSize = DEF_TAPPABLE_ICON_SIZE,
    this.defaultBorderRadius = DEF_BORDER_RADIUS,
    this.buttonBorderRadius,
    this.cardElevation = 1.0,
    this.buttonElevation = 1.0,
  });

  // Sizes
  final double minButtonHeight;
  final double defaultBarHeight;
  final double tappableIconSize;

  // Border radius
  final double defaultBorderRadius;
  final double? buttonBorderRadius;

  // Elevation
  final double cardElevation;
  final double buttonElevation;

  /// Get button radius (default half of height)
  double get buttonRadius => buttonBorderRadius ?? (minButtonHeight / 2);

  /// Create a copy of sizing configuration with modified parameters
  UISizing copyWith({
    double? minButtonHeight,
    double? defaultBarHeight,
    double? tappableIconSize,
    double? defaultBorderRadius,
    double? buttonBorderRadius,
    double? cardElevation,
    double? buttonElevation,
  }) {
    return UISizing(
      minButtonHeight: minButtonHeight ?? this.minButtonHeight,
      defaultBarHeight: defaultBarHeight ?? this.defaultBarHeight,
      tappableIconSize: tappableIconSize ?? this.tappableIconSize,
      defaultBorderRadius: defaultBorderRadius ?? this.defaultBorderRadius,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
      cardElevation: cardElevation ?? this.cardElevation,
      buttonElevation: buttonElevation ?? this.buttonElevation,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UISizing &&
        other.minButtonHeight == minButtonHeight &&
        other.defaultBarHeight == defaultBarHeight &&
        other.tappableIconSize == tappableIconSize &&
        other.defaultBorderRadius == defaultBorderRadius &&
        other.buttonBorderRadius == buttonBorderRadius &&
        other.cardElevation == cardElevation &&
        other.buttonElevation == buttonElevation;
  }

  @override
  int get hashCode {
    return Object.hash(
      minButtonHeight,
      defaultBarHeight,
      tappableIconSize,
      defaultBorderRadius,
      buttonBorderRadius,
      cardElevation,
      buttonElevation,
    );
  }
}
