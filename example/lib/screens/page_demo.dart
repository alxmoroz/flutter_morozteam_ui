// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class PageDemo extends StatefulWidget {
  const PageDemo({super.key});

  @override
  State<PageDemo> createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo> {
  int _selectedTab = 0;

  final List<String> _tabTitles = const [
    'Home',
    'Profile',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return MTPage(
      navBar: MTNavBar(
        pageTitle: _tabTitles[_selectedTab],
        trailing: MTButton.icon(
          const SettingsIcon(),
          onTap: () => _showSettings(context),
        ),
      ),
      body: _buildBody(),
      bottomBar: MTBottomBar(
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_tabTitles.length, (index) {
            final isSelected = index == _selectedTab;
            return Expanded(
              child: MTButton.icon(
                Icon(_getIconForTab(index)),
                color: isSelected ? context.colorScheme.mainColor : context.colorScheme.f3Color,
                onTap: () => setState(() => _selectedTab = index),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedTab) {
      case 0:
        return _buildHomeTab();
      case 1:
        return _buildProfileTab();
      case 2:
        return _buildSettingsTab();
      default:
        return _buildHomeTab();
    }
  }

  Widget _buildHomeTab() {
    return ListView(
      children: [
        MTListText.h2('MTPage Demo'),
        SizedBox(height: context.sizing.vPadding),
        const MTListText('This demonstrates the MTPage component with:'),
        SizedBox(height: context.sizing.vPadding),
        const MTListText('• MTNavBar with title and action buttons'),
        const MTListText('• MTBottomBar with tab navigation'),
        const MTListText('• Responsive body content'),
        const MTListText('• Proper scrolling and shadows'),
        SizedBox(height: context.sizing.hPadding),

        MTListText.h3('Navigation Bar Features'),
        SizedBox(height: context.sizing.vPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MTListText('MTNavBar includes:'),
              SizedBox(height: context.sizing.smallSpacing),
              const MTListText('• Page title'),
              const MTListText('• Leading button (Back)'),
              const MTListText('• Trailing button (Settings)'),
              const MTListText('• Automatic shadow on scroll'),
            ],
          ),
        ),

        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('Bottom Bar Features'),
        SizedBox(height: context.sizing.vPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MTListText('MTBottomBar includes:'),
              SizedBox(height: context.sizing.smallSpacing),
              const MTListText('• Tab navigation'),
              const MTListText('• Icon buttons with selection state'),
              const MTListText('• Automatic color changes'),
              const MTListText('• Safe area handling'),
            ],
          ),
        ),

        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('Page Layout'),
        SizedBox(height: context.sizing.vPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MTListText('MTPage provides:'),
              SizedBox(height: context.sizing.smallSpacing),
              const MTListText('• Safe area handling'),
              const MTListText('• Keyboard avoidance'),
              const MTListText('• Scroll shadows'),
              const MTListText('• Responsive breakpoints'),
              const MTListText('• Background wrapper'),
            ],
          ),
        ),

        // Add some content to demonstrate scrolling
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('Scroll Demo'),
        SizedBox(height: context.sizing.vPadding),
        ...List.generate(
          10,
          (index) => MTCard(
            margin: context.sizing.defMargin,
            child: MTListText('Scroll item ${index + 1}'),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileTab() {
    return ListView(
      children: [
        MTListText.h2('Profile Tab'),
        SizedBox(height: context.sizing.vPadding),
        const MTListText('This is the Profile tab content.'),
        SizedBox(height: context.sizing.hPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            children: [
              const MTAvatar(60, initials: 'JD'),
              SizedBox(height: context.sizing.vPadding),
              const MTListText('John Doe'),
              const BaseText.f2('john.doe@example.com'),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('Profile Actions'),
        SizedBox(height: context.sizing.vPadding),
        MTButton.main(
          titleText: 'Edit Profile',
          onTap: () => _showMessage(context, 'Edit Profile tapped'),
          margin: context.sizing.defMargin,
        ),
        MTButton.secondary(
          titleText: 'Change Password',
          onTap: () => _showMessage(context, 'Change Password tapped'),
          margin: context.sizing.defMargin,
        ),
      ],
    );
  }

  Widget _buildSettingsTab() {
    return ListView(
      children: [
        MTListText.h2('Settings Tab'),
        SizedBox(height: context.sizing.vPadding),
        const MTListText('This is the Settings tab content.'),
        SizedBox(height: context.sizing.hPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            children: [
              MTListTile(
                leading: const SettingsIcon(),
                titleText: 'General Settings',
                trailing: const ChevronRightIcon(),
                onTap: () => _showMessage(context, 'General Settings tapped'),
              ),
              MTListTile(
                leading: const InfoIcon(),
                titleText: 'About',
                trailing: const ChevronRightIcon(),
                bottomDivider: true,
                onTap: () => _showMessage(context, 'About tapped'),
              ),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('Appearance'),
        SizedBox(height: context.sizing.vPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            children: [
              MTListTile(
                leading: const MTCircle(color: CupertinoColors.systemBlue, size: 20),
                titleText: 'Theme',
                trailing: const ChevronRightIcon(),
                onTap: () => _showMessage(context, 'Theme tapped'),
              ),
              MTListTile(
                leading: const MTCircle(color: CupertinoColors.systemGreen, size: 20),
                titleText: 'Language',
                trailing: const ChevronRightIcon(),
                bottomDivider: true,
                onTap: () => _showMessage(context, 'Language tapped'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  IconData _getIconForTab(int index) {
    switch (index) {
      case 0:
        return CupertinoIcons.home;
      case 1:
        return CupertinoIcons.person;
      case 2:
        return CupertinoIcons.settings;
      default:
        return CupertinoIcons.home;
    }
  }

  void _showSettings(BuildContext context) {
    showMTDialog(
      MTCard(
        padding: EdgeInsets.all(context.sizing.hPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MTListText.h3('Quick Settings'),
            SizedBox(height: context.sizing.vPadding),
            const MTListText('This is a quick settings dialog.'),
            SizedBox(height: context.sizing.hPadding),
            MTButton.main(
              titleText: 'Close',
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      context: context,
    );
  }

  void _showMessage(BuildContext context, String message) {
    showMTSnackbar(
      message,
      context: context,
    );
  }
}
