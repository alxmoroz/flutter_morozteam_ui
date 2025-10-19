// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../config/ui_theme.dart';
import '../theme/resolved_color.dart';
import 'circular_progress.dart';

/// Loader with semi-transparent background
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
              color: context.colorScheme.b2Color.resolve(context).withValues(alpha: 0.82),
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
            ),
          ),
          const MTCircularProgress(unbound: true),
        ],
      ),
    );
  }
}
