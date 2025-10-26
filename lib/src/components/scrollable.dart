// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'base_scrollable.dart';
import 'scroll_behavior.dart';

/// A scrollable widget with dynamic shadows and status bar tap handling.
/// 
/// Refactored to use composition over inheritance for better maintainability.
/// 
/// ## Example
/// 
/// ```dart
/// MTScrollable(
///   scrollController: myScrollController,
///   scrollOffsetTop: 50.0,
///   bottomShadowOffset: 100.0,
///   onScrolled: (hasScrolled) => print('Top scrolled: $hasScrolled'),
///   onBottomScrolled: (hasScrolledToBottom) => print('Bottom scrolled: $hasScrolledToBottom'),
///   child: ListView(...),
/// )
/// ```

class MTScrollable extends BaseScrollableWidget {
  const MTScrollable({
    super.key,
    super.scrollController,
    required this.child,
    required this.scrollOffsetTop,
    this.topShadowPadding,
    this.topIndent,
    this.bottomShadowOffset = 0.0,
    super.onScrolled,
    super.onBottomScrolled,
  }) : super(
          config: ScrollBehaviorConfig(
            scrollOffsetTop: scrollOffsetTop,
            bottomShadowOffset: bottomShadowOffset,
            topShadowPadding: topShadowPadding,
            topIndent: topIndent,
          ),
        );

  final Widget child;
  final double scrollOffsetTop;
  final double? topShadowPadding;
  final double? topIndent;
  final double bottomShadowOffset;

  @override
  Widget buildScrollableContent(BuildContext context) {
    return child;
  }
}

/// Factory methods for common scroll configurations
extension MTScrollableFactory on MTScrollable {
  /// Create with top shadow only
  static MTScrollable topShadow({
    required Widget child,
    ScrollController? scrollController,
    double scrollOffsetTop = 50.0,
    Function(bool)? onScrolled,
  }) {
    return MTScrollable(
      scrollController: scrollController,
      scrollOffsetTop: scrollOffsetTop,
      onScrolled: onScrolled,
      child: child,
    );
  }

  /// Create with both shadows
  static MTScrollable withShadows({
    required Widget child,
    ScrollController? scrollController,
    double scrollOffsetTop = 50.0,
    double bottomShadowOffset = 100.0,
    Function(bool)? onScrolled,
    Function(bool)? onBottomScrolled,
  }) {
    return MTScrollable(
      scrollController: scrollController,
      scrollOffsetTop: scrollOffsetTop,
      bottomShadowOffset: bottomShadowOffset,
      onScrolled: onScrolled,
      onBottomScrolled: onBottomScrolled,
      child: child,
    );
  }

  /// Create for page with bottom bar
  static MTScrollable forPage({
    required Widget child,
    ScrollController? scrollController,
    double scrollOffsetTop = 50.0,
    double? topShadowPadding,
    Function(bool)? onScrolled,
    Function(bool)? onBottomScrolled,
  }) {
    return MTScrollable(
      scrollController: scrollController,
      scrollOffsetTop: scrollOffsetTop,
      bottomShadowOffset: 0.0, // Will be set by MTPage based on bottomBar height
      topShadowPadding: topShadowPadding,
      onScrolled: onScrolled,
      onBottomScrolled: onBottomScrolled,
      child: child,
    );
  }
}
