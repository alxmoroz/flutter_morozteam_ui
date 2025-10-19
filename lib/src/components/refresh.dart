// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../theme/constants.dart';
import '../utils/gesture.dart';

/// Pull-to-refresh wrapper
class MTRefresh extends StatelessWidget with GestureManaging {
  const MTRefresh({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  final Widget child;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => tapAction(true, onRefresh, fbType: FeedbackType.light),
      edgeOffset: MediaQuery.of(context).padding.top,
      displacement: DEF_VP,
      child: child,
    );
  }
}
