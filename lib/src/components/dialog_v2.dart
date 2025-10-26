// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import '../config/mt_theme.dart';
import '../theme/resolved_color.dart';
import '../utils/sizing_extensions.dart';
import 'dialog_mixin.dart';

/// Simplified dialog component
class MTDialogV2 extends StatelessWidget with DialogMixin {
  const MTDialogV2({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.maxWidth,
    this.borderRadius,
    this.backgroundColor,
  });

  final String? title;
  final Widget? content;
  final List<Widget>? actions;
  final double? maxWidth;
  final double? borderRadius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return constrainedDialog(
      context,
      _buildDialog(context),
      maxWidth: maxWidth,
    );
  }

  Widget _buildDialog(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colorScheme.b3Color.resolve(context),
        borderRadius: BorderRadius.circular(
          borderRadius ?? context.sizing.defBorderRadius,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) _buildTitle(context),
          if (content != null) _buildContent(context),
          if (actions != null) _buildActions(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: context.defPadding,
      child: Text(
        title!,
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: context.defPadding,
      child: content!,
    );
  }

  Widget _buildActions(BuildContext context) {
    return Padding(
      padding: context.defPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: actions!
            .map((action) => Padding(
                  padding: EdgeInsets.only(left: context.sizing.smallSpacing),
                  child: action,
                ))
            .toList(),
      ),
    );
  }
}

/// Factory methods for common dialog types
extension MTDialogV2Factory on MTDialogV2 {
  static MTDialogV2 alert({
    required String title,
    required String message,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    String confirmText = 'OK',
    String? cancelText,
  }) {
    return MTDialogV2(
      title: title,
      content: Text(message),
      actions: [
        if (onCancel != null && cancelText != null)
          TextButton(
            onPressed: onCancel,
            child: Text(cancelText),
          ),
        TextButton(
          onPressed: onConfirm,
          child: Text(confirmText),
        ),
      ],
    );
  }

  static MTDialogV2 confirm({
    required String title,
    required String message,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) {
    return MTDialogV2(
      title: title,
      content: Text(message),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text(cancelText),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text(confirmText),
        ),
      ],
    );
  }
}