// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import '../theme/constants.dart';
import '../theme/text.dart';
import 'button.dart';
// import 'dialog.dart'; // TODO: Add dialog component
import 'images.dart';

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
  String imageName = '',
  required String title,
  String description = '',
  required List<MTDialogAction<T>> actions,
}) async {
  // TODO: Implement showMTDialog
  return null;
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
    return Container(
      padding: EdgeInsets.all(constants.P3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imageName.isNotEmpty) MTImage(imageName),
          H2(title, padding: EdgeInsets.all(constants.P3), align: TextAlign.center),
          if (description.isNotEmpty)
            BaseText(description, maxLines: 20, align: TextAlign.center, padding: EdgeInsets.symmetric(horizontal: constants.P6)),
          for (final a in actions)
            MTButton(
              titleText: a.title,
              type: a.type,
              margin: EdgeInsets.only(top: constants.P3),
              constrained: true,
              onTap: () => _tap(context, a),
            ),
        ],
      ),
    );
  }
}
