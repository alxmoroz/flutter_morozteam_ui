// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'shadowed.dart';
import 'status_bar_tap_handler.dart';
import 'scroll_behavior.dart';

/// Base scrollable widget that provides common scroll functionality
abstract class BaseScrollableWidget extends StatefulWidget {
  const BaseScrollableWidget({
    super.key,
    this.scrollController,
    this.config = const ScrollBehaviorConfig(),
    this.onScrolled,
    this.onBottomScrolled,
  });

  final ScrollController? scrollController;
  final ScrollBehaviorConfig config;
  final Function(bool)? onScrolled;
  final Function(bool)? onBottomScrolled;

  @override
  State<BaseScrollableWidget> createState() => _BaseScrollableWidgetState();
}

class _BaseScrollableWidgetState extends State<BaseScrollableWidget>
    with ScrollBehaviorMixin {
  @override
  void initState() {
    super.initState();
    initScrollBehavior(
      controller: widget.scrollController,
      config: widget.config,
      onScrolled: widget.onScrolled,
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
              _onScroll();
              return false;
            },
            child: buildScrollableContent(context),
          ),
        ),
      ),
    );
  }

  /// Override this method to provide the scrollable content
  Widget buildScrollableContent(BuildContext context);
}