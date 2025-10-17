// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class TypographyDemo extends StatelessWidget {
  const TypographyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const H2('Headings'),
        SizedBox(height: constants.P2),
        const H1('Heading 1'),
        const H2('Heading 2'),
        const H3('Heading 3'),
        const H4('Heading 4'),
        SizedBox(height: constants.P3),
        const H2('Text Styles'),
        SizedBox(height: constants.P2),
        MTListText('Base Text - Regular'),
        MTListText.medium('Base Text - Medium'),
        const MTListTile(middle: BaseText.bold('Base Text - Bold')),
        const MTListTile(middle: SmallText('Small Text')),
        const MTListTile(middle: NumbersText('123,456.78')),
        const MTListTile(middle: LinkText('Link Text')),
        SizedBox(height: constants.P3),
        const H2('Text Colors'),
        SizedBox(height: constants.P2),
        MTListText('Default color (F1)'),
        const MTListTile(middle: BaseText.f2('Secondary color (F2)')),
        const MTListTile(middle: BaseText.f3('Tertiary color (F3)')),
        SizedBox(height: constants.P3),
        const H2('Color Palette'),
        SizedBox(height: constants.P2),
        _ColorPalette(),
      ],
    );
  }
}

class _ColorPalette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiColors = colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ColorSection('Background', [
          _ColorBox('B0', uiColors.b0Color),
          _ColorBox('B1', uiColors.b1Color),
          _ColorBox('B2', uiColors.b2Color),
          _ColorBox('B3', uiColors.b3Color),
        ]),
        SizedBox(height: constants.P2),
        _ColorSection('Foreground', [
          _ColorBox('F1', uiColors.f1Color),
          _ColorBox('F2', uiColors.f2Color),
          _ColorBox('F3', uiColors.f3Color),
        ]),
        SizedBox(height: constants.P2),
        _ColorSection('Accent', [
          _ColorBox('Main', uiColors.mainColor),
          _ColorBox('Danger', uiColors.dangerColor),
          _ColorBox('Safe', uiColors.safeColor),
          _ColorBox('Warning', uiColors.warningColor),
        ]),
      ],
    );
  }
}

class _ColorSection extends StatelessWidget {
  const _ColorSection(this.title, this.colors);

  final String title;
  final List<_ColorBox> colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText.medium(title),
        SizedBox(height: constants.P),
        Wrap(
          spacing: constants.P,
          runSpacing: constants.P,
          children: colors,
        ),
      ],
    );
  }
}

class _ColorBox extends StatelessWidget {
  const _ColorBox(this.label, this.color);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.resolve(context),
            borderRadius: BorderRadius.circular(constants.P),
            border: Border.all(color: colors.f3Color.resolve(context)),
          ),
        ),
        SizedBox(height: constants.P_2),
        SmallText(label),
      ],
    );
  }
}
