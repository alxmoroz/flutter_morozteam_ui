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
        SizedBox(height: context.sizing.vPadding),
        Padding(
          padding: context.sizing.defMargin,
          child: MTAdaptive.xxs(
            child: Container(
              padding: EdgeInsets.all(context.sizing.smallSpacing),
              color: context.colorScheme.mainColor.resolve(context).withValues(alpha: 0.1),
              child: const BaseText('XXS Container (max 290px)'),
            ),
          ),
        ),
        SizedBox(height: context.sizing.vPadding),
        Padding(
          padding: context.sizing.defMargin,
          child: MTAdaptive.s(
            child: Container(
              padding: EdgeInsets.all(context.sizing.smallSpacing),
              color: context.colorScheme.safeColor.resolve(context).withValues(alpha: 0.1),
              child: const BaseText('S Container (max 480px)'),
            ),
          ),
        ),
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('MTShadowed'),
        SizedBox(height: context.sizing.vPadding),
        Padding(
          padding: context.sizing.defMargin,
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
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('MTBackgroundWrapper'),
        SizedBox(height: context.sizing.vPadding),
        Padding(
          padding: context.sizing.defMargin,
          child: const MTBackgroundWrapper(
            SizedBox(
              height: 150,
              child: Center(
                child: BaseText('Container with gradient background'),
              ),
            ),
          ),
        ),
        SizedBox(height: context.sizing.vPadding),
        MTListText.h3('Component Sizes'),
        MTCard(
          margin: context.sizing.defMargin,
          padding: context.sizing.defPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText('minButtonHeight = ${context.sizing.minButtonHeight}'),
              BaseText('defaultBorderRadius = ${context.sizing.defBorderRadius}'),
              BaseText('defaultIconSize = ${context.sizing.defaultIconSize}'),
              BaseText('progressSize = ${context.sizing.progressSize}'),
              BaseText('loadingIconSize = ${context.sizing.loadingIconSize}'),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('Default Margins & Spacing'),
        MTCard(
          margin: context.sizing.defMargin,
          padding: context.sizing.defPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText('horizontalPadding (Horizontal padding) = ${context.sizing.hPadding}'),
              BaseText('verticalPadding (Vertical padding) = ${context.sizing.smallSpacing}'),
              SizedBox(height: context.sizing.smallSpacing),
              const BaseText.medium('defaultPadding:'),
              const BaseText('  EdgeInsets.symmetric('),
              BaseText('    horizontal: ${context.sizing.hPadding},'),
              BaseText('    vertical: ${context.sizing.smallSpacing}'),
              const BaseText('  )'),
              SizedBox(height: context.sizing.smallSpacing),
              const BaseText.medium('defMargin:'),
              const BaseText('  EdgeInsets.fromLTRB('),
              BaseText('    ${context.sizing.hPadding}, // left'),
              BaseText('    ${context.sizing.smallSpacing}, // top'),
              BaseText('    ${context.sizing.hPadding}, // right'),
              const BaseText('    0       // bottom (no margin)'),
              const BaseText('  )'),
            ],
          ),
        ),
        SizedBox(height: context.sizing.vPadding),
        MTCard(
          padding: context.sizing.defPadding, // Demonstration of defaultPadding
          margin: context.sizing.defMargin, // Demonstration of defMargin
          child: const Center(
            child: BaseText('This card uses defaultPadding and defMargin'),
          ),
        ),
      ],
    );
  }
}
