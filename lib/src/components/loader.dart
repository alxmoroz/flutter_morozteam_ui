// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'circular_progress.dart';

/// Loader с полупрозрачным фоном
class MTLoader extends StatelessWidget {
  const MTLoader({super.key, this.borderRadius});
  
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: colors.b2Color.resolve(context).withValues(alpha: 0.82),
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
            ),
          ),
          const MTCircularProgress(unbound: true),
        ],
      ),
    );
  }
}
