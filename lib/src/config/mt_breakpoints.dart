// Copyright (c) 2025. Alexandr Moroz

/// Breakpoints configuration for MorozTeam UI Kit
class MTBreakpoints {
  const MTBreakpoints({
    this.xxsWidth = 290.0,
    this.xsWidth = 364.0,
    this.xsHeight = 480.0,
    this.sWidth = 480.0,
    this.sHeight = 640.0,
    this.mWidth = 640.0,
    this.mHeight = 860.0,
    this.lWidth = 760.0,
    this.xlWidth = 960.0,
    this.xxlWidth = 1280.0,
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
  MTBreakpoints copyWith({
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
    return MTBreakpoints(
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
    return other is MTBreakpoints &&
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
