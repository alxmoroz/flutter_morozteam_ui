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
        const SizedBox(height: DEF_VP),
        const MTListText('This demonstrates the MTPage component with:'),
        const SizedBox(height: DEF_VP),
        const MTListText('• MTNavBar with title and action buttons'),
        const MTListText('• MTBottomBar with tab navigation'),
        const MTListText('• Responsive body content'),
        const MTListText('• Proper scrolling and shadows'),
        const SizedBox(height: DEF_HP),

        MTListText.h3('Navigation Bar Features'),
        const SizedBox(height: DEF_VP),
        MTCard(
          margin: DEF_MARGIN,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MTListText('MTNavBar includes:'),
              const SizedBox(height: P),
              const MTListText('• Page title'),
              const MTListText('• Leading button (Back)'),
              const MTListText('• Trailing button (Settings)'),
              const MTListText('• Automatic shadow on scroll'),
            ],
          ),
        ),

        const SizedBox(height: DEF_HP),
        MTListText.h3('Bottom Bar Features'),
        const SizedBox(height: DEF_VP),
        MTCard(
          margin: DEF_MARGIN,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MTListText('MTBottomBar includes:'),
              const SizedBox(height: P),
              const MTListText('• Tab navigation'),
              const MTListText('• Icon buttons with selection state'),
              const MTListText('• Automatic color changes'),
              const MTListText('• Safe area handling'),
            ],
          ),
        ),

        const SizedBox(height: DEF_HP),
        MTListText.h3('Page Layout'),
        const SizedBox(height: DEF_VP),
        MTCard(
          margin: DEF_MARGIN,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MTListText('MTPage provides:'),
              const SizedBox(height: P),
              const MTListText('• Safe area handling'),
              const MTListText('• Keyboard avoidance'),
              const MTListText('• Scroll shadows'),
              const MTListText('• Responsive breakpoints'),
              const MTListText('• Background wrapper'),
            ],
          ),
        ),

        // Add some content to demonstrate scrolling
        const SizedBox(height: DEF_HP),
        MTListText.h3('Scroll Demo'),
        const SizedBox(height: DEF_VP),
        ...List.generate(
          10,
          (index) => MTCard(
            margin: DEF_MARGIN,
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
        const SizedBox(height: DEF_VP),
        const MTListText('This is the Profile tab content.'),
        const SizedBox(height: DEF_HP),
        MTCard(
          margin: DEF_MARGIN,
          child: Column(
            children: [
              const MTAvatar(60, initials: 'JD'),
              const SizedBox(height: DEF_VP),
              const MTListText('John Doe'),
              const BaseText.f2('john.doe@example.com'),
            ],
          ),
        ),
        const SizedBox(height: DEF_HP),
        MTListText.h3('Profile Actions'),
        const SizedBox(height: DEF_VP),
        MTButton.main(
          titleText: 'Edit Profile',
          onTap: () => _showMessage(context, 'Edit Profile tapped'),
          margin: DEF_MARGIN,
        ),
        MTButton.secondary(
          titleText: 'Change Password',
          onTap: () => _showMessage(context, 'Change Password tapped'),
          margin: DEF_MARGIN,
        ),
      ],
    );
  }

  Widget _buildSettingsTab() {
    return ListView(
      children: [
        MTListText.h2('Settings Tab'),
        const SizedBox(height: DEF_VP),
        const MTListText('This is the Settings tab content.'),
        const SizedBox(height: DEF_HP),
        MTCard(
          margin: DEF_MARGIN,
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
        const SizedBox(height: DEF_HP),
        MTListText.h3('Appearance'),
        const SizedBox(height: DEF_VP),
        MTCard(
          margin: DEF_MARGIN,
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
        padding: const EdgeInsets.all(DEF_HP),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MTListText.h3('Quick Settings'),
            const SizedBox(height: DEF_VP),
            const MTListText('This is a quick settings dialog.'),
            const SizedBox(height: DEF_HP),
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
