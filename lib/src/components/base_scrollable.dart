// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import 'scroll_behavior.dart';
import 'shadowed.dart';
import 'status_bar_tap_handler.dart';

/// Base scrollable widget that provides common scroll functionality
abstract class MTScrollableBase extends StatefulWidget {
  const MTScrollableBase({
    super.key,
    this.scrollController,
    this.config = const MTScrollConfig(),
    this.onTopScrolled,
    this.onBottomScrolled,
  });

  final ScrollController? scrollController;
  final MTScrollConfig config;
  final Function(bool)? onTopScrolled;
  final Function(bool)? onBottomScrolled;

  @override
  State<MTScrollableBase> createState() => _MTScrollableBaseState();
}

class _MTScrollableBaseState extends State<MTScrollableBase> with MTScrollMixin {
  @override
  void initState() {
    super.initState();
    initScrollBehavior(
      controller: widget.scrollController,
      config: widget.config,
      onTopScrolled: widget.onTopScrolled,
      onBottomScrolled: widget.onBottomScrolled,
    );
  }

  @override
  void dispose() {
    disposeScrollBehavior();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MTShadowed(
      topShadow: hasScrolled,
      bottomShadow: hasScrolledToBottom,
      topShadowPadding: config.topShadowPadding,
      topIndent: config.topIndent,
      child: PrimaryScrollController(
        controller: scrollController,
        child: StatusBarTapHandler(
          scrollController: scrollController,
          animationDuration: config.animationDuration,
          animationCurve: config.animationCurve,
          child: NotificationListener<ScrollMetricsNotification>(
            onNotification: (_) {
              if (mounted) {
                checkScrollPosition();
              }
              return false;
            },
            child: buildScrollableContent(context),
          ),
        ),
      ),
    );
  }

  /// Override this method to provide the scrollable content
  Widget buildScrollableContent(BuildContext context) {
    throw UnimplementedError('buildScrollableContent must be implemented by subclasses');
  }
}
