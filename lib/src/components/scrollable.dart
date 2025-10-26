// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'shadowed.dart';

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
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MTScrollable> {
  bool _hasScrolled = false;

  void _listener() {
    // Check that controller is attached to scroll widget
    if (!widget.scrollController.hasClients) {
      return;
    }

    final triggerOffset = widget.scrollOffsetTop;
    final offset = widget.scrollController.offset;

    if ((!_hasScrolled && offset >= triggerOffset) || (_hasScrolled && offset <= triggerOffset)) {
      setState(() {
        _hasScrolled = !_hasScrolled;
        if (widget.onScrolled != null) {
          widget.onScrolled!(_hasScrolled);
        }
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
    final mq = MediaQuery.of(context);
    
    return MTShadowed(
      topShadow: _hasScrolled,
      bottomShadow: widget.bottomShadow,
      topShadowPadding: widget.topShadowPadding,
      topIndent: widget.topIndent,
      child: PrimaryScrollController(
        controller: widget.scrollController,
        child: Stack(
          children: [
            NotificationListener<ScrollMetricsNotification>(
              onNotification: (_) {
                _listener();
                return false;
              },
              child: widget.child,
            ),
            // Add tap-to-scroll functionality for status bar area
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: mq.padding.top,
              child: GestureDetector(
                onTap: () {
                  if (widget.scrollController.hasClients) {
                    widget.scrollController.animateTo(
                      0.0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
