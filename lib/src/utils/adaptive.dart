// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';
import 'package:flutter/cupertino.dart';
import '../theme/constants.dart';

/// Получить размер экрана
Size screenSize(BuildContext context) => MediaQuery.sizeOf(context);

/// Проверить, является ли экран маленьким в landscape режиме
bool _smallLandscape(BuildContext context) =>
    screenSize(context).height < constants.scrXSHeight && 
    MediaQuery.orientationOf(context) == Orientation.landscape;

/// Проверить, является ли экран большим
bool isBigScreen(BuildContext context) {
  final size = screenSize(context);
  return size.height > constants.scrSHeight && size.width > constants.scrMWidth;
}

/// Проверить, можно ли показывать вертикальные панели
bool canShowVerticalBars(BuildContext context) => 
    isBigScreen(context) || _smallLandscape(context);

/// Размеры для адаптивности
enum AdaptiveSize { xxs, xs, s, m, l }

/// Адаптивный контейнер с ограничением ширины
class MTAdaptive extends StatelessWidget {
  const MTAdaptive({
    super.key, 
    required this.child, 
    this.force = false, 
    this.size = AdaptiveSize.m, 
    this.padding
  });

  const MTAdaptive.xxs({
    super.key, 
    required this.child, 
    this.force = true, 
    this.padding
  }) : size = AdaptiveSize.xxs;

  const MTAdaptive.xs({
    super.key, 
    required this.child, 
    this.force = true, 
    this.padding
  }) : size = AdaptiveSize.xs;

  const MTAdaptive.s({
    super.key, 
    required this.child, 
    this.force = false, 
    this.padding
  }) : size = AdaptiveSize.s;

  const MTAdaptive.l({
    super.key, 
    required this.child, 
    this.force = false, 
    this.padding
  }) : size = AdaptiveSize.l;

  final Widget? child;
  final bool force;
  final AdaptiveSize size;
  final EdgeInsets? padding;

  Widget _constrained(BuildContext context) {
    double W = constants.scrXXSWidth;

    switch (size) {
      case AdaptiveSize.xxs:
        break;
      case AdaptiveSize.xs:
        W = constants.scrXSWidth;
        break;
      case AdaptiveSize.s:
        W = constants.scrSWidth;
        break;
      case AdaptiveSize.m:
        W = constants.scrMWidth;
        break;
      case AdaptiveSize.l:
        W = constants.scrLWidth;
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
