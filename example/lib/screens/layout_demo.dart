// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MTListText.h3('MTAdaptive'),
        const SizedBox(height: DEF_VP),
        Padding(
          padding: DEF_MARGIN,
          child: MTAdaptive.xxs(
            child: Container(
              padding: const EdgeInsets.all(DEF_VP),
              color: context.colorScheme.mainColor.resolve(context).withValues(alpha: 0.1),
              child: const BaseText('XXS Container (max 290px)'),
            ),
          ),
        ),
        const SizedBox(height: DEF_VP),
        Padding(
          padding: DEF_MARGIN,
          child: MTAdaptive.s(
            child: Container(
              padding: const EdgeInsets.all(DEF_VP),
              color: context.colorScheme.safeColor.resolve(context).withValues(alpha: 0.1),
              child: const BaseText('S Container (max 480px)'),
            ),
          ),
        ),
        const SizedBox(height: DEF_HP),
        MTListText.h3('MTShadowed'),
        const SizedBox(height: DEF_VP),
        Padding(
          padding: DEF_MARGIN,
          child: MTShadowed(
            child: Container(
              height: 200,
              color: context.colorScheme.b3Color.resolve(context),
              child: const Center(
                child: BaseText('Container with top shadow'),
              ),
            ),
          ),
        ),
        const SizedBox(height: DEF_HP),
        MTListText.h3('MTBackgroundWrapper'),
        const SizedBox(height: DEF_VP),
        const Padding(
          padding: DEF_MARGIN,
          child: MTBackgroundWrapper(
            SizedBox(
              height: 150,
              child: Center(
                child: BaseText('Container with gradient background'),
              ),
            ),
          ),
        ),
        const SizedBox(height: DEF_HP),
        MTListText.h3('Semantic Constants'),
        const SizedBox(height: DEF_VP),
        const MTCard(
          padding: EdgeInsets.all(DEF_VP),
          margin: DEF_MARGIN,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText('DEF_HP = $DEF_HP (horizontal padding)'),
              BaseText('DEF_VP = $DEF_VP (vertical padding)'),
              BaseText('MIN_BTN_HEIGHT = $MIN_BTN_HEIGHT'),
              BaseText('DEF_BORDER_RADIUS = $DEF_BORDER_RADIUS'),
              BaseText('DEF_ICON_SIZE = $DEF_ICON_SIZE'),
            ],
          ),
        ),
        const SizedBox(height: DEF_HP),
        MTListText.h3('Default Margins & Padding'),
        const SizedBox(height: DEF_VP),
        const MTCard(
          padding: EdgeInsets.all(DEF_VP),
          margin: DEF_MARGIN,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText('defHP (Horizontal Padding) = $DEF_HP'),
              BaseText('defVP (Vertical Padding) = $DEF_VP'),
              SizedBox(height: P),
              BaseText.medium('defPadding:'),
              BaseText('  EdgeInsets.symmetric('),
              BaseText('    horizontal: $DEF_HP,'),
              BaseText('    vertical: $DEF_VP'),
              BaseText('  )'),
              SizedBox(height: P),
              BaseText.medium('defMargin:'),
              BaseText('  EdgeInsets.fromLTRB('),
              BaseText('    $DEF_HP, // left'),
              BaseText('    $DEF_VP, // top'),
              BaseText('    $DEF_HP, // right'),
              BaseText('    0       // bottom (no margin)'),
              BaseText('  )'),
            ],
          ),
        ),
        const SizedBox(height: DEF_VP),
        const MTCard(
          padding: DEF_PADDING, // Demonstration of defPadding
          margin: DEF_MARGIN, // Demonstration of defMargin
          child: Center(
            child: BaseText('This card uses defPadding and defMargin'),
          ),
        ),
      ],
    );
  }
}
