// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MTScrollableCentered extends StatelessWidget {
  const MTScrollableCentered(this._child, {super.key});
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final mq = MediaQuery.of(context);
    
    return LayoutBuilder(
      builder: (_, constraints) => Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(padding: MediaQuery.paddingOf(context), child: _child),
            ),
          ),
          // Add tap-to-scroll functionality for status bar area
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: mq.padding.top,
            child: GestureDetector(
              onTap: () {
                if (scrollController.hasClients) {
                  scrollController.animateTo(
                    0.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                }
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
