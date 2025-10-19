// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class ComponentsDemo extends StatelessWidget {
  const ComponentsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MTListText.h3('MTCard'),
        SizedBox(height: context.sizing.verticalPadding),
        MTCard(
          // padding: DEF_PADDING,
          margin: context.sizing.defaultMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MTListText.h3('Card Title'),
              SizedBox(height: context.sizing.smallSpacing),
              const MTListText('This is a card with shadow and rounded corners.'),
            ],
          ),
        ),
        SizedBox(height: context.sizing.horizontalPadding),
        MTListText.h3('MTListTile'),
        SizedBox(height: context.sizing.verticalPadding),
        MTCard(
          margin: context.sizing.defaultMargin,
          child: Column(
            children: [
              MTListTile(
                leading: const PlusIcon(),
                titleText: 'Add Item',
                trailing: const ChevronRightIcon(),
                onTap: () {},
              ),
              MTListTile(
                leading: const SettingsIcon(),
                titleText: 'Settings',
                subtitle: const SmallText('Configure app settings'),
                trailing: const ChevronRightIcon(),
                bottomDivider: true,
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: context.sizing.horizontalPadding),
        MTListText.h3('MTCircularProgress / MTProgress'),
        SizedBox(height: context.sizing.verticalPadding),
        MTCard(
          padding: EdgeInsets.all(context.sizing.horizontalPadding),
          margin: context.sizing.defaultMargin,
          child: Column(
            children: [
              const MTListText('Circular Progress'),
              SizedBox(height: context.sizing.verticalPadding),
              const MTCircularProgress(),
              SizedBox(height: context.sizing.horizontalPadding),
              const MTListText('Progress Bar'),
              SizedBox(height: context.sizing.verticalPadding),
              SizedBox(
                height: context.sizing.smallSpacing,
                child: MTProgress(0.7, color: context.colorScheme.mainColor),
              ),
            ],
          ),
        ),
        SizedBox(height: context.sizing.horizontalPadding),
        MTListText.h3('MTDivider'),
        SizedBox(height: context.sizing.verticalPadding),
        const MTListText('Above divider'),
        const MTDivider(),
        const MTListText('Below divider'),
      ],
    );
  }
}
