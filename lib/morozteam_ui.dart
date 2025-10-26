// Copyright (c) 2025. Alexandr Moroz

/// MorozTeam UI Kit
///
/// Universal UI kit for Flutter applications with flexible configuration system
/// for colors, typography and spacing.
///
/// ## Features
///
/// - 32 ready-to-use UI components
/// - Flexible theme system with customizable colors, typography, and spacing
/// - Built-in light/dark mode support
/// - Responsive design utilities
/// - Material Design 3 compliance
///
/// ## Quick Start
///
/// ```dart
/// import 'package:morozteam_ui/morozteam_ui.dart';
///
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Builder(
///       builder: (context) {
///         return MaterialApp(
///           theme: buildMTTheme(context),
///           home: MyHomePage(),
///         );
///       },
///     );
///   }
/// }
/// ```
///
/// See also:
/// * [buildMTTheme] for theme configuration
/// * [MTThemeData] for theme customization
library;

// ==================== COMPONENTS ====================
// Dialogs
export 'src/components/alert_dialog.dart';
// Media & Icons
export 'src/components/avatar.dart';
// Background
export 'src/components/background.dart';
// Buttons & Interactive
export 'src/components/button.dart';
export 'src/components/button_v2.dart';
export 'src/components/button_mixin.dart';
// Layout
export 'src/components/card.dart';
export 'src/components/checkbox.dart';
export 'src/components/circle.dart';
export 'src/components/circular_progress.dart';
export 'src/components/close_dialog_button.dart';
export 'src/components/dialog.dart';
export 'src/components/dialog_v2.dart';
export 'src/components/dialog_mixin.dart';
export 'src/components/divider.dart';
export 'src/components/dropdown.dart';
export 'src/components/field.dart';
export 'src/components/field_data.dart';
export 'src/components/icons.dart';
export 'src/components/images.dart';
// Lists & Navigation
export 'src/components/list_tile.dart';
// Progress & Loading
export 'src/components/loader.dart';
export 'src/components/page.dart';
export 'src/components/page_title.dart';
export 'src/components/phone_field.dart';
export 'src/components/progress.dart';
export 'src/components/refresh.dart';
// Scrolling & Refresh
export 'src/components/scrollable.dart';
export 'src/components/scrollable_centered.dart';
export 'src/components/scrollable_builder.dart';
export 'src/components/scrollable_v2.dart';
export 'src/components/page_v2.dart';
export 'src/components/shadowed.dart';
export 'src/components/status_bar_tap_handler.dart';
export 'src/components/scroll_behavior.dart';
export 'src/components/base_scrollable.dart';
export 'src/components/snackbar_dialog.dart';
// Form Components
export 'src/components/text_field.dart';
export 'src/components/toolbar.dart';
export 'src/components/toolbar_controller.dart';
export 'src/components/webview_dialog.dart';
// ==================== CONFIG ====================
export 'src/config/mt_breakpoints.dart';
export 'src/config/mt_color_scheme.dart';
export 'src/config/mt_sizing.dart';
// ==================== CONFIG ENUMS ====================
export 'src/config/mt_text_variant.dart';
export 'src/config/mt_theme.dart';
export 'src/config/mt_theme_data.dart';
export 'src/config/mt_typography.dart';
// ==================== THEME ====================
export 'src/theme/resolved_color.dart';
export 'src/theme/text.dart';
// ==================== UTILS ====================
export 'src/utils/adaptive.dart';
export 'src/utils/gesture.dart';
export 'src/utils/material_wrapper.dart';
export 'src/utils/md5.dart';
export 'src/utils/sizing_extensions.dart';
