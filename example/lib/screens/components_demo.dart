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
        const SizedBox(height: DEF_VP),
        MTCard(
          // padding: DEF_PADDING,
          margin: DEF_MARGIN,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MTListText.h3('Card Title'),
              const SizedBox(height: P),
              const MTListText('This is a card with shadow and rounded corners.'),
            ],
          ),
        ),
        const SizedBox(height: DEF_HP),
        MTListText.h3('MTListTile'),
        const SizedBox(height: DEF_VP),
        MTCard(
          margin: DEF_MARGIN,
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
        const SizedBox(height: DEF_HP),
        MTListText.h3('MTCircularProgress / MTProgress'),
        const SizedBox(height: DEF_VP),
        MTCard(
          padding: const EdgeInsets.all(DEF_HP),
          margin: DEF_MARGIN,
          child: Column(
            children: [
              const MTListText('Circular Progress'),
              const SizedBox(height: DEF_VP),
              const MTCircularProgress(),
              const SizedBox(height: DEF_HP),
              const MTListText('Progress Bar'),
              const SizedBox(height: DEF_VP),
              SizedBox(
                height: P,
                child: MTProgress(0.7, color: context.colorScheme.mainColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: DEF_HP),
        MTListText.h3('MTDivider'),
        const SizedBox(height: DEF_VP),
        const MTListText('Above divider'),
        const MTDivider(),
        const MTListText('Below divider'),
      ],
    );
  }
}
