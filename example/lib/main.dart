// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

import 'screens/buttons_demo.dart';
import 'screens/components_demo.dart';
import 'screens/forms_demo.dart';
import 'screens/icons_demo.dart';
import 'screens/layout_demo.dart';
import 'screens/new_components_demo.dart';
import 'screens/page_demo.dart';
import 'screens/typography_demo.dart';
// ==================== CONFIG ====================

// Using default configuration

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UIThemeProvider(
      sizing: const UISizing(
        baseSpacingUnit: 4.0,
      ),
      child: MaterialApp(
        title: 'MorozTeam UI Demo',
        builder: (context, child) {
          return child!;
        },
        home: const DemoHomePage(),
      ),
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
    const ButtonsDemo(),
    const TypographyDemo(),
    const FormsDemo(),
    const ComponentsDemo(),
    const IconsDemo(),
    const LayoutDemo(),
    const PageDemo(),
    const NewComponentsDemo(),
  ];

  final List<String> _tabTitles = const [
    'Buttons',
    'Typography',
    'Forms',
    'Components',
    'Icons',
    'Layout',
    'Page',
    'Media',
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
        return CupertinoIcons.square_grid_2x2;
      case 1:
        return CupertinoIcons.textformat;
      case 2:
        return CupertinoIcons.doc_text;
      case 3:
        return CupertinoIcons.cube_box;
      case 4:
        return CupertinoIcons.rectangle_3_offgrid;
      case 5:
        return CupertinoIcons.star;
      case 6:
        return CupertinoIcons.doc_on_doc;
      case 7:
        return CupertinoIcons.square;
      default:
        return CupertinoIcons.square;
    }
  }
}
