// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';
import 'package:flutter/material.dart';
import '../config/mt_theme.dart';
import '../theme/resolved_color.dart';
import '../utils/adaptive.dart';
import '../utils/gesture.dart';
import '../utils/material_wrapper.dart';
import 'background.dart';
import 'scrollable_v2.dart';

/// Simplified page widget with better separation of concerns
class MTPageV2 extends StatelessWidget {
  const MTPageV2({
    super.key,
    this.navBar,
    required this.body,
    this.bottomBar,
    this.leftBar,
    this.rightBar,
    this.scrollController,
    this.scrollConfig = const ScrollBehaviorConfig(),
    this.onScrolled,
    this.bg1Color,
    this.bg2Color,
  });

  final PreferredSizeWidget? leftBar;
  final PreferredSizeWidget? rightBar;
  final PreferredSizeWidget? navBar;
  final Widget body;
  final PreferredSizeWidget? bottomBar;
  final Color? bg1Color;
  final Color? bg2Color;

  final ScrollController? scrollController;
  final ScrollBehaviorConfig scrollConfig;
  final Function(bool)? onScrolled;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final mqPadding = mq.padding;
    final bottomBarHeight = bottomBar?.preferredSize.height ?? 0;

    return FocusDroppable(
      Container(
        decoration: BoxDecoration(color: context.colorScheme.b2Color.resolve(context)),
        child: Stack(
          children: [
            _buildContent(context, mq, mqPadding, bottomBarHeight),
            if (navBar != null) navBar!,
            if (bottomBar != null) Align(alignment: Alignment.bottomCenter, child: bottomBar!),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    MediaQueryData mq,
    EdgeInsets mqPadding,
    double bottomBarHeight,
  ) {
    final hasLeftBar = leftBar != null;
    final hasRightBar = rightBar != null;
    final hasScrollBehavior = scrollConfig.scrollOffsetTop > 0 || scrollConfig.bottomShadowOffset > 0;

    Widget content = hasScrollBehavior
        ? MTScrollableV2.forPage(
            scrollController: scrollController,
            scrollOffsetTop: scrollConfig.scrollOffsetTop,
            bottomBarHeight: bottomBarHeight,
            onScrolled: onScrolled,
            child: body,
          )
        : body;

    if (hasLeftBar || hasRightBar) {
      content = MediaQuery(
        data: mq.copyWith(
          padding: mqPadding.copyWith(
            left: mqPadding.left + (leftBar?.preferredSize.width ?? 0),
            right: mqPadding.right + (rightBar?.preferredSize.width ?? 0),
          ),
        ),
        child: content,
      );
    }

    return MTBackgroundWrapper(
      bg1Color: bg1Color,
      bg2Color: bg2Color,
      child: content,
    );
  }
}