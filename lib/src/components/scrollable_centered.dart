// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'status_bar_tap_handler.dart';

class MTScrollableCentered extends StatelessWidget {
  const MTScrollableCentered(this._child, {super.key});
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    
    return LayoutBuilder(
      builder: (_, constraints) => StatusBarTapHandler(
        scrollController: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(padding: MediaQuery.paddingOf(context), child: _child),
          ),
        ),
      ),
    );
  }
}
