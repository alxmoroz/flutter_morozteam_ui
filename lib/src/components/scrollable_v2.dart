// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'base_scrollable.dart';

/// A scrollable widget with dynamic shadows and status bar tap handling.
/// 
/// Simplified version using composition over inheritance.
class MTScrollableV2 extends BaseScrollableWidget {
  const MTScrollableV2({
    super.key,
    super.scrollController,
    super.config,
    super.onScrolled,
    required this.child,
  });

  final Widget child;

  @override
  Widget buildScrollableContent(BuildContext context) {
    return child;
  }
}

/// Factory methods for common scroll configurations
extension MTScrollableV2Factory on MTScrollableV2 {
  /// Create with top shadow only
  static MTScrollableV2 topShadow({
    required Widget child,
    ScrollController? scrollController,
    double scrollOffsetTop = 50.0,
    Function(bool)? onScrolled,
  }) {
    return MTScrollableV2(
      scrollController: scrollController,
      config: ScrollBehaviorConfig(scrollOffsetTop: scrollOffsetTop),
      onScrolled: onScrolled,
      child: child,
    );
  }

  /// Create with both shadows
  static MTScrollableV2 withShadows({
    required Widget child,
    ScrollController? scrollController,
    double scrollOffsetTop = 50.0,
    double bottomShadowOffset = 100.0,
    Function(bool)? onScrolled,
  }) {
    return MTScrollableV2(
      scrollController: scrollController,
      config: ScrollBehaviorConfig(
        scrollOffsetTop: scrollOffsetTop,
        bottomShadowOffset: bottomShadowOffset,
      ),
      onScrolled: onScrolled,
      child: child,
    );
  }

  /// Create for page with bottom bar
  static MTScrollableV2 forPage({
    required Widget child,
    ScrollController? scrollController,
    double scrollOffsetTop = 50.0,
    double bottomBarHeight = 0.0,
    Function(bool)? onScrolled,
  }) {
    return MTScrollableV2(
      scrollController: scrollController,
      config: ScrollBehaviorConfig(
        scrollOffsetTop: scrollOffsetTop,
        bottomShadowOffset: bottomBarHeight,
      ),
      onScrolled: onScrolled,
      child: child,
    );
  }
}