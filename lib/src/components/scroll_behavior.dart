// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

/// Configuration for scroll behavior including shadows and status bar handling
class ScrollBehaviorConfig {
  const ScrollBehaviorConfig({
    this.scrollOffsetTop = 0.0,
    this.bottomShadowOffset = 0.0,
    this.topShadowPadding,
    this.topIndent,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeOut,
  });

  final double scrollOffsetTop;
  final double bottomShadowOffset;
  final double? topShadowPadding;
  final double? topIndent;
  final Duration animationDuration;
  final Curve animationCurve;

  ScrollBehaviorConfig copyWith({
    double? scrollOffsetTop,
    double? bottomShadowOffset,
    double? topShadowPadding,
    double? topIndent,
    Duration? animationDuration,
    Curve? animationCurve,
  }) {
    return ScrollBehaviorConfig(
      scrollOffsetTop: scrollOffsetTop ?? this.scrollOffsetTop,
      bottomShadowOffset: bottomShadowOffset ?? this.bottomShadowOffset,
      topShadowPadding: topShadowPadding ?? this.topShadowPadding,
      topIndent: topIndent ?? this.topIndent,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
    );
  }
}

/// Mixin that provides scroll behavior functionality
mixin ScrollBehaviorMixin<T extends StatefulWidget> on State<T> {
  ScrollController? _scrollController;
  ScrollBehaviorConfig? _config;
  bool _hasScrolled = false;
  bool _hasScrolledToBottom = false;
  Function(bool)? _onScrolled;
  Function(bool)? _onBottomScrolled;

  ScrollController get scrollController => _scrollController!;
  ScrollBehaviorConfig get config => _config!;

  void initScrollBehavior({
    ScrollController? controller,
    required ScrollBehaviorConfig config,
    Function(bool)? onScrolled,
    Function(bool)? onBottomScrolled,
  }) {
    _scrollController = controller ?? ScrollController();
    _config = config;
    _onScrolled = onScrolled;
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

    // Check top shadow
    final shouldShowTopShadow = offset >= _config!.scrollOffsetTop;
    if (_hasScrolled != shouldShowTopShadow) {
      setState(() {
        _hasScrolled = shouldShowTopShadow;
      });
      _onScrolled?.call(_hasScrolled);
    }

    // Check bottom shadow
    final shouldShowBottomShadow = _config!.bottomShadowOffset > 0 &&
        maxScrollExtent > 0 &&
        offset >= maxScrollExtent - _config!.bottomShadowOffset;
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

  bool get hasScrolled => _hasScrolled;
  bool get hasScrolledToBottom => _hasScrolledToBottom;
}