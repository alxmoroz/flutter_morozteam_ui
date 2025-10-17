// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

import 'screens/screens.dart';

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
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: _demoConfig.mainColor.resolve(context),
              primary: _demoConfig.mainColor.resolve(context),
              brightness: MediaQuery.platformBrightnessOf(context),
              surface: _demoConfig.b2Color.resolve(context),
              surfaceTint: _demoConfig.b2Color.resolve(context),
            ),
            fontFamily: 'Roboto',
            useMaterial3: true,
          ),
          home: Builder(
            builder: (context) {
              // Set global context for dialogs
              setGlobalContext(context);
              return const UIThemeProvider(
                config: _demoConfig,
                child: DemoHomePage(),
              );
            },
          ),
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

  final List<Widget> _pages = [
    const ButtonsDemo(),
    const TypographyDemo(),
    const FormsDemo(),
    const ComponentsDemo(),
    const LayoutDemo(),
    const NewComponentsDemo(),
  ];

  final List<String> _tabTitles = const [
    'Buttons',
    'Typography',
    'Forms',
    'Components',
    'Layout',
    'New',
  ];

  @override
  Widget build(BuildContext context) {
    return MTPage(
      navBar: MTTopBar(pageTitle: _tabTitles[_selectedTab]),
      body: _pages[_selectedTab],
      bottomBar: MTBottomBar(
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_tabTitles.length, (index) {
            final isSelected = index == _selectedTab;
            return Expanded(
              child: MTButton.icon(
                Icon(
                  _getIconForTab(index),
                  color: isSelected ? colors.mainColor : colors.f3Color,
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
      default:
        return CupertinoIcons.square;
    }
  }
}

// ==================== CONFIG ====================

const _demoConfig = UIKitConfig(
  // Background colors
  b0Color: Color(0xFF000000),
  b1Color: Color(0xFF1C1C1E),
  b2Color: Color(0xFFFFFFFF),
  b3Color: Color(0xFFF2F2F7),

  // Text colors
  f1Color: Color(0xFF000000),
  f2Color: Color(0xFF3C3C43),
  f3Color: Color(0xFF8E8E93),

  // Accent colors
  mainColor: Color(0xFF007AFF),
  dangerColor: Color(0xFFFF3B30),
  safeColor: Color(0xFF34C759),
  warningColor: Color(0xFFFF9500),

  // Special colors
  mainBtnTitleColor: Color(0xFFFFFFFF),
  navbarColor: Color(0xFFF9F9F9),
  defaultBarrierColor: Color(0x80000000),

  // Typography
  baseFontSize: 16.0,
  fontFamily: '.SF Pro Text',
  fontFamilyNumbers: '.SF Mono',
  fontFamilyDecorative: '.SF Pro Display',

  // Spacing
  baseSpacing: 6.0,

  // Border radius
  defaultBorderRadius: 12.0,

  // Elevation
  cardElevation: 1.0,
  buttonElevation: 1.0,

  // Sizes
  minButtonHeight: 48.0,
  defaultBarHeight: 56.0,
  tappableIconSize: 44.0,
);
