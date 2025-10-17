// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/constants.dart';
import '../utils/adaptive.dart';
import 'page_title.dart';

/// Базовый класс для toolbar
abstract class MTAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MTAppBar({
    required this.isBottom,
    required this.color,
    this.pageTitle,
    this.parentPageTitle,
    this.leading,
    this.middle,
    this.trailing,
    this.bottomWidget,
    this.innerHeight,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.ignoreBottomInsets = true,
    this.fullScreen = false,
    super.key,
  });

  final bool isBottom;
  final Color color;
  final String? pageTitle;
  final String? parentPageTitle;
  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;
  final PreferredSizeWidget? bottomWidget;
  final double? innerHeight;
  final double topPadding;
  final double bottomPadding;
  final bool ignoreBottomInsets;
  final bool fullScreen;

  double get _innerHeight => innerHeight ?? constants.defBarHeight;

  @override
  Size get preferredSize => Size.fromHeight(
        topPadding + _innerHeight + (bottomWidget?.preferredSize.height ?? 0) + bottomPadding,
      );

  Widget? _leading(BuildContext context) {
    final navigator = Navigator.of(context);
    return leading ??
        (navigator.canPop()
            ? CupertinoNavigationBarBackButton(
                color: colors.mainColor.resolve(context),
                onPressed: () => navigator.pop(),
              )
            : null);
  }

  Widget _content(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if (middle != null) middle! else if (pageTitle != null) PageTitle(pageTitle!, parentPageTitle: parentPageTitle),
            Row(
              children: [
                if (_leading(context) != null) _leading(context)!,
                const Spacer(),
                if (trailing != null) trailing!,
              ],
            ),
          ],
        ),
        if (bottomWidget != null) bottomWidget!,
      ],
    );
  }

  @override
  Widget build(BuildContext context);
}

/// Верхний toolbar
class MTTopBar extends MTAppBar {
  const MTTopBar({
    super.key,
    super.pageTitle,
    super.parentPageTitle,
    super.leading,
    super.middle,
    super.trailing,
    super.bottomWidget,
    super.innerHeight,
    super.bottomPadding,
    super.fullScreen,
    Color? color,
  }) : super(
          isBottom: false,
          color: color ?? Colors.transparent,
          ignoreBottomInsets: true,
        );

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final mqPadding = mq.padding;
    final big = isBigScreen(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(color: color.resolve(context)),
        padding: EdgeInsets.only(
          top: max(mqPadding.top, topPadding),
          left: big ? mqPadding.left : 0,
          right: big ? mqPadding.right : 0,
          bottom: bottomPadding,
        ),
        height: preferredSize.height,
        child: _content(context),
      ),
    );
  }
}

/// Нижний toolbar
class MTBottomBar extends MTAppBar {
  const MTBottomBar({
    super.key,
    super.leading,
    super.middle,
    super.trailing,
    super.bottomWidget,
    super.innerHeight,
    super.topPadding,
    super.fullScreen,
    Color? color,
  }) : super(
          isBottom: true,
          color: color ?? Colors.transparent,
          pageTitle: null,
          parentPageTitle: null,
          ignoreBottomInsets: true,
        );

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final mqPadding = ignoreBottomInsets ? mq.viewPadding : mq.padding;
    final big = isBigScreen(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(color: color.resolve(context)),
        padding: EdgeInsets.only(
          top: topPadding,
          left: big ? mqPadding.left : 0,
          right: big ? mqPadding.right : 0,
          bottom: max(mqPadding.bottom, bottomPadding),
        ),
        height: preferredSize.height,
        child: _content(context),
      ),
    );
  }
}
