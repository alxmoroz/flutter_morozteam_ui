// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

import '../../morozteam_ui.dart';

class MTDialogAction<T> {
  const MTDialogAction({
    this.result,
    this.title,
    this.type = MTButtonType.secondary,
    this.onTap,
  });

  final String? title;
  final T? result;
  final VoidCallback? onTap;
  final MTButtonType type;
}

Future<T?> showMTAlertDialog<T>({
  required BuildContext context,
  String imageName = '',
  required String title,
  String description = '',
  required List<MTDialogAction<T>> actions,
}) async {
  return await showMTDialog<T?>(
    _MTAlertDialog(
      title,
      description: description,
      imageName: imageName,
      actions: actions,
    ),
    maxWidth: context.breakpoints.xsWidth,
    context: context,
  );
}

class _MTAlertDialog extends StatelessWidget {
  const _MTAlertDialog(
    this.title, {
    required this.description,
    required this.imageName,
    required this.actions,
  });

  final String title;
  final String description;
  final String imageName;
  final List<MTDialogAction> actions;

  void _tap(BuildContext context, MTDialogAction a) async {
    if (a.onTap != null) {
      a.onTap!();
    }
    Navigator.of(context).pop(a.result);
  }

  @override
  Widget build(BuildContext context) {
    return MTDialog(
      body: ListView(
        shrinkWrap: true,
        children: [
          if (imageName.isNotEmpty) MTImage(imageName),
          MTListText.h2(title, titleTextAlign: TextAlign.center),
          if (description.isNotEmpty) MTListText(description, titleTextMaxLines: 20, titleTextAlign: TextAlign.center),
          for (final a in actions)
            MTButton(
              titleText: a.title,
              type: a.type,
              margin: EdgeInsets.only(
                  top: a.type != MTButtonType.text
                      ? context.sizing.horizontalPadding
                      : context.sizing.verticalPadding / 2),
              constrained: true,
              onTap: () => _tap(context, a),
            ),
        ],
      ),
      forceBottomPadding: actions.isNotEmpty,
    );
  }
}
