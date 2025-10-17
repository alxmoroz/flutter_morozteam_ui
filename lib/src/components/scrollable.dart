// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

import 'shadowed.dart';

/// Scrollable container with shadows
class MTScrollable extends StatefulWidget {
  const MTScrollable({
    required this.scrollController,
    required this.child,
    required this.scrollOffsetTop,
    this.topShadowPadding,
    this.topIndent,
    this.bottomShadow = false,
    this.onScrolled,
    super.key,
  });

  final ScrollController scrollController;
  final double scrollOffsetTop;
  final Widget child;
  final double? topShadowPadding;
  final double? topIndent;
  final bool bottomShadow;
  final Function(bool)? onScrolled;

  @override
  State<StatefulWidget> createState() => _MTScrollableState();
}

class _MTScrollableState extends State<MTScrollable> {
  bool _hasScrolled = false;

  void _onScrolled() {
    if (widget.onScrolled != null) {
      widget.onScrolled!(_hasScrolled);
    }
  }

  void _listener() {
    final triggerOffset = widget.scrollOffsetTop;
    final offset = widget.scrollController.offset;

    if ((!_hasScrolled && offset >= triggerOffset) || (_hasScrolled && offset <= triggerOffset)) {
      setState(() {
        _hasScrolled = !_hasScrolled;
        _onScrolled();
      });
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
      bottomShadow: widget.bottomShadow,
      topShadowPadding: widget.topShadowPadding,
      topIndent: widget.topIndent,
      child: PrimaryScrollController(
        controller: widget.scrollController,
        child: NotificationListener<ScrollMetricsNotification>(
          onNotification: (_) {
            _listener();
            return false;
          },
          child: widget.child,
        ),
      ),
    );
  }
}
