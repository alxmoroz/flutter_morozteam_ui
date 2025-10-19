// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../config/mt_theme.dart';
import '../theme/resolved_color.dart';
import '../utils/adaptive.dart';
import 'close_dialog_button.dart';
import 'page_title.dart';
import 'toolbar_controller.dart';

// Const color constant for use in const constructors
const _navbarColor = CupertinoDynamicColor.withBrightness(
  color: Color.fromARGB(0, 255, 255, 255),
  darkColor: Color.fromARGB(0, 0, 0, 0),
);

class _ToolbarContent extends StatelessWidget {
  const _ToolbarContent({
    this.pageTitle,
    this.parentPageTitle,
    this.leading,
    this.middle,
    this.bottom,
    this.trailing,
  });
  final String? pageTitle;
  final String? parentPageTitle;
  final Widget? leading;
  final Widget? middle;
  final Widget? bottom;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if (middle != null) middle! else if (pageTitle != null) PageTitle(pageTitle!, parentPageTitle: parentPageTitle),
            Row(children: [
              if (leading != null) leading!,
              const Spacer(),
              if (trailing != null) trailing!,
            ]),
          ],
        ),
        if (bottom != null) bottom!,
      ],
    );
  }
}

abstract class _MTAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MTAppBar({
    required this.isBottom,
    this.color,
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
    this.toolbarController,
    super.key,
  });

  final bool isBottom;
  final Color? color;

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
  final MTToolbarController? toolbarController;

  @override
  Size get preferredSize => Size.fromHeight(toolbarController != null
      ? toolbarController!.height ?? 0
      : (topPadding + (innerHeight ?? 48.0) + (bottomWidget?.preferredSize.height ?? 0) + bottomPadding));

  Widget? _leading(BuildContext context) {
    final navigator = Navigator.of(context);
    return leading ??
        (!isBottom && navigator.canPop()
            ? fullScreen
                ? CupertinoNavigationBarBackButton(previousPageTitle: '', onPressed: navigator.pop)
                : const MTCloseDialogButton()
            : null);
  }

  @override
  Widget build(BuildContext context) {
    final mqPadding = MediaQuery.paddingOf(context);
    final big = isBigScreen(context);

    final bottomInsets = ignoreBottomInsets ? 0.0 : MediaQuery.viewInsetsOf(context).bottom;

    final h = (isBottom ? max(bottomInsets, mqPadding.bottom) : mqPadding.top) + preferredSize.height;
    final flat = !fullScreen || big || isBottom;
    final leading = _leading(context);

    final toolbarContent = _ToolbarContent(
      pageTitle: pageTitle,
      parentPageTitle: parentPageTitle,
      leading: leading,
      middle: middle,
      trailing: trailing,
      bottom: bottomWidget,
    );

    return Container(
      height: h,
      color: flat ? (color ?? context.colorScheme.barColor).resolve(context) : null,
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: flat
          ? SafeArea(
              top: !isBottom,
              bottom: isBottom,
              child: toolbarContent,
            )
          : CupertinoNavigationBar(
              automaticallyImplyLeading: false,
              automaticallyImplyMiddle: false,
              padding: EdgeInsetsDirectional.only(top: topPadding, bottom: bottomPadding, start: 0, end: 0),
              leading: OverflowBox(
                maxHeight: preferredSize.height,
                child: _ToolbarContent(
                  leading: leading,
                  pageTitle: pageTitle,
                  parentPageTitle: parentPageTitle,
                  middle: middle,
                  trailing: trailing,
                ),
              ),
              bottom: bottomWidget,
              backgroundColor: (color ?? context.colorScheme.barColor).resolve(context),
              border: null,
            ),
    );
  }
}

class MTTopBar extends _MTAppBar {
  const MTTopBar({
    super.pageTitle,
    super.parentPageTitle,
    super.leading,
    super.middle,
    super.trailing,
    super.topPadding,
    super.bottomPadding,
    super.bottomWidget,
    super.color,
    super.innerHeight,
    super.fullScreen,
    super.key,
  }) : super(isBottom: false);
}

class MTNavBar extends MTTopBar {
  const MTNavBar({
    super.leading,
    super.pageTitle,
    super.parentPageTitle,
    super.middle,
    super.trailing,
    super.bottomPadding,
    super.bottomWidget,
    super.color = _navbarColor,
    super.innerHeight,
    super.key,
  }) : super(fullScreen: true);
}

class MTBottomBar extends _MTAppBar {
  const MTBottomBar({
    super.leading,
    super.middle,
    super.trailing,
    super.bottomWidget,
    super.color,
    super.innerHeight,
    super.bottomPadding,
    super.ignoreBottomInsets,
    super.toolbarController,
    super.key,
  }) : super(isBottom: true, topPadding: 12.0);
}
