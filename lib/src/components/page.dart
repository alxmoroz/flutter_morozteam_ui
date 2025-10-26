// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';

import 'package:flutter/material.dart';

import '../config/mt_theme.dart';
import '../theme/resolved_color.dart';
import '../utils/adaptive.dart';
import '../utils/gesture.dart';
import '../utils/material_wrapper.dart';
import 'background.dart';
import 'scrollable.dart';
import 'status_bar_tap_handler.dart';

/// Base page widget with navigation bars and scrolling support
///
/// Provides a consistent page structure with optional navigation bars,
/// scrolling capabilities, and responsive layout.
///
/// ## Example
///
/// ```dart
/// MTPage(
///   navBar: MTNavBar(pageTitle: 'Home'),
///   body: ListView(children: [...]),
///   bottomBar: MTBottomBar(middle: NavigationWidget()),
///   onScrolled: (hasScrolled) => print('Top scrolled: $hasScrolled'),
///   onBottomScrolled: (hasScrolledToBottom) => print('Bottom scrolled: $hasScrolledToBottom'),
/// )
/// ```
///
/// See also:
/// * [MTNavBar] for top navigation
/// * [MTBottomBar] for bottom navigation
/// * [MTScrollable] for scrolling with shadows
class MTPage extends StatelessWidget {
  const MTPage({
    super.key,
    this.navBar,
    required this.body,
    this.bottomBar,
    this.leftBar,
    this.rightBar,
    this.scrollController,
    this.scrollOffsetTop,
    this.onTopScrolled,
    this.onBottomScrolled,
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
  final double? scrollOffsetTop;
  final Function(bool)? onTopScrolled;
  final Function(bool)? onBottomScrolled;

  Widget get _center {
    return material(
      Builder(
        builder: (ctx) {
          final mq = MediaQuery.of(ctx);
          final mqPadding = mq.padding.copyWith(
            top: max(mq.padding.top, ctx.sizing.pageTopPadding),
            bottom: max(max(mq.viewPadding.bottom, mq.padding.bottom), ctx.sizing.pageBottomPadding),
          );

          final hasKB = mq.viewInsets.bottom > 0;
          final big = isBigScreen(ctx);
          final scrollable = scrollOffsetTop != null && scrollController != null;
          final bottomBarHeight = bottomBar?.preferredSize.height ?? 0;

          return MTBackgroundWrapper(
            PrimaryScrollController(
              controller: scrollController ?? ScrollController(),
              child: MediaQuery(
                data: mq.copyWith(padding: mqPadding),
                child: StatusBarTapHandler(
                  scrollController: scrollController ?? ScrollController(),
                  child: Stack(
                    children: [
                      MediaQuery(
                        data: mq.copyWith(
                          padding: mqPadding.copyWith(
                            top: mqPadding.top + (big && scrollable ? scrollOffsetTop! : (navBar?.preferredSize.height ?? 0)),
                            bottom: (hasKB ? 0 : mqPadding.bottom) + mq.viewInsets.bottom + bottomBarHeight,
                          ),
                        ),
                        child: SafeArea(
                          top: false,
                          bottom: false,
                          child: scrollable
                              ? MTScrollable(
                                  scrollController: scrollController!,
                                  topScrollOffset: scrollOffsetTop!,
                                  bottomScrollOffset: bottomBarHeight,
                                  topShadowPadding: mqPadding.top + (navBar?.preferredSize.height ?? 0),
                                  onTopScrolled: onTopScrolled,
                                  onBottomScrolled: onBottomScrolled,
                                  child: body,
                                )
                              : body,
                        ),
                      ),
                      if (navBar != null) navBar!,
                      if (bottomBar != null) Align(alignment: Alignment.bottomCenter, child: bottomBar!),
                    ],
                  ),
                ),
              ),
            ),
            bg1Color: bg1Color,
            bg2Color: bg2Color,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final mqPadding = mq.padding;

    final hasLeftBar = leftBar != null;
    final hasRightBar = rightBar != null;

    return FocusDroppable(
      Container(
        decoration: BoxDecoration(color: context.colorScheme.b2Color.resolve(context)),
        child: Stack(
          children: [
            hasLeftBar || hasRightBar
                ? MediaQuery(
                    data: mq.copyWith(
                      padding: mqPadding.copyWith(
                        left: mqPadding.left + (leftBar?.preferredSize.width ?? 0),
                        right: mqPadding.right + (rightBar?.preferredSize.width ?? 0),
                      ),
                    ),
                    child: _center,
                  )
                : _center,
            if (hasLeftBar) leftBar!,
            if (hasRightBar) Align(alignment: Alignment.centerRight, child: rightBar!),
          ],
        ),
      ),
    );
  }
}
