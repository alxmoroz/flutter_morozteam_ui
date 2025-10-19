// Copyright (c) 2025. Alexandr Moroz

import 'dart:async';

import 'package:flutter/material.dart';

import '../config/mt_theme.dart';
import '../theme/resolved_color.dart';
import '../theme/text.dart';
import 'dialog.dart';
import 'list_tile.dart';

Future showMTSnackbar(String text,
    {required BuildContext context, TextAlign? titleAlign = TextAlign.center, Widget? trailing, Function()? onTap}) async {
  await showMTDialog(
    _MTSnackbarDialog(text, titleAlign: titleAlign, trailing: trailing, onTap: onTap),
    forceBottomSheet: true,
    barrierColor: Colors.transparent,
    context: context,
  );
}

class _MTSnackbarDialog extends StatefulWidget {
  const _MTSnackbarDialog(this._text, {this.titleAlign, this.trailing, this.onTap});
  final String _text;
  final TextAlign? titleAlign;
  final Widget? trailing;
  final Function()? onTap;

  @override
  State<_MTSnackbarDialog> createState() => _State();
}

class _State extends State<_MTSnackbarDialog> {
  late Timer _closingTimer;

  @override
  void initState() {
    _closingTimer = Timer(const Duration(milliseconds: 3000), () {
      if (context.mounted) Navigator.of(context).pop();
    });
    super.initState();
  }

  @override
  void dispose() {
    _closingTimer.cancel();
    super.dispose();
  }

  Future _onTap(BuildContext context) async {
    _closingTimer.cancel();
    Navigator.of(context).pop();
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MTDialog(
      topBar: null,
      bgColor: context.colorScheme.b3Color.resolve(context),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(context.sizing.defBorderRadius),
        topRight: Radius.circular(context.sizing.defBorderRadius),
      ),
      body: SafeArea(
        child: MTListTile(
          padding: EdgeInsets.all(context.sizing.hPadding).copyWith(bottom: 0),
          color: Colors.transparent,
          middle: H2(
            widget._text,
            color: context.colorScheme.f2Color.resolve(context),
            align: widget.titleAlign,
            maxLines: 3,
          ),
          trailing: widget.trailing,
          bottomDivider: false,
          onTap: () => _onTap(context),
        ),
      ),
      forceBottomPadding: true,
    );
  }
}
