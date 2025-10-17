// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class ComponentsDemo extends StatelessWidget {
  const ComponentsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(constants.P3),
      children: [
        const H2('Cards'),
        SizedBox(height: constants.P2),
        MTCard(
          padding: EdgeInsets.all(constants.P3),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              H3('Card Title'),
              BaseText('This is a card with shadow and rounded corners.'),
            ],
          ),
        ),
        SizedBox(height: constants.P3),
        const H2('List Items'),
        SizedBox(height: constants.P2),
        MTCard(
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
        SizedBox(height: constants.P3),
        const H2('Progress Indicators'),
        SizedBox(height: constants.P2),
        MTCard(
          padding: EdgeInsets.all(constants.P3),
          child: Column(
            children: [
              MTListText('Circular Progress'),
              SizedBox(height: constants.P2),
              const MTCircularProgress(),
              SizedBox(height: constants.P3),
              MTListText('Progress Bar'),
              SizedBox(height: constants.P2),
              SizedBox(
                height: constants.P,
                child: MTProgress(0.7, color: colors.mainColor),
              ),
            ],
          ),
        ),
        SizedBox(height: constants.P3),
        const H2('Dividers'),
        SizedBox(height: constants.P2),
        MTListText('Above divider'),
        const MTDivider(),
        MTListText('Below divider'),
        SizedBox(height: constants.P3),
        const H2('Icons'),
        SizedBox(height: constants.P2),
        Wrap(
          spacing: constants.P2,
          runSpacing: constants.P2,
          children: const [
            PlusIcon(size: 32),
            CloseIcon(size: 32),
            BackIcon(size: 32),
            CheckIcon(size: 32),
            InfoIcon(size: 32),
            WarningIcon(size: 32),
            EditIcon(size: 32),
            DeleteIcon(size: 32),
            SearchIcon(size: 32),
            SettingsIcon(size: 32),
            MenuIcon(size: 32),
            ChevronDownIcon(size: 32),
            ChevronUpIcon(size: 32),
            ChevronRightIcon(size: 32),
            ChevronLeftIcon(size: 32),
          ],
        ),
        SizedBox(height: constants.P3),
        const H2('Circles'),
        SizedBox(height: constants.P2),
        Row(
          children: [
            MTCircle(color: colors.mainColor, size: 40),
            SizedBox(width: constants.P2),
            MTCircle(color: colors.dangerColor, size: 40),
            SizedBox(width: constants.P2),
            MTCircle(color: colors.safeColor, size: 40),
          ],
        ),
      ],
    );
  }
}
