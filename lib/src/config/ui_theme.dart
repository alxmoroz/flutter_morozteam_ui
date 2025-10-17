// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/widgets.dart';

import '../theme/colors.dart';
import '../theme/constants.dart';
import 'ui_config.dart';

/// Provider for initializing global colors and constants
class UIThemeProvider extends StatelessWidget {
  const UIThemeProvider({
    super.key,
    required this.config,
    required this.child,
  });

  final UIKitConfig config;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Initialize global colors and constants
    initializeUIKit(config);
    return child;
  }
}

/// Initialize global UI kit configuration
void initializeUIKit(UIKitConfig config) {
  // Initialize global colors and constants
  initializeColors(config);
  initializeConstants(config);
}
