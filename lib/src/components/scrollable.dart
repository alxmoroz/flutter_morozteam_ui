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
///   topScrollOffset: 50.0,
///   bottomScrollOffset: 100.0,
///   onTopScrolled: (hasScrolled) => print('Top scrolled: $hasScrolled'),
///   onBottomScrolled: (hasScrolledToBottom) => print('Bottom scrolled: $hasScrolledToBottom'),
///   child: ListView(...),
/// )
/// ```

class MTScrollable extends MTScrollableBase {
  const MTScrollable({
    super.key,
    super.scrollController,
    required this.child,
    required this.topScrollOffset,
    this.topShadowPadding,
    this.topIndent,
    this.bottomScrollOffset = 0.0,
    super.onTopScrolled,
    super.onBottomScrolled,
  }) : super(
         config: const MTScrollConfig(),
       );

  final Widget child;
  final double topScrollOffset;
  final double? topShadowPadding;
  final double? topIndent;
  final double bottomScrollOffset;

  Widget buildScrollableContent(BuildContext context) {
    return child;
  }

  @override
  MTScrollConfig get config => MTScrollConfig(
    topScrollOffset: topScrollOffset,
    bottomScrollOffset: bottomScrollOffset,
    topShadowPadding: topShadowPadding,
    topIndent: topIndent,
  );
}

/// Factory methods for common scroll configurations
extension MTScrollableFactory on MTScrollable {
  /// Create with top shadow only
  static MTScrollable topShadow({
    required Widget child,
    ScrollController? scrollController,
    double topScrollOffset = 50.0,
    Function(bool)? onTopScrolled,
  }) {
    return MTScrollable(
      scrollController: scrollController,
      topScrollOffset: topScrollOffset,
      onTopScrolled: onTopScrolled,
      child: child,
    );
  }

  /// Create with both shadows
  static MTScrollable withShadows({
    required Widget child,
    ScrollController? scrollController,
    double topScrollOffset = 50.0,
    double bottomScrollOffset = 100.0,
    Function(bool)? onTopScrolled,
    Function(bool)? onBottomScrolled,
  }) {
    return MTScrollable(
      scrollController: scrollController,
      topScrollOffset: topScrollOffset,
      bottomScrollOffset: bottomScrollOffset,
      onTopScrolled: onTopScrolled,
      onBottomScrolled: onBottomScrolled,
      child: child,
    );
  }

  /// Create for page with bottom bar
  static MTScrollable forPage({
    required Widget child,
    ScrollController? scrollController,
    double topScrollOffset = 50.0,
    double? topShadowPadding,
    Function(bool)? onTopScrolled,
    Function(bool)? onBottomScrolled,
  }) {
    return MTScrollable(
      scrollController: scrollController,
      topScrollOffset: topScrollOffset,
      bottomScrollOffset: 0.0, // Will be set by MTPage based on bottomBar height
      topShadowPadding: topShadowPadding,
      onTopScrolled: onTopScrolled,
      onBottomScrolled: onBottomScrolled,
      child: child,
    );
  }
}
