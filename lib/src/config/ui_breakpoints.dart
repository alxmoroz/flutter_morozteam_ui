// Copyright (c) 2025. Alexandr Moroz

import '../theme/constants.dart';

/// Breakpoints configuration for UI Kit
class UIBreakpoints {
  const UIBreakpoints({
    this.xxsWidth = SCR_XXS_WIDTH,
    this.xsWidth = SCR_XS_WIDTH,
    this.xsHeight = SCR_XS_HEIGHT,
    this.sWidth = SCR_S_WIDTH,
    this.sHeight = SCR_S_HEIGHT,
    this.mWidth = SCR_M_WIDTH,
    this.mHeight = SCR_M_HEIGHT,
    this.lWidth = SCR_L_WIDTH,
    this.xlWidth = SCR_XL_WIDTH,
    this.xxlWidth = SCR_XXL_WIDTH,
  });

  // Breakpoints for responsiveness
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

  /// Create a copy of breakpoints configuration with modified parameters
  UIBreakpoints copyWith({
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
    return UIBreakpoints(
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UIBreakpoints &&
        other.xxsWidth == xxsWidth &&
        other.xsWidth == xsWidth &&
        other.xsHeight == xsHeight &&
        other.sWidth == sWidth &&
        other.sHeight == sHeight &&
        other.mWidth == mWidth &&
        other.mHeight == mHeight &&
        other.lWidth == lWidth &&
        other.xlWidth == xlWidth &&
        other.xxlWidth == xxlWidth;
  }

  @override
  int get hashCode {
    return Object.hash(
      xxsWidth,
      xsWidth,
      xsHeight,
      sWidth,
      sHeight,
      mWidth,
      mHeight,
      lWidth,
      xlWidth,
      xxlWidth,
    );
  }
}
