// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

import '../theme/constants.dart';
import '../theme/text.dart';

/// Заголовок страницы
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
          SizedBox(height: constants.P_3),
        ],
        H3(text, color: color, maxLines: 1),
      ],
    );
  }
}
