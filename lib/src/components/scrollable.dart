// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'shadowed.dart';
import 'status_bar_tap_handler.dart';

/// A scrollable widget with dynamic shadows and status bar tap handling.
/// 
/// Provides scrolling functionality with automatic shadow management:
/// - Top shadow appears when scrolled past [scrollOffsetTop]
/// - Bottom shadow appears when scrolled near the bottom (if [bottomShadowOffset] > 0)
/// - Status bar tap to scroll to top functionality
/// - Callbacks for both top and bottom scroll states
/// 
/// ## Example
/// 
/// ```dart
/// MTScrollable(
///   scrollController: myScrollController,
///   scrollOffsetTop: 50.0,
///   bottomShadowOffset: 100.0, // Show shadow when 100px from bottom
///   onScrolled: (hasScrolled) => print('Top scrolled: $hasScrolled'),
///   onBottomScrolled: (hasScrolledToBottom) => print('Bottom scrolled: $hasScrolledToBottom'),
///   child: ListView(...),
/// )
/// ```

class MTScrollable extends StatefulWidget {
  const MTScrollable({
    required this.scrollController,
    required this.child,
    required this.scrollOffsetTop,
    this.topShadowPadding,
    this.topIndent,
    this.bottomShadowOffset = 0.0,
    this.onScrolled,
    this.onBottomScrolled,
    super.key,
  });

  final ScrollController scrollController;
  final double scrollOffsetTop;
  final Widget child;
  final double? topShadowPadding;
  final double? topIndent;
  final double bottomShadowOffset;
  final Function(bool)? onScrolled;
  final Function(bool)? onBottomScrolled;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MTScrollable> {
  bool _hasScrolled = false;
  bool _hasScrolledToBottom = false;

  void _listener() {
    // Check that controller is attached to scroll widget
    if (!widget.scrollController.hasClients) {
      return;
    }

    final triggerOffset = widget.scrollOffsetTop;
    final offset = widget.scrollController.offset;
    final maxScrollExtent = widget.scrollController.position.maxScrollExtent;
    
    // Check top shadow
    final shouldShowTopShadow = offset >= triggerOffset;
    if (_hasScrolled != shouldShowTopShadow) {
      setState(() {
        _hasScrolled = shouldShowTopShadow;
      });
    }
    
    // Check bottom shadow (only if bottomShadowOffset > 0)
    final shouldShowBottomShadow = widget.bottomShadowOffset > 0 && 
        maxScrollExtent > 0 && 
        offset >= maxScrollExtent - widget.bottomShadowOffset;
    if (_hasScrolledToBottom != shouldShowBottomShadow) {
      setState(() {
        _hasScrolledToBottom = shouldShowBottomShadow;
      });
    }
    
    // Call onScrolled callback
    if (widget.onScrolled != null) {
      widget.onScrolled!(_hasScrolled);
    }
    
    // Call onBottomScrolled callback
    if (widget.onBottomScrolled != null) {
      widget.onBottomScrolled!(_hasScrolledToBottom);
    }
  }

  @override
  void initState() {
    widget.scrollController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MTShadowed(
      topShadow: _hasScrolled,
      bottomShadow: _hasScrolledToBottom,
      topShadowPadding: widget.topShadowPadding,
      topIndent: widget.topIndent,
      child: PrimaryScrollController(
        controller: widget.scrollController,
        child: StatusBarTapHandler(
          scrollController: widget.scrollController,
          child: NotificationListener<ScrollMetricsNotification>(
            onNotification: (_) {
              _listener();
              return false;
            },
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
