// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

import '../config/mt_theme.dart';
import '../theme/text.dart';

/// Page title
class PageTitle extends StatelessWidget {
  const PageTitle(
    this.text, {
    super.key,
    this.parentPageTitle,
    this.color,
  });

  final String text;
  final String? parentPageTitle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (parentPageTitle != null) ...[
          SmallText(parentPageTitle!, color: color, maxLines: 1),
          SizedBox(height: context.sizing.borderWidth),
        ],
        H3(text, color: color, maxLines: 1),
      ],
    );
  }
}
