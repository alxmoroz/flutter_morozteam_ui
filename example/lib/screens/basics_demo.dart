// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class BasicsDemo extends StatelessWidget {
  const BasicsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Typography Section
        MTListText.h2('Typography'),
        SizedBox(height: context.sizing.vPadding),
        MTListText.h1('H1 - Heading 1'),
        MTListText.h2('H2 - Heading 2'),
        MTListText.h3('H3 - Heading 3'),
        MTListText.h4('H4 - Heading 4'),
        const MTListText('MText - Regular'),
        MTListText.medium('MText.medium — Medium'),
        MTListText.small('MText.small - Small text'),
        MTListText.numbers('MText.numbers: 123,456.78'),
        MTListText.link('MText.link - Link'),
        MTListTile(middle: MText.f2('MText.f2 - Secondary text color')),
        MTListTile(middle: MText.f3('MText.f3 - Tertiary text color')),
        SizedBox(height: context.sizing.hPadding),

        // Color Palette Section
        MTListText.h3('Color Palette'),
        MTCard(
          margin: context.sizing.defMargin,
          padding: context.sizing.defPadding,
          child: _ColorPalette(),
        ),
        SizedBox(height: context.sizing.hPadding),

        // Icons Section
        MTListText.h2('Icons'),
        SizedBox(height: context.sizing.vPadding),

        // MTIcon Components
        MTListText.h3('MTIcon Components'),
        MTCard(
          margin: context.sizing.defMargin,
          padding: context.sizing.defPadding,
          child: Wrap(
            spacing: context.sizing.vPadding,
            runSpacing: context.sizing.vPadding,
            children: const [
              PlusIcon(size: 32),
              CloseIcon(size: 32),
              BackIcon(size: 32),
              CheckIcon(size: 32),
              InfoIcon(size: 32),
              WarningIcon(size: 32),
              EditIcon(size: 32),
              DeleteIcon(size: 32),
              SearchIcon(size: 32),
              SettingsIcon(size: 32),
              MenuIcon(size: 32),
              ChevronDownIcon(size: 32),
              ChevronUpIcon(size: 32),
              ChevronRightIcon(size: 32),
              ChevronLeftIcon(size: 32),
            ],
          ),
        ),

        SizedBox(height: context.sizing.hPadding),

        // MTSvgIcon
        MTListText.h3('MTSvgIcon'),
        MTCard(
          margin: context.sizing.defMargin,
          padding: context.sizing.defPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MText('SVG icons from assets/icons/ directory'),
              SizedBox(height: context.sizing.vPadding),
              Wrap(
                spacing: context.sizing.vPadding,
                runSpacing: context.sizing.vPadding,
                children: [
                  MTSvgIcon('home', size: 32, color: context.colorScheme.mainColor),
                  MTSvgIcon('user', size: 32, color: context.colorScheme.dangerColor),
                  MTSvgIcon('star', size: 32, color: context.colorScheme.warningColor),
                ],
              ),
              SizedBox(height: context.sizing.vPadding),
              Container(
                padding: EdgeInsets.all(context.sizing.vPadding),
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorScheme.f3Color.resolve(context)),
                  borderRadius: BorderRadius.circular(context.sizing.smallSpacing),
                ),
                child: const MText('Usage: MTSvgIcon("icon_name")\n'
                    'SVG files are in assets/icons/\n'
                    'and declared in pubspec.yaml\n\n'
                    'Example:\n'
                    'MTSvgIcon("home", size: 24)\n'
                    'MTSvgIcon("user", color: Colors.blue)'),
              ),
            ],
          ),
        ),

        SizedBox(height: context.sizing.hPadding),

        // MTSvgImage
        MTListText.h3('MTSvgImage'),
        MTCard(
          margin: context.sizing.defMargin,
          padding: context.sizing.defPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MText('SVG images from assets/images/ directory'),
              SizedBox(height: context.sizing.vPadding),
              Wrap(
                spacing: context.sizing.vPadding,
                runSpacing: context.sizing.vPadding,
                children: const [
                  MTSvgImage('home', width: 60, height: 60),
                  MTSvgImage('user', width: 60, height: 60),
                  MTSvgImage('star', width: 60, height: 60),
                ],
              ),
              SizedBox(height: context.sizing.vPadding),
              Container(
                padding: EdgeInsets.all(context.sizing.vPadding),
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorScheme.f3Color.resolve(context)),
                  borderRadius: BorderRadius.circular(context.sizing.smallSpacing),
                ),
                child: const MText('Usage: MTSvgImage("image_name")\n'
                    'SVG images are in assets/images/\n'
                    'for larger graphics and illustrations\n\n'
                    'Example:\n'
                    'MTSvgImage("banner", width: 200)\n'
                    'MTSvgImage("logo", height: 100)'),
              ),
            ],
          ),
        ),

        SizedBox(height: context.sizing.hPadding),

        // MTImage
        MTListText.h3('MTImage'),
        MTCard(
          margin: context.sizing.defMargin,
          padding: context.sizing.defPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MText('Images from assets/ directory'),
              SizedBox(height: context.sizing.vPadding),
              const Center(
                child: MTImage('no_info', height: 80, width: 80),
              ),
              SizedBox(height: context.sizing.vPadding),
              Container(
                padding: EdgeInsets.all(context.sizing.vPadding),
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorScheme.f3Color.resolve(context)),
                  borderRadius: BorderRadius.circular(context.sizing.smallSpacing),
                ),
                child: const MText('Usage: MTImage("asset_name")\n'
                    'Images are in assets/images/\n'
                    'and declared in pubspec.yaml\n\n'
                    'Example:\n'
                    'MTImage("no_info", height: 50)\n'
                    'MTImage("no_info", width: 200)'),
              ),
            ],
          ),
        ),

        SizedBox(height: context.sizing.hPadding),

        // MTNetworkImage
        MTListText.h3('MTNetworkImage'),
        MTCard(
          margin: context.sizing.defMargin,
          padding: context.sizing.defPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MText('Network images with fallback support'),
              SizedBox(height: context.sizing.vPadding),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Valid URL example - GitHub avatar
                  MTNetworkImage(
                    'https://avatars.githubusercontent.com/u/1?v=4',
                    height: 80,
                    width: 80,
                  ),
                  // Another valid URL - httpbin image
                  MTNetworkImage(
                    'https://httpbin.org/image/png',
                    height: 80,
                    width: 80,
                  ),
                  // Invalid URL with fallback - shows fallback
                  MTNetworkImage(
                    'https://invalid-url.com/image.png',
                    height: 80,
                    width: 80,
                    fallbackName: 'no_info',
                  ),
                ],
              ),
              SizedBox(height: context.sizing.vPadding),
              Container(
                padding: EdgeInsets.all(context.sizing.vPadding),
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorScheme.f3Color.resolve(context)),
                  borderRadius: BorderRadius.circular(context.sizing.smallSpacing),
                ),
                child: const MText('Usage: MTNetworkImage(url)\n'
                    'Loads images from network URLs\n'
                    'with automatic fallback support\n\n'
                    'Example:\n'
                    'MTNetworkImage("https://...", height: 100)\n'
                    'MTNetworkImage(url, fallbackName: "no_info")'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ColorPalette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = context.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ColorSection('Background', [
          _ColorBox('B0', c.b0Color),
          _ColorBox('B1', c.b1Color),
          _ColorBox('B2', c.b2Color),
          _ColorBox('B3', c.b3Color),
        ]),
        SizedBox(height: context.sizing.vPadding),
        _ColorSection('Foreground', [
          _ColorBox('F1', c.f1Color),
          _ColorBox('F2', c.f2Color),
          _ColorBox('F3', c.f3Color),
        ]),
        SizedBox(height: context.sizing.vPadding),
        _ColorSection('Accent', [
          _ColorBox('Main', c.mainColor),
          _ColorBox('Danger', c.dangerColor),
          _ColorBox('Safe', c.safeColor),
          _ColorBox('Warning', c.warningColor),
        ]),
      ],
    );
  }
}

class _ColorSection extends StatelessWidget {
  const _ColorSection(this.title, this.colors);

  final String title;
  final List<_ColorBox> colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MText.medium(title),
        SizedBox(height: context.sizing.smallSpacing),
        Wrap(
          spacing: context.sizing.smallSpacing,
          runSpacing: context.sizing.smallSpacing,
          children: colors,
        ),
      ],
    );
  }
}

class _ColorBox extends StatelessWidget {
  const _ColorBox(this.label, this.color);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.resolve(context),
            borderRadius: BorderRadius.circular(context.sizing.smallSpacing),
            border: Border.all(color: context.colorScheme.f3Color.resolve(context)),
          ),
        ),
        SizedBox(height: context.sizing.borderWidth),
        MText.small(label),
      ],
    );
  }
}
