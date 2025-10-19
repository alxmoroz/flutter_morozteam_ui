// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

/// Demo screen showing common UI patterns using MorozTeam UI Kit
class PatternsDemo extends StatefulWidget {
  const PatternsDemo({super.key});

  @override
  State<PatternsDemo> createState() => _PatternsDemoState();
}

class _PatternsDemoState extends State<PatternsDemo> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MTPage(
      body: ListView(
        children: [
          MTListText.h2('Common UI Patterns'),
          SizedBox(height: context.sizing.vPadding),

          const MTListText(
            'This demo showcases common UI patterns and how to implement them '
            'using MorozTeam UI Kit components.',
          ),
          SizedBox(height: context.sizing.hPadding),

          // Form Pattern
          MTListText.h3('Form Pattern'),
          SizedBox(height: context.sizing.vPadding),

          MTCard(
            margin: context.sizing.defMargin,
            child: _buildFormPattern(),
          ),

          SizedBox(height: context.sizing.hPadding),

          // List with Sections Pattern
          MTListText.h3('List with Sections Pattern'),
          SizedBox(height: context.sizing.vPadding),

          MTCard(
            margin: context.sizing.defMargin,
            child: _buildListWithSections(),
          ),

          SizedBox(height: context.sizing.hPadding),

          // Settings Screen Pattern
          MTListText.h3('Settings Screen Pattern'),
          SizedBox(height: context.sizing.vPadding),

          MTCard(
            margin: context.sizing.defMargin,
            child: _buildSettingsScreen(),
          ),

          SizedBox(height: context.sizing.hPadding),

          // Empty State Pattern
          MTListText.h3('Empty State Pattern'),
          SizedBox(height: context.sizing.vPadding),

          MTCard(
            margin: context.sizing.defMargin,
            child: _buildEmptyState(),
          ),

          SizedBox(height: context.sizing.hPadding),

          // Loading State Pattern
          MTListText.h3('Loading State Pattern'),
          SizedBox(height: context.sizing.vPadding),

          MTCard(
            margin: context.sizing.defMargin,
            child: _buildLoadingState(),
          ),
        ],
      ),
    );
  }

  Widget _buildFormPattern() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MTListText('Complete form example'),
        SizedBox(height: context.sizing.vPadding),
        MTTextField(
          controller: _emailController,
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: context.sizing.vPadding),
        MTTextField(
          controller: _passwordController,
          label: 'Password',
          obscureText: true,
        ),
        SizedBox(height: context.sizing.vPadding),
        MTCheckBoxTile(
          title: 'Remember me',
          value: _rememberMe,
          onChanged: (value) => setState(() => _rememberMe = value ?? false),
        ),
        MTCheckBoxTile(
          title: 'I accept the terms and conditions',
          value: _acceptTerms,
          onChanged: (value) => setState(() => _acceptTerms = value ?? false),
        ),
        SizedBox(height: context.sizing.vPadding),
        Row(
          children: [
            Expanded(
              child: MTButton.main(
                titleText: 'Submit',
                onTap: () {
                  if (_formKey.currentState!.validate() && _acceptTerms) {
                    _showSnackbar('Form submitted successfully!');
                  } else if (!_acceptTerms) {
                    _showSnackbar('Please accept the terms and conditions');
                  }
                },
              ),
            ),
            SizedBox(width: context.sizing.vPadding),
            Expanded(
              child: MTButton.secondary(
                titleText: 'Cancel',
                onTap: () {
                  _formKey.currentState!.reset();
                  setState(() {
                    _rememberMe = false;
                    _acceptTerms = false;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildListWithSections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MTListText('List with sections and dividers'),
        SizedBox(height: context.sizing.vPadding),

        // Section 1
        MTListText.h4('Account Settings'),
        MTListTile(
          titleText: 'Profile',
          subtitle: const MText('Manage your profile information'),
          trailing: const MTSvgIcon('user'),
          onTap: () => _showSnackbar('Profile tapped'),
        ),
        MTListTile(
          titleText: 'Security',
          subtitle: const MText('Password and security settings'),
          trailing: const MTSvgIcon('star'),
          onTap: () => _showSnackbar('Security tapped'),
        ),

        MTDivider(verticalIndent: context.sizing.vPadding),

        // Section 2
        MTListText.h4('Preferences'),
        MTListTile(
          titleText: 'Notifications',
          subtitle: const MText('Manage notification preferences'),
          trailing: const MTSvgIcon('home'),
          onTap: () => _showSnackbar('Notifications tapped'),
        ),
        MTListTile(
          titleText: 'Privacy',
          subtitle: const MText('Control your privacy settings'),
          trailing: const MTSvgIcon('star'),
          onTap: () => _showSnackbar('Privacy tapped'),
        ),

        MTDivider(verticalIndent: context.sizing.vPadding),

        // Section 3
        MTListText.h4('Support'),
        MTListTile(
          titleText: 'Help Center',
          subtitle: const MText('Get help and support'),
          trailing: const MTSvgIcon('user'),
          onTap: () => _showSnackbar('Help Center tapped'),
        ),
        MTListTile(
          titleText: 'Contact Us',
          subtitle: const MText('Reach out to our support team'),
          trailing: const MTSvgIcon('home'),
          onTap: () => _showSnackbar('Contact Us tapped'),
        ),
      ],
    );
  }

  Widget _buildSettingsScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MTListText('Typical settings screen layout'),
        SizedBox(height: context.sizing.vPadding),

        // Profile section
        MTCard(
          child: Row(
            children: [
              const MTAvatar(
                30,
                initials: 'JD',
              ),
              SizedBox(width: context.sizing.vPadding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MTListText('John Doe'),
                    MText.small('john.doe@example.com'),
                  ],
                ),
              ),
              const MTSvgIcon('star'),
            ],
          ),
        ),

        SizedBox(height: context.sizing.vPadding),

        // Settings sections
        MTCard(
          child: Column(
            children: [
              MTListTile(
                titleText: 'Dark Mode',
                trailing: Switch(
                  value: false,
                  onChanged: (value) => _showSnackbar('Dark mode: $value'),
                ),
              ),
              const MTDivider(),
              MTListTile(
                titleText: 'Language',
                subtitle: const MText('English'),
                trailing: const MTSvgIcon('star'),
                onTap: () => _showSnackbar('Language tapped'),
              ),
              const MTDivider(),
              MTListTile(
                titleText: 'Storage',
                subtitle: const MText('2.1 GB used'),
                trailing: const MTSvgIcon('home'),
                onTap: () => _showSnackbar('Storage tapped'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        const MTListText('Empty state with illustration'),
        SizedBox(height: context.sizing.vPadding),
        const MTImage('no_info', height: 120, width: 120),
        SizedBox(height: context.sizing.vPadding),
        MTListText.h3('No items found'),
        SizedBox(height: context.sizing.smallSpacing),
        MText.f2(
          'There are no items to display at the moment.\nTry refreshing or check back later.',
          align: TextAlign.center,
        ),
        SizedBox(height: context.sizing.vPadding),
        MTButton.main(
          titleText: 'Refresh',
          onTap: () => _showSnackbar('Refreshing...'),
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return Column(
      children: [
        const MTListText('Loading states and progress indicators'),
        SizedBox(height: context.sizing.vPadding),

        // Linear progress
        const MTListText('Linear Progress'),
        SizedBox(height: context.sizing.smallSpacing),
        const MTProgress(0.7),
        SizedBox(height: context.sizing.vPadding),

        // Circular progress
        const MTListText('Circular Progress'),
        SizedBox(height: context.sizing.smallSpacing),
        const MTCircularProgress(),
        SizedBox(height: context.sizing.vPadding),

        // Loader overlay
        const MTListText('Loader Overlay'),
        SizedBox(height: context.sizing.smallSpacing),
        MTButton.secondary(
          titleText: 'Show Loader',
          onTap: () => _showLoader(),
        ),
      ],
    );
  }

  void _showSnackbar(String message) {
    showMTSnackbar(
      message,
      context: context,
    );
  }

  void _showLoader() {
    showMTDialog(
      const MTLoader(),
      context: context,
    );

    // Auto-hide after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }
}
