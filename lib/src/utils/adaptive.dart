// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../theme/constants.dart';

/// Get screen size
Size screenSize(BuildContext context) => MediaQuery.sizeOf(context);

/// Check if screen is small in landscape mode
bool _smallLandscape(BuildContext context) =>
    screenSize(context).height < SCR_XS_HEIGHT && MediaQuery.orientationOf(context) == Orientation.landscape;

/// Check if screen is large
bool isBigScreen(BuildContext context) {
  final size = screenSize(context);
  return size.height > SCR_S_HEIGHT && size.width > SCR_M_WIDTH;
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
    double W = SCR_XXS_WIDTH;

    switch (size) {
      case AdaptiveSize.xxs:
        break;
      case AdaptiveSize.xs:
        W = SCR_XS_WIDTH;
        break;
      case AdaptiveSize.s:
        W = SCR_S_WIDTH;
        break;
      case AdaptiveSize.m:
        W = SCR_M_WIDTH;
        break;
      case AdaptiveSize.l:
        W = SCR_L_WIDTH;
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
