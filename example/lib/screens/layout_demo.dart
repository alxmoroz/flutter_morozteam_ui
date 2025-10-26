// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
                subtitle: MText.small('Configure app settings'),
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
                child: MText('Container with top shadow'),
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
                  child: const MText('XXS Container (max 290px)'),
                ),
              ),
              SizedBox(height: context.sizing.vPadding),
              MTAdaptive.s(
                child: Container(
                  padding: EdgeInsets.all(context.sizing.smallSpacing),
                  color: context.colorScheme.safeColor.resolve(context).withValues(alpha: 0.1),
                  child: const MText('S Container (max 480px)'),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        // MTToolbar / MTNavBar / MTBottomBar
        MTListText.h3('MTToolbar (NavBar & BottomBar)'),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            children: [
              const MTListText('Navigation bars are shown in the main app structure'),
              SizedBox(height: context.sizing.vPadding),
              MTButton.secondary(
                titleText: 'See Navigation Example',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const _ToolbarDemoPage(),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        // MTScrollable standalone demo
        MTListText.h3('MTScrollable'),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MTListText('Dynamic shadows: top when scrolled down, bottom when near end'),
              SizedBox(height: context.sizing.vPadding),
              SizedBox(
                height: 200,
                child: MTScrollable(
                  scrollController: ScrollController(),
                  scrollOffsetTop: 50.0,
                  bottomShadowOffset: 100.0,
                  onScrolled: (scrolled) {
                    if (kDebugMode) print('Top scrolled: $scrolled');
                  },
                  onBottomScrolled: (scrolledToBottom) {
                    if (kDebugMode) print('Bottom scrolled: $scrolledToBottom');
                  },
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return MTListTile(titleText: 'Item $index', verticalPadding: 4);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        /// StatusBarTapHandler standalone demo
        MTListText.h3('StatusBarTapHandler'),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MTListText('Tap the status bar area to scroll to top'),
              SizedBox(height: context.sizing.vPadding),
              SizedBox(
                height: 200,
                child: StatusBarTapHandler(
                  scrollController: ScrollController(),
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return MTListTile(titleText: 'Item $index', verticalPadding: 4);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),

        /// MTPageTitle standalone
        MTListText.h3('MTPageTitle'),
        MTCard(
          margin: context.sizing.defMargin,
          padding: context.sizing.defPadding,
          child: PageTitle('Main Title', parentPageTitle: 'Parent'),
        ),
        MTCard(
          margin: context.sizing.defMargin,
          padding: context.sizing.defPadding,
          child: PageTitle('Simple Title'),
        ),
        SizedBox(height: context.sizing.hPadding),

        /// MTCloseDialogButton
        MTListText.h3('MTCloseDialogButton'),
        MTCard(
          margin: context.sizing.defMargin,
          child: MTTopBar(
            leading: MTCloseDialogButton(onTap: () {}),
            pageTitle: 'Close button for dialogs',
            color: context.colorScheme.b3Color,
            // SizedBox(width: context.sizing.vPadding),
            // const MText(),
          ),
        ),
      ],
    );
  }
}

/// Demo page showing MTToolbar, MTNavBar, and MTBottomBar examples
class _ToolbarDemoPage extends StatelessWidget {
  const _ToolbarDemoPage();

  @override
  Widget build(BuildContext context) {
    return MTPage(
      body: ListView(
        children: [
          MTListText.h2('MTNavBar Examples'),
          SizedBox(height: context.sizing.vPadding),

          // MTNavBar with pageTitle
          MTCard(
            margin: context.sizing.defMargin,
            child: Column(
              children: [
                const MTListText('MTNavBar with pageTitle'),
                SizedBox(height: context.sizing.vPadding),
                const MTNavBar(
                  pageTitle: 'Page Title',
                ),
              ],
            ),
          ),

          // MTNavBar with custom middle
          MTCard(
            margin: context.sizing.defMargin,
            child: Column(
              children: [
                const MTListText('MTNavBar with custom middle'),
                SizedBox(height: context.sizing.vPadding),
                const MTNavBar(
                  middle: MText('Custom Middle'),
                  trailing: MTSvgIcon('star'),
                ),
              ],
            ),
          ),

          SizedBox(height: context.sizing.hPadding),

          MTListText.h2('MTBottomBar Example'),
          SizedBox(height: context.sizing.vPadding),

          MTCard(
            margin: context.sizing.defMargin,
            child: Column(
              children: [
                const MTListText('MTBottomBar with navigation items'),
                SizedBox(height: context.sizing.vPadding),
                const MTBottomBar(
                  leading: MTSvgIcon('home'),
                  middle: MText('Bottom Bar'),
                  trailing: MTSvgIcon('user'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
