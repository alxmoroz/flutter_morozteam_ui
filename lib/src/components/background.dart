// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import '../theme/colors.dart';
import '../utils/adaptive.dart';

/// Создает градиентное оформление фона
Decoration? backgroundDecoration(
  BuildContext context, {
  Color? bg1Color,
  Color? bg2Color,
}) {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        (bg1Color ?? colors.b2Color).resolve(context),
        (bg2Color ?? (isBigScreen(context) ? colors.b1Color : colors.b2Color))
            .resolve(context),
      ],
    ),
  );
}

/// Обертка с градиентным фоном
class MTBackgroundWrapper extends StatelessWidget {
  const MTBackgroundWrapper(
    this.child, {
    super.key,
    this.bg1Color,
    this.bg2Color,
  });

  final Color? bg1Color;
  final Color? bg2Color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundDecoration(
        context,
        bg1Color: bg1Color,
        bg2Color: bg2Color,
      ),
      child: child,
    );
  }
}
