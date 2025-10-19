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
        SizedBox(height: context.sizing.verticalPadding),
        Padding(
          padding: context.sizing.defaultMargin,
          child: MTAdaptive.xxs(
            child: Container(
              padding: EdgeInsets.all(context.sizing.smallSpacing),
              color: context.colorScheme.mainColor.resolve(context).withValues(alpha: 0.1),
              child: const BaseText('XXS Container (max 290px)'),
            ),
          ),
        ),
        SizedBox(height: context.sizing.verticalPadding),
        Padding(
          padding: context.sizing.defaultMargin,
          child: MTAdaptive.s(
            child: Container(
              padding: EdgeInsets.all(context.sizing.smallSpacing),
              color: context.colorScheme.safeColor.resolve(context).withValues(alpha: 0.1),
              child: const BaseText('S Container (max 480px)'),
            ),
          ),
        ),
        SizedBox(height: context.sizing.horizontalPadding),
        MTListText.h3('MTShadowed'),
        SizedBox(height: context.sizing.verticalPadding),
        Padding(
          padding: context.sizing.defaultMargin,
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
        SizedBox(height: context.sizing.horizontalPadding),
        MTListText.h3('MTBackgroundWrapper'),
        SizedBox(height: context.sizing.verticalPadding),
        Padding(
          padding: context.sizing.defaultMargin,
          child: MTBackgroundWrapper(
            SizedBox(
              height: 150,
              child: Center(
                child: BaseText('Container with gradient background'),
              ),
            ),
          ),
        ),
        SizedBox(height: context.sizing.horizontalPadding),
        MTListText.h3('Semantic Constants'),
        SizedBox(height: context.sizing.verticalPadding),
        MTCard(
          padding: EdgeInsets.all(context.sizing.smallSpacing),
          margin: context.sizing.defaultMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText('context.sizing.horizontalPadding = $context.sizing.horizontalPadding (horizontal padding)'),
              BaseText('context.sizing.smallSpacing = $context.sizing.smallSpacing (vertical padding)'),
              BaseText('context.sizing.minButtonHeight = $context.sizing.minButtonHeight'),
              BaseText('context.sizing.defaultBorderRadius = $context.sizing.defaultBorderRadius'),
              BaseText('context.sizing.defaultIconSize = $context.sizing.defaultIconSize'),
            ],
          ),
        ),
        SizedBox(height: context.sizing.horizontalPadding),
        MTListText.h3('Default Margins & context.sizing.smallSpacing'),
        SizedBox(height: context.sizing.verticalPadding),
        MTCard(
          padding: EdgeInsets.all(context.sizing.smallSpacing),
          margin: context.sizing.defaultMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                  'horizontalPadding (Horizontal context.sizing.smallSpacing) = $context.sizing.horizontalPadding'),
              BaseText('verticalPadding (Vertical context.sizing.smallSpacing) = $context.sizing.smallSpacing'),
              SizedBox(height: context.sizing.smallSpacing),
              BaseText.medium('defaultPadding:'),
              BaseText('  EdgeInsets.symmetric('),
              BaseText('    horizontal: $context.sizing.horizontalPadding,'),
              BaseText('    vertical: $context.sizing.smallSpacing'),
              BaseText('  )'),
              SizedBox(height: context.sizing.smallSpacing),
              BaseText.medium('defMargin:'),
              BaseText('  EdgeInsets.fromLTRB('),
              BaseText('    $context.sizing.horizontalPadding, // left'),
              BaseText('    $context.sizing.smallSpacing, // top'),
              BaseText('    $context.sizing.horizontalPadding, // right'),
              BaseText('    0       // bottom (no margin)'),
              BaseText('  )'),
            ],
          ),
        ),
        SizedBox(height: context.sizing.verticalPadding),
        MTCard(
          padding: context.sizing.defaultPadding, // Demonstration of defaultPadding
          margin: context.sizing.defaultMargin, // Demonstration of defMargin
          child: Center(
            child: BaseText('This card uses defaultPadding and defMargin'),
          ),
        ),
      ],
    );
  }
}
