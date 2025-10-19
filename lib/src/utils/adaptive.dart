// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../config/mt_theme.dart';

/// Get screen size
Size screenSize(BuildContext context) => MediaQuery.sizeOf(context);

/// Check if screen is small in landscape mode
bool _smallLandscape(BuildContext context) =>
    screenSize(context).height < context.breakpoints.xsHeight &&
    MediaQuery.orientationOf(context) == Orientation.landscape;

/// Check if screen is large
bool isBigScreen(BuildContext context) {
  final size = screenSize(context);
  return size.height > context.breakpoints.sHeight && size.width > context.breakpoints.mWidth;
}

/// Check if vertical panels can be shown
bool canShowVerticalBars(BuildContext context) => isBigScreen(context) || _smallLandscape(context);

/// Sizes for responsiveness
enum AdaptiveSize { xxs, xs, s, m, l }

/// Responsive container with width constraints
class MTAdaptive extends StatelessWidget {
  const MTAdaptive({super.key, required this.child, this.force = false, this.size = AdaptiveSize.m, this.padding});

  const MTAdaptive.xxs({super.key, required this.child, this.force = true, this.padding}) : size = AdaptiveSize.xxs;

  const MTAdaptive.xs({super.key, required this.child, this.force = true, this.padding}) : size = AdaptiveSize.xs;

  const MTAdaptive.s({super.key, required this.child, this.force = false, this.padding}) : size = AdaptiveSize.s;

  const MTAdaptive.l({super.key, required this.child, this.force = false, this.padding}) : size = AdaptiveSize.l;

  final Widget? child;
  final bool force;
  final AdaptiveSize size;
  final EdgeInsets? padding;

  Widget _constrained(BuildContext context) {
    double W = context.breakpoints.xxsWidth;

    switch (size) {
      case AdaptiveSize.xxs:
        break;
      case AdaptiveSize.xs:
        W = context.breakpoints.xsWidth;
        break;
      case AdaptiveSize.s:
        W = context.breakpoints.sWidth;
        break;
      case AdaptiveSize.m:
        W = context.breakpoints.mWidth;
        break;
      case AdaptiveSize.l:
        W = context.breakpoints.lWidth;
        break;
    }

    final mqW = MediaQuery.sizeOf(context).width;
    return Container(
      alignment: Alignment.topCenter,
      padding: padding,
      child: SizedBox(
        width: min(W, mqW),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return force ? UnconstrainedBox(child: _constrained(context)) : _constrained(context);
  }
}
