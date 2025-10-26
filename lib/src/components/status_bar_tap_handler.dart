// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

/// A widget that handles tap-to-scroll functionality for the status bar area.
/// 
/// When the user taps on the status bar area (top padding), it automatically
/// scrolls the provided ScrollController to the top with a smooth animation.
/// 
/// This is commonly used in custom page layouts where Scaffold is not used
/// but tap-to-scroll behavior is still desired. This provides the same
/// functionality that Scaffold provides by default.
/// 
/// ## Features
/// 
/// - Automatic detection of status bar area using MediaQuery.padding.top
/// - Smooth animated scroll to top with customizable duration and curve
/// - Transparent overlay that doesn't interfere with child widgets
/// - Safe handling of ScrollController state
/// 
/// ## Example
/// 
/// ```dart
/// StatusBarTapHandler(
///   scrollController: myScrollController,
///   child: ListView(
///     children: [...],
///   ),
/// )
/// ```
/// 
/// ## Customization
/// 
/// ```dart
/// StatusBarTapHandler(
///   scrollController: myScrollController,
///   animationDuration: Duration(milliseconds: 500),
///   animationCurve: Curves.easeInOut,
///   child: MyScrollableContent(),
/// )
/// ```
/// 
/// See also:
/// * [MTPage] for a complete page layout with built-in status bar handling
/// * [MTScrollable] for scrollable content with status bar handling
class StatusBarTapHandler extends StatelessWidget {
  const StatusBarTapHandler({
    super.key,
    required this.scrollController,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeOut,
  });

  /// The ScrollController to animate when status bar is tapped
  final ScrollController scrollController;
  
  /// The child widget to wrap
  final Widget child;
  
  /// Duration of the scroll animation
  final Duration animationDuration;
  
  /// Curve for the scroll animation
  final Curve animationCurve;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    
    return Stack(
      children: [
        child,
        // Add tap-to-scroll functionality for status bar area
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: mq.padding.top,
          child: GestureDetector(
            onTap: () {
              if (scrollController.hasClients) {
                scrollController.animateTo(
                  0.0,
                  duration: animationDuration,
                  curve: animationCurve,
                );
              }
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}