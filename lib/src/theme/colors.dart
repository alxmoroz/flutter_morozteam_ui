// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

import '../config/ui_config.dart';

/// Extension for Color with CupertinoDynamicColor support
extension ResolvedColor on Color {
  Color resolve(BuildContext context) => CupertinoDynamicColor.resolve(this, context);
}

/// Class for working with UI Kit colors
class UIColors {
  const UIColors(this.config);

  final UIKitConfig config;

  /// Background colors (b0 - darkest, b3 - lightest)
  Color get b0Color => config.b0Color;
  Color get b1Color => config.b1Color;
  Color get b2Color => config.b2Color;
  Color get b3Color => config.b3Color;

  /// Text colors (f1 - primary, f3 - lightest)
  Color get f1Color => config.f1Color;
  Color get f2Color => config.f2Color;
  Color get f3Color => config.f3Color;

  /// Accent colors
  Color get mainColor => config.mainColor;
  Color get dangerColor => config.dangerColor;
  Color get safeColor => config.safeColor ?? config.mainColor;
  Color get warningColor => config.warningColor ?? config.dangerColor;

  /// Special colors
  Color get mainBtnTitleColor => config.mainBtnTitleColor ?? config.b2Color;
  Color get navbarColor => config.navbarColor ?? const Color.fromARGB(0, 255, 255, 255);
  Color get defaultBarrierColor => config.defaultBarrierColor ?? config.b1Color;

  /// White color (for icons and text on colored background)
  Color get whiteColor => const Color(0xFFFFFFFF);

  /// Static colors for compatibility
  Color get grayColor => const Color(0xFFEEEEEE);
  Color get black40Color => const Color(0xFF999999);
  Color get grayColorDark => const Color(0xFF666666);
  Color get black40ColorDark => const Color(0xFF222222);
  Color get blackColor => const Color(0xFF010101);
}

/// Global colors instance (will be initialized when setting up theme)
UIColors? _globalColors;

/// Initialize global colors
void initializeColors(UIKitConfig config) {
  _globalColors = UIColors(config);
}

/// Get global colors
UIColors get colors {
  if (_globalColors == null) {
    throw FlutterError(
      'UIColors not initialized. Make sure to wrap your app with UIThemeProvider.',
    );
  }
  return _globalColors!;
}

/// Extension for BuildContext for convenient access to colors
extension UIColorsExtension on BuildContext {
  UIColors get uiColors => colors;
}
