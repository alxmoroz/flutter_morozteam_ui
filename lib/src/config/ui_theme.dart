// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/widgets.dart';

import 'ui_breakpoints.dart';
import 'ui_color_scheme.dart';
import 'ui_sizing.dart';
import 'ui_typography.dart';

/// Provider for UI Kit configuration
class UIThemeProvider extends StatelessWidget {
  const UIThemeProvider({
    super.key,
    this.colorScheme = const UIColorScheme(),
    this.typography = const UITypography(),
    this.sizing = const UISizing(),
    this.breakpoints = const UIBreakpoints(),
    required this.child,
  });

  final UIColorScheme colorScheme;
  final UITypography typography;
  final UISizing sizing;
  final UIBreakpoints breakpoints;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _InheritedUITheme(
      colorScheme: colorScheme,
      typography: typography,
      sizing: sizing,
      breakpoints: breakpoints,
      child: child,
    );
  }
}

class _InheritedUITheme extends InheritedWidget {
  const _InheritedUITheme({
    required this.colorScheme,
    required this.typography,
    required this.sizing,
    required this.breakpoints,
    required super.child,
  });

  final UIColorScheme colorScheme;
  final UITypography typography;
  final UISizing sizing;
  final UIBreakpoints breakpoints;

  static _InheritedUITheme of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<_InheritedUITheme>();
    if (result == null) {
      throw FlutterError(
        'UIThemeProvider not found in widget tree. Make sure to wrap your app with UIThemeProvider.',
      );
    }
    return result;
  }

  @override
  bool updateShouldNotify(_InheritedUITheme oldWidget) {
    return colorScheme != oldWidget.colorScheme ||
        typography != oldWidget.typography ||
        sizing != oldWidget.sizing ||
        breakpoints != oldWidget.breakpoints;
  }
}

/// Extension for BuildContext for convenient access to configuration
extension UIThemeExtension on BuildContext {
  UIColorScheme get colorScheme => _InheritedUITheme.of(this).colorScheme;
  UITypography get typography => _InheritedUITheme.of(this).typography;
  UISizing get sizing => _InheritedUITheme.of(this).sizing;
  UIBreakpoints get breakpoints => _InheritedUITheme.of(this).breakpoints;
}
