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
      navBar: MTNavBar(pageTitle: _tabTitles[_selectedTab]),
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
                  color: isSelected ? context.uiConfig.mainColor : context.uiConfig.f3Color,
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
  b0Color: CupertinoDynamicColor.withBrightness(
    color: Color(0xFF000000), // Light: black
    darkColor: Color(0xFF000000), // Dark: black
  ),
  b1Color: CupertinoDynamicColor.withBrightness(
    color: Color(0xFFE5E5EA), // Light: light gray
    darkColor: Color(0xFF1C1C1E), // Dark: dark gray
  ),
  b2Color: CupertinoDynamicColor.withBrightness(
    color: Color(0xFFFFFFFF), // Light: white
    darkColor: Color(0xFF2C2C2E), // Dark: darker gray
  ),
  b3Color: CupertinoDynamicColor.withBrightness(
    color: Color(0xFFF2F2F7), // Light: lightest gray
    darkColor: Color(0xFF3A3A3C), // Dark: medium gray
  ),

  // Text colors
  f1Color: CupertinoDynamicColor.withBrightness(
    color: Color(0xFF000000), // Light: black
    darkColor: Color(0xFFFFFFFF), // Dark: white
  ),
  f2Color: CupertinoDynamicColor.withBrightness(
    color: Color(0xFF3C3C43), // Light: dark gray
    darkColor: Color(0xFFE5E5EA), // Dark: light gray
  ),
  f3Color: CupertinoDynamicColor.withBrightness(
    color: Color(0xFF8E8E93), // Light: medium gray
    darkColor: Color(0xFF8E8E93), // Dark: medium gray
  ),

  // Accent colors (keep static)
  mainColor: Color(0xFF007AFF),
  dangerColor: Color(0xFFFF3B30),
  safeColor: Color(0xFF34C759),
  warningColor: Color(0xFFFF9500),

  // Special colors
  mainBtnTitleColor: Color(0xFFFFFFFF),
  navbarColor: CupertinoDynamicColor.withBrightness(
    color: Color(0xFFF9F9F9), // Light: very light gray
    darkColor: Color(0xFF1C1C1E), // Dark: dark gray
  ),
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
  tappableIconSize: 36.0,
);
