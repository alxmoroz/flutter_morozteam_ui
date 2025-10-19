// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

import 'screens/basics_demo.dart';
import 'screens/buttons_demo.dart';
import 'screens/dialogs_demo.dart';
import 'screens/forms_demo.dart';
import 'screens/layout_demo.dart';
import 'screens/page_demo.dart';
// ==================== CONFIG ====================

// Using default configuration

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          title: 'MorozTeam UI Demo',
          theme: buildMTTheme(
            context,
            sizing: const MTSizing(p: 4.0),
          ),
          home: const DemoHomePage(),
        );
      },
    );
  }
}

class DemoHomePage extends StatefulWidget {
  const DemoHomePage({super.key});

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  int _selectedTab = 0;
  final _scrollController = ScrollController();

  final List<Widget> _pages = [
    const BasicsDemo(), // Typography, Colors, Icons
    const ButtonsDemo(), // All buttons
    const FormsDemo(), // All form components
    const LayoutDemo(), // Layout components
    const DialogsDemo(), // Dialogs & overlays
    const PageDemo(), // Page structure info
  ];

  final List<String> _tabTitles = const [
    'Basics',
    'Buttons',
    'Forms',
    'Layout',
    'Dialogs',
    'Page',
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MTPage(
      navBar: MTNavBar(pageTitle: _tabTitles[_selectedTab]),
      scrollController: _scrollController,
      scrollOffsetTop: 50.0, // Shadow trigger threshold
      body: _pages[_selectedTab],
      bottomBar: MTBottomBar(
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_tabTitles.length, (index) {
            final isSelected = index == _selectedTab;
            return Expanded(
              child: MTButton.icon(
                MTIcon(
                  _getIconForTab(index),
                  color: isSelected ? context.colorScheme.mainColor : context.colorScheme.f3Color,
                ),
                onTap: () => setState(() => _selectedTab = index),
              ),
            );
          }),
        ),
      ),
    );
  }

  IconData _getIconForTab(int index) {
    switch (index) {
      case 0:
        return CupertinoIcons.textformat; // Basics
      case 1:
        return CupertinoIcons.square_grid_2x2; // Buttons
      case 2:
        return CupertinoIcons.doc_text; // Forms
      case 3:
        return CupertinoIcons.cube_box; // Layout
      case 4:
        return CupertinoIcons.chat_bubble; // Dialogs
      case 5:
        return CupertinoIcons.doc_on_doc; // Page
      default:
        return CupertinoIcons.square;
    }
  }
}
