// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // MTCard
        MTListText.h3('MTCard'),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MTListText.h3('Card Title'),
              SizedBox(height: context.sizing.smallSpacing),
              const MTListText('This is a card with shadow and rounded corners.'),
              SizedBox(height: context.sizing.smallSpacing),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        // MTListTile
        MTListText.h3('MTListTile'),
        SizedBox(height: context.sizing.vPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            children: [
              MTListTile(
                leading: const PlusIcon(),
                titleText: 'Add Item',
                trailing: const ChevronRightIcon(),
                bottomDivider: true,
                onTap: () {},
              ),
              MTListTile(
                leading: const SettingsIcon(),
                titleText: 'Settings',
                subtitle: const SmallText('Configure app settings'),
                trailing: const ChevronRightIcon(),
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        /// MTAvatar
        MTListText.h3('MTAvatar'),
        MTCard(
          margin: context.sizing.defMargin,
          padding: context.sizing.defPadding,
          child: Wrap(
            spacing: context.sizing.vPadding,
            runSpacing: context.sizing.vPadding,
            children: const [
              // Initials only
              MTAvatar(20, initials: 'JD'),
              // Initials with border
              MTAvatar(20, initials: 'AB', borderColor: CupertinoColors.systemBlue),
              // Gravatar
              MTAvatar(20, gravatarEmail: 'john.doe@example.com'),
              // No data (icon fallback)
              MTAvatar(20),
              // Large with initials
              MTAvatar(40, initials: 'JD'),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        // MTCircle
        MTListText.h3('MTCircle'),
        MTCard(
          margin: context.sizing.defMargin,
          padding: context.sizing.defPadding,
          child: Row(
            children: [
              MTCircle(color: context.colorScheme.mainColor, size: 40),
              SizedBox(width: context.sizing.vPadding),
              MTCircle(color: context.colorScheme.dangerColor, size: 40),
              SizedBox(width: context.sizing.vPadding),
              MTCircle(color: context.colorScheme.safeColor, size: 40),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        // MTDivider
        MTListText.h3('MTDivider'),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            children: [
              const MTListText('Content above divider'),
              MTDivider(verticalIndent: context.sizing.vPadding),
              const MTListText('Content below divider'),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        /// MTProgress / MTCircularProgress
        MTListText.h3('MTProgress / MTCircularProgress'),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MTListText('Linear Progress'),
              SizedBox(height: context.sizing.vPadding),
              const MTProgress(0.7),
            ],
          ),
        ),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            children: [
              const MTListText('Circular Progress'),
              SizedBox(height: context.sizing.vPadding),
              const MTCircularProgress(),
              SizedBox(height: context.sizing.vPadding),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        /// MTScrollableCentered
        MTListText.h3('MTScrollableCentered'),
        MTCard(
          margin: context.sizing.defMargin,
          child: SizedBox(
            height: 250,
            child: MTScrollableCentered(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MTListText('Centered Content'),
                  SizedBox(height: context.sizing.vPadding),
                  const MTListText('This content is centered both horizontally and vertically'),
                  SizedBox(height: context.sizing.vPadding),
                  MTButton.main(
                    titleText: 'Centered Button',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        /// MTShadowed
        MTListText.h3('MTShadowed'),
        MTCard(
          margin: context.sizing.defMargin,
          child: MTShadowed(
            child: Container(
              height: 100,
              color: context.colorScheme.b3Color.resolve(context),
              child: const Center(
                child: BaseText('Container with top shadow'),
              ),
            ),
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        /// MTAdaptive
        MTListText.h3('MTAdaptive'),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            children: [
              MTAdaptive.xxs(
                child: Container(
                  padding: EdgeInsets.all(context.sizing.smallSpacing),
                  color: context.colorScheme.mainColor.resolve(context).withValues(alpha: 0.1),
                  child: const BaseText('XXS Container (max 290px)'),
                ),
              ),
              SizedBox(height: context.sizing.vPadding),
              MTAdaptive.s(
                child: Container(
                  padding: EdgeInsets.all(context.sizing.smallSpacing),
                  color: context.colorScheme.safeColor.resolve(context).withValues(alpha: 0.1),
                  child: const BaseText('S Container (max 480px)'),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        // MTBackgroundWrapper
        MTListText.h3('MTBackgroundWrapper'),
        MTCard(
          margin: context.sizing.defMargin,
          child: const MTBackgroundWrapper(
            SizedBox(
              height: 100,
              child: Center(
                child: BaseText('Container with gradient background'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
