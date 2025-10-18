// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/widgets.dart';

import '../theme/constants.dart';
import 'ui_config.dart';

/// Provider for UI Kit configuration
class UIThemeProvider extends InheritedWidget {
  const UIThemeProvider({
    super.key,
    required this.config,
    required super.child,
  });

  final UIKitConfig config;

  @override
  bool updateShouldNotify(UIThemeProvider oldWidget) {
    return config != oldWidget.config;
  }

  static UIKitConfig of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<UIThemeProvider>();
    if (provider == null) {
      throw FlutterError(
        'UIThemeProvider not found in widget tree. Make sure to wrap your app with UIThemeProvider.',
      );
    }
    return provider.config;
  }
}

/// Initialize global UI kit configuration
void initializeUIKit(UIKitConfig config) {
  // Initialize global constants
  initializeConstants(config);
}

/// Extension for BuildContext for convenient access to config
extension UIConfigExtension on BuildContext {
  UIKitConfig get uiConfig => UIThemeProvider.of(this);
}
