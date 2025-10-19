// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// Sizing configuration for UI Kit
class UISizing {
  const UISizing({
    this.baseSpacingUnit = 4.0,
    this.minButtonHeight = 48.0,
    this.defaultBarHeight = 48.0,
    this.tappableIconSize,
    this.defaultBorderRadius = 12.0,
    this.buttonBorderRadius,
    this.cardElevation = 1.0,
    this.buttonElevation = 1.0,
  });

  final double baseSpacingUnit;
  final double minButtonHeight;
  final double defaultBarHeight;
  final double? tappableIconSize;
  final double defaultBorderRadius;
  final double? buttonBorderRadius;
  final double cardElevation;
  final double buttonElevation;

  // Публичные семантические геттеры
  double get horizontalPadding => baseSpacingUnit * 5; // 20px (было DEF_HP)
  double get verticalPadding => baseSpacingUnit * 3; // 12px (было DEF_VP)
  double get smallSpacing => baseSpacingUnit * 2; // 8px (было P)
  double get mediumSpacing => baseSpacingUnit * 4; // 16px (было P4)
  double get largeSpacing => baseSpacingUnit * 6; // 24px (было P6)
  double get pageTopPadding => baseSpacingUnit * 5; // 20px (было DEF_PAGE_TOP_PADDING)
  double get pageBottomPadding => baseSpacingUnit * 8; // 32px (было DEF_PAGE_BOTTOM_PADDING)
  double get dialogBottomPadding => baseSpacingUnit * 5; // 20px (было DEF_DIALOG_BOTTOM_PADDING)
  double get borderWidth => baseSpacingUnit * 0.5; // 2px (было P_2)
  double get defaultIconSize => baseSpacingUnit * 6; // 24px (было DEF_ICON_SIZE)
  double get loadingIconSize => baseSpacingUnit * 4; // 16px (было DEF_LOADING_ICON_SIZE)
  double get progressSize => baseSpacingUnit * 9; // 36px (было DEF_PROGRESS_SIZE)
  double get maxAvatarRadius => baseSpacingUnit * 16; // 64px (было MAX_AVATAR_RADIUS)

  // Tappable icon size with web fallback
  double get effectiveTappableIconSize => tappableIconSize ?? (kIsWeb ? baseSpacingUnit * 8 : baseSpacingUnit * 9);

  EdgeInsets get defaultPadding => EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      );

  EdgeInsets get defaultMargin => EdgeInsets.fromLTRB(
        horizontalPadding,
        verticalPadding,
        horizontalPadding,
        0,
      );

  EdgeInsets get smallPadding => EdgeInsets.all(smallSpacing);

  double get buttonRadius => buttonBorderRadius ?? (minButtonHeight / 2);

  /// Create a copy of sizing configuration with modified parameters
  UISizing copyWith({
    double? baseSpacingUnit,
    double? minButtonHeight,
    double? defaultBarHeight,
    double? tappableIconSize,
    double? defaultBorderRadius,
    double? buttonBorderRadius,
    double? cardElevation,
    double? buttonElevation,
  }) {
    return UISizing(
      baseSpacingUnit: baseSpacingUnit ?? this.baseSpacingUnit,
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
        other.baseSpacingUnit == baseSpacingUnit &&
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
      baseSpacingUnit,
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
