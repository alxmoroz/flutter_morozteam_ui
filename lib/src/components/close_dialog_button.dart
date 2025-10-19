// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

import '../config/ui_theme.dart';
import 'button.dart';
import 'icons.dart';

class MTCloseDialogButton extends StatelessWidget {
  const MTCloseDialogButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => MTButton.icon(
        CloseIcon(color: context.colorScheme.f2Color),
        onTap: onTap ?? () => Navigator.of(context).pop(),
        padding: EdgeInsets.all(context.sizing.verticalPadding),
      );
}
