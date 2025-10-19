// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// Sizing configuration for MorozTeam UI Kit
class MTSizing {
  const MTSizing({
    this.p = 4.0,
    this.minButtonHeight = 48.0,
    this.defBarHeight = 48.0,
    this.tappableIconSize,
    this.defBorderRadius = 12.0,
    this.buttonBorderRadius,
    this.cardElevation = 1.0,
    this.buttonElevation = 1.0,
  });

  final double p;
  final double minButtonHeight;
  final double defBarHeight;
  final double? tappableIconSize;
  final double defBorderRadius;
  final double? buttonBorderRadius;
  final double cardElevation;
  final double buttonElevation;

  // Public semantic getters
  double get hPadding => p * 5; // 20px
  double get vPadding => p * 3; // 12px
  double get smallSpacing => p * 2; // 8px
  double get mediumSpacing => p * 4; // 16px
  double get largeSpacing => p * 6; // 24px
  double get pageTopPadding => p * 5; // 20px
  double get pageBottomPadding => p * 8; // 32px
  double get dialogBottomPadding => p * 5; // 20px
  double get borderWidth => p * 0.5; // 2px
  double get defaultIconSize => p * 6; // 24px
  double get loadingIconSize => p * 4; // 16px
  double get progressSize => p * 9; // 36px
  double get maxAvatarRadius => p * 16; // 64px

  // Tappable icon size with web fallback
  double get effectiveTappableIconSize => tappableIconSize ?? (kIsWeb ? p * 8 : p * 9);

  EdgeInsets get defPadding => EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding);

  EdgeInsets get defMargin => EdgeInsets.fromLTRB(hPadding, vPadding, hPadding, 0);

  EdgeInsets get smallPadding => EdgeInsets.all(smallSpacing);

  double get buttonRadius => buttonBorderRadius ?? (minButtonHeight / 2);

  /// Create a copy of sizing configuration with modified parameters
  MTSizing copyWith({
    double? baseSpacingUnit,
    double? minButtonHeight,
    double? defaultBarHeight,
    double? tappableIconSize,
    double? defaultBorderRadius,
    double? buttonBorderRadius,
    double? cardElevation,
    double? buttonElevation,
  }) {
    return MTSizing(
      p: baseSpacingUnit ?? p,
      minButtonHeight: minButtonHeight ?? this.minButtonHeight,
      defBarHeight: defaultBarHeight ?? defBarHeight,
      tappableIconSize: tappableIconSize ?? this.tappableIconSize,
      defBorderRadius: defaultBorderRadius ?? defBorderRadius,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
      cardElevation: cardElevation ?? this.cardElevation,
      buttonElevation: buttonElevation ?? this.buttonElevation,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MTSizing &&
        other.p == p &&
        other.minButtonHeight == minButtonHeight &&
        other.defBarHeight == defBarHeight &&
        other.tappableIconSize == tappableIconSize &&
        other.defBorderRadius == defBorderRadius &&
        other.buttonBorderRadius == buttonBorderRadius &&
        other.cardElevation == cardElevation &&
        other.buttonElevation == buttonElevation;
  }

  @override
  int get hashCode {
    return Object.hash(
      p,
      minButtonHeight,
      defBarHeight,
      tappableIconSize,
      defBorderRadius,
      buttonBorderRadius,
      cardElevation,
      buttonElevation,
    );
  }
}
