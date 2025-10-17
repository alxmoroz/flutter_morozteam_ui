// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

class MTScrollableCentered extends StatelessWidget {
  const MTScrollableCentered(this._child, {super.key});
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Padding(padding: MediaQuery.paddingOf(context), child: _child),
        ),
      ),
    );
  }
}
