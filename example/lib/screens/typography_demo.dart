// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class TypographyDemo extends StatelessWidget {
  const TypographyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MTListText.h1('H1 - Heading 1'),
        MTListText.h2('H2 - Heading 2'),
        MTListText.h3('H3 - Heading 3'),
        MTListText.h4('H4 - Heading 4'),
        const MTListText('BaseText - Regular'),
        MTListText.medium('BaseText.medium'),
        MTListText.small('SmallText'),
        MTListText.numbers('NumbersText: 123,456.78'),
        MTListText.link('LinkText'),
        const SizedBox(height: DEF_HP),

        // Section: Text Colors
        MTListText.h3('Text Colors'),
        const SizedBox(height: DEF_VP),
        const MTListTile(
          middle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText('F1 - Default'),
              SizedBox(height: P),
              BaseText.f2('F2 - Secondary'),
              SizedBox(height: P),
              BaseText.f3('F3 - Tertiary'),
            ],
          ),
        ),
        const SizedBox(height: DEF_HP),

        // Section: Color Palette
        MTListText.h3('Color Palette'),
        const SizedBox(height: DEF_VP),
        Padding(
          padding: DEF_MARGIN,
          child: _ColorPalette(),
        ),
      ],
    );
  }
}

class _ColorPalette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ColorSection('Background', [
          _ColorBox('B0', c.b0Color),
          _ColorBox('B1', c.b1Color),
          _ColorBox('B2', c.b2Color),
          _ColorBox('B3', c.b3Color),
        ]),
        const SizedBox(height: DEF_VP),
        _ColorSection('Foreground', [
          _ColorBox('F1', c.f1Color),
          _ColorBox('F2', c.f2Color),
          _ColorBox('F3', c.f3Color),
        ]),
        const SizedBox(height: DEF_VP),
        _ColorSection('Accent', [
          _ColorBox('Main', c.mainColor),
          _ColorBox('Danger', c.dangerColor),
          _ColorBox('Safe', c.safeColor),
          _ColorBox('Warning', c.warningColor),
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
        const SizedBox(height: P),
        Wrap(
          spacing: P,
          runSpacing: P,
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
            borderRadius: BorderRadius.circular(P),
            border: Border.all(color: context.colorScheme.f3Color.resolve(context)),
          ),
        ),
        const SizedBox(height: P_2),
        SmallText(label),
      ],
    );
  }
}
