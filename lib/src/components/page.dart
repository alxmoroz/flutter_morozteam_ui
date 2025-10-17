// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/constants.dart';
import '../utils/gesture.dart';
import '../utils/material_wrapper.dart';

/// Базовый виджет страницы
class MTPage extends StatelessWidget {
  const MTPage({
    super.key,
    this.navBar,
    required this.body,
    this.bottomBar,
    this.scrollController,
    this.backgroundColor,
  });

  final PreferredSizeWidget? navBar;
  final Widget body;
  final PreferredSizeWidget? bottomBar;
  final ScrollController? scrollController;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final mqPadding = mq.padding.copyWith(
      top: max(mq.padding.top, constants.defPageTopPadding),
      bottom: max(
        max(mq.viewPadding.bottom, mq.padding.bottom),
        constants.defPageBottomPadding,
      ),
    );

    final hasKB = mq.viewInsets.bottom > 0;
    final bottomBarHeight = bottomBar?.preferredSize.height ?? 0;

    return FocusDroppable(
      Container(
        decoration: BoxDecoration(
          color: (backgroundColor ?? colors.b2Color).resolve(context),
        ),
        child: material(
          PrimaryScrollController(
            controller: scrollController ?? ScrollController(),
            child: MediaQuery(
              data: mq.copyWith(padding: mqPadding),
              child: Stack(
                children: [
                  MediaQuery(
                    data: mq.copyWith(
                      padding: mqPadding.copyWith(
                        top: mqPadding.top + 
                            (navBar?.preferredSize.height ?? 0),
                        bottom: (hasKB ? 0 : mqPadding.bottom) +
                            mq.viewInsets.bottom +
                            bottomBarHeight,
                      ),
                    ),
                    child: SafeArea(
                      top: false,
                      bottom: false,
                      child: body,
                    ),
                  ),
                  if (navBar != null) navBar!,
                  if (bottomBar != null)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: bottomBar!,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
