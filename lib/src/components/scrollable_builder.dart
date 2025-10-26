// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'base_scrollable.dart';

/// A builder widget that provides scroll behavior to its children
/// 
/// Useful when you need scroll behavior but don't want to wrap in a specific widget.
/// 
/// ## Example
/// 
/// ```dart
/// ScrollableBuilder(
///   scrollController: myController,
///   config: ScrollBehaviorConfig(scrollOffsetTop: 50.0),
///   builder: (context, scrollBehavior) {
///     return Column(
///       children: [
///         if (scrollBehavior.hasScrolled) MyAppBar(),
///         MyContent(),
///         if (scrollBehavior.hasScrolledToBottom) MyBottomBar(),
///       ],
///     );
///   },
/// )
/// ```
class ScrollableBuilder extends BaseScrollableWidget {
  const ScrollableBuilder({
    super.key,
    super.scrollController,
    super.config,
    super.onScrolled,
    required this.builder,
  });

  final Widget Function(BuildContext context, _BaseScrollableWidgetState scrollBehavior) builder;

  @override
  Widget buildScrollableContent(BuildContext context) {
    return builder(context, this as _BaseScrollableWidgetState);
  }
}