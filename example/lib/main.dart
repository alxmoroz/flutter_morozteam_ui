// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_morozteam_ui/flutter_morozteam_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter MorozTeam UI Demo',
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        brightness: Brightness.light,
      ),
      home: const UIThemeProvider(
        config: _demoConfig,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Flutter MorozTeam UI'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const H1('Typography Demo'),
              const SizedBox(height: 16),
              
              const H2('Headings'),
              const H1('Heading 1'),
              const H2('Heading 2'),
              const H3('Heading 3'),
              const SizedBox(height: 16),
              
              const H2('Text Variants'),
              const BaseText('Base Text'),
              const BaseText.medium('Medium Text'),
              const BaseText.bold('Bold Text'),
              const SmallText('Small Text'),
              const NumbersText('123456'),
              const LinkText('Link Text'),
              const SizedBox(height: 16),
              
              const H2('Buttons'),
              const SizedBox(height: 8),
              
              const H3('Main Buttons'),
              MTButton.main(
                titleText: 'Main Button',
                onTap: () => _showDialog(context, 'Main Button tapped'),
              ),
              const SizedBox(height: 8),
              
              MTButton.secondary(
                titleText: 'Secondary Button',
                onTap: () => _showDialog(context, 'Secondary Button tapped'),
              ),
              const SizedBox(height: 8),
              
              MTButton.danger(
                titleText: 'Danger Button',
                onTap: () => _showDialog(context, 'Danger Button tapped'),
              ),
              const SizedBox(height: 8),
              
              MTButton.safe(
                titleText: 'Safe Button',
                onTap: () => _showDialog(context, 'Safe Button tapped'),
              ),
              const SizedBox(height: 16),
              
              const H3('Icon Buttons'),
              Row(
                children: [
                  MTButton.icon(
                    const Icon(CupertinoIcons.add),
                    onTap: () => _showDialog(context, 'Add icon tapped'),
                  ),
                  const SizedBox(width: 8),
                  MTButton.icon(
                    const Icon(CupertinoIcons.heart),
                    onTap: () => _showDialog(context, 'Heart icon tapped'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              const H2('Adaptive Layout'),
              const SizedBox(height: 8),
              
              MTAdaptive.xxs(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const BaseText('XXS Adaptive Container'),
                ),
              ),
              const SizedBox(height: 8),
              
              MTAdaptive.s(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const BaseText('S Adaptive Container'),
                ),
              ),
              const SizedBox(height: 16),
              
              const H2('Colors'),
              const SizedBox(height: 8),
              
              _ColorDemo(),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Button Pressed'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

class _ColorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiColors = colors;
    
    return Column(
      children: [
        _ColorRow('Background Colors', [
          _ColorItem('B0', uiColors.b0Color),
          _ColorItem('B1', uiColors.b1Color),
          _ColorItem('B2', uiColors.b2Color),
          _ColorItem('B3', uiColors.b3Color),
        ]),
        const SizedBox(height: 8),
        
        _ColorRow('Text Colors', [
          _ColorItem('F1', uiColors.f1Color),
          _ColorItem('F2', uiColors.f2Color),
          _ColorItem('F3', uiColors.f3Color),
        ]),
        const SizedBox(height: 8),
        
        _ColorRow('Accent Colors', [
          _ColorItem('Main', uiColors.mainColor),
          _ColorItem('Danger', uiColors.dangerColor),
          _ColorItem('Safe', uiColors.safeColor),
        ]),
      ],
    );
  }
}

class _ColorRow extends StatelessWidget {
  const _ColorRow(this.title, this.colors);
  
  final String title;
  final List<_ColorItem> colors;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText.medium(title),
        const SizedBox(height: 4),
        Row(
          children: colors.map((color) => 
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: color,
            ),
          ).toList(),
        ),
      ],
    );
  }
}

class _ColorItem extends StatelessWidget {
  const _ColorItem(this.label, this.color);
  
  final String label;
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: CupertinoColors.systemGrey),
          ),
        ),
        const SizedBox(height: 4),
        SmallText(label),
      ],
    );
  }
}

// Демо конфигурация
const _demoConfig = UIKitConfig(
  // Цвета фона
  b0Color: Color(0xFF1A1A1A),
  b1Color: Color(0xFF2A2A2A),
  b2Color: Color(0xFF3A3A3A),
  b3Color: Color(0xFFF5F5F5),
  
  // Цвета текста
  f1Color: Color(0xFF1A1A1A),
  f2Color: Color(0xFF666666),
  f3Color: Color(0xFF999999),
  
  // Акцентные цвета
  mainColor: Color(0xFF007AFF),
  dangerColor: Color(0xFFFF3B30),
  safeColor: Color(0xFF34C759),
  warningColor: Color(0xFFFF9500),
  
  // Специальные цвета
  mainBtnTitleColor: Color(0xFFFFFFFF),
  navbarColor: Color(0xFFFFFFFF),
  defaultBarrierColor: Color(0x80000000),
  
  // Типографика
  baseFontSize: 16.0,
  fontFamily: 'SF Pro Text',
  fontFamilyNumbers: 'SF Mono',
  fontFamilyDecorative: 'SF Pro Display',
  
  // Spacing
  baseSpacing: 6.0,
  
  // Border radius
  defaultBorderRadius: 12.0,
  
  // Elevation
  cardElevation: 1.0,
  buttonElevation: 1.0,
  
  // Размеры
  minButtonHeight: 48.0,
  defaultBarHeight: 48.0,
  tappableIconSize: 36.0,
);
