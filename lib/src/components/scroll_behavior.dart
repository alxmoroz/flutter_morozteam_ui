// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

/// Configuration for scroll behavior including shadows and status bar handling
class MTScrollConfig {
  const MTScrollConfig({
    this.topScrollOffset = 0.0,
    this.bottomScrollOffset = 0.0,
    this.topShadowPadding,
    this.topIndent,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeOut,
  });

  final double topScrollOffset;
  final double bottomScrollOffset;
  final double? topShadowPadding;
  final double? topIndent;
  final Duration animationDuration;
  final Curve animationCurve;

  MTScrollConfig copyWith({
    double? topScrollOffset,
    double? bottomScrollOffset,
    double? topShadowPadding,
    double? topIndent,
    Duration? animationDuration,
    Curve? animationCurve,
  }) {
    return MTScrollConfig(
      topScrollOffset: topScrollOffset ?? this.topScrollOffset,
      bottomScrollOffset: bottomScrollOffset ?? this.bottomScrollOffset,
      topShadowPadding: topShadowPadding ?? this.topShadowPadding,
      topIndent: topIndent ?? this.topIndent,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
    );
  }
}

/// Mixin that provides scroll behavior functionality for scrollable widgets.
///
/// This mixin handles scroll position tracking, shadow state management,
/// and callback triggering based on scroll offsets.
///
/// ## Usage
///
/// ```dart
/// class MyScrollableWidget extends StatefulWidget {
///   @override
///   State<MyScrollableWidget> createState() => _MyScrollableWidgetState();
/// }
///
/// class _MyScrollableWidgetState extends State<MyScrollableWidget> with MTScrollMixin {
///   @override
///   void initState() {
///     super.initState();
///     // Initialize scroll behavior
///   }
/// }
/// ```
mixin MTScrollMixin<T extends StatefulWidget> on State<T> {
  ScrollController? _scrollController;
  MTScrollConfig? _config;
  bool _hasScrolled = false;
  bool _hasScrolledToBottom = false;
  Function(bool)? _onTopScrolled;
  Function(bool)? _onBottomScrolled;

  ScrollController get scrollController => _scrollController!;
  MTScrollConfig get config => _config!;

  void initScrollBehavior({
    ScrollController? controller,
    required MTScrollConfig config,
    Function(bool)? onTopScrolled,
    Function(bool)? onBottomScrolled,
  }) {
    _scrollController = controller ?? ScrollController();
    _config = config;
    _onTopScrolled = onTopScrolled;
    _onBottomScrolled = onBottomScrolled;
    _scrollController!.addListener(_onScroll);
  }

  void disposeScrollBehavior() {
    _scrollController?.removeListener(_onScroll);
    // Only dispose if we created the controller
    if (_scrollController != null && !widget.toString().contains('scrollController')) {
      _scrollController!.dispose();
    }
  }

  void _onScroll() {
    if (!_scrollController!.hasClients) return;

    final offset = _scrollController!.offset;
    final maxScrollExtent = _scrollController!.position.maxScrollExtent;

    // Check top scroll offset
    final shouldShowTopShadow = offset >= _config!.topScrollOffset;
    if (_hasScrolled != shouldShowTopShadow) {
      setState(() {
        _hasScrolled = shouldShowTopShadow;
      });
      _onTopScrolled?.call(_hasScrolled);
    }

    // Check bottom scroll offset
    final shouldShowBottomShadow =
        _config!.bottomScrollOffset > 0 &&
        maxScrollExtent > 0 &&
        offset >= maxScrollExtent - _config!.bottomScrollOffset;
    if (_hasScrolledToBottom != shouldShowBottomShadow) {
      setState(() {
        _hasScrolledToBottom = shouldShowBottomShadow;
      });
      _onBottomScrolled?.call(_hasScrolledToBottom);
    }
  }

  void scrollToTop() {
    if (_scrollController!.hasClients) {
      _scrollController!.animateTo(
        0.0,
        duration: _config!.animationDuration,
        curve: _config!.animationCurve,
      );
    }
  }

  /// Check scroll position and trigger appropriate callbacks
  void checkScrollPosition() {
    if (_scrollController == null || _config == null) return;

    final offset = _scrollController!.position.pixels;
    final maxScrollExtent = _scrollController!.position.maxScrollExtent;

    // Check top scroll offset
    final shouldShowTopShadow = offset >= _config!.topScrollOffset;
    if (_hasScrolled != shouldShowTopShadow) {
      setState(() {
        _hasScrolled = shouldShowTopShadow;
      });
      _onTopScrolled?.call(_hasScrolled);
    }

    // Check bottom scroll offset
    final shouldShowBottomShadow =
        _config!.bottomScrollOffset > 0 &&
        maxScrollExtent > 0 &&
        offset >= maxScrollExtent - _config!.bottomScrollOffset;
    if (_hasScrolledToBottom != shouldShowBottomShadow) {
      setState(() {
        _hasScrolledToBottom = shouldShowBottomShadow;
      });
      _onBottomScrolled?.call(_hasScrolledToBottom);
    }
  }

  bool get hasScrolled => _hasScrolled;
  bool get hasScrolledToBottom => _hasScrolledToBottom;
}
