// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class IconsDemo extends StatelessWidget {
  const IconsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // MTIcon Components
        MTListText.h3('MTIcon Components'),
        const SizedBox(height: DEF_VP),
        const MTListTile(
          middle: Wrap(
            spacing: DEF_VP,
            runSpacing: DEF_VP,
            children: [
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

        const SizedBox(height: DEF_HP),

        // MTSvgIcon
        MTListText.h3('MTSvgIcon'),
        const SizedBox(height: DEF_VP),
        const MTListText('SVG icons from assets/icons/ directory'),
        const SizedBox(height: DEF_VP),
        MTListTile(
          middle: Column(
            children: [
              Wrap(
                spacing: DEF_VP,
                runSpacing: DEF_VP,
                children: [
                  MTSvgIcon('home', size: 32, color: context.colorScheme.mainColor),
                  MTSvgIcon('user', size: 32, color: context.colorScheme.dangerColor),
                  MTSvgIcon('star', size: 32, color: context.colorScheme.warningColor),
                ],
              ),
              const SizedBox(height: DEF_VP),
              Container(
                padding: const EdgeInsets.all(DEF_VP),
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorScheme.f3Color.resolve(context)),
                  borderRadius: BorderRadius.circular(P),
                ),
                child: const BaseText('Usage: MTSvgIcon("icon_name")\n'
                    'SVG files are in assets/icons/\n'
                    'and declared in pubspec.yaml\n\n'
                    'Example:\n'
                    'MTSvgIcon("home", size: 24)\n'
                    'MTSvgIcon("user", color: Colors.blue)'),
              ),
            ],
          ),
        ),

        const SizedBox(height: DEF_HP),

        // MTSvgImage
        MTListText.h3('MTSvgImage'),
        const SizedBox(height: DEF_VP),
        const MTListText('SVG images from assets/images/ directory'),
        const SizedBox(height: DEF_VP),
        MTListTile(
          middle: Column(
            children: [
              const Wrap(
                spacing: DEF_VP,
                runSpacing: DEF_VP,
                children: [
                  MTSvgImage('home', width: 60, height: 60),
                  MTSvgImage('user', width: 60, height: 60),
                  MTSvgImage('star', width: 60, height: 60),
                ],
              ),
              const SizedBox(height: DEF_VP),
              Container(
                padding: const EdgeInsets.all(DEF_VP),
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorScheme.f3Color.resolve(context)),
                  borderRadius: BorderRadius.circular(P),
                ),
                child: const BaseText('Usage: MTSvgImage("image_name")\n'
                    'SVG images are in assets/images/\n'
                    'for larger graphics and illustrations\n\n'
                    'Example:\n'
                    'MTSvgImage("banner", width: 200)\n'
                    'MTSvgImage("logo", height: 100)'),
              ),
            ],
          ),
        ),

        const SizedBox(height: DEF_HP),

        // MTImage
        MTListText.h3('MTImage'),
        const SizedBox(height: DEF_VP),
        const MTListText('Images from assets/ directory'),
        const SizedBox(height: DEF_VP),
        MTListTile(
          middle: Column(
            children: [
              const Center(
                child: MTImage('no_info', height: 80, width: 80),
              ),
              const SizedBox(height: DEF_VP),
              Container(
                padding: const EdgeInsets.all(DEF_VP),
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorScheme.f3Color.resolve(context)),
                  borderRadius: BorderRadius.circular(P),
                ),
                child: const BaseText('Usage: MTImage("asset_name")\n'
                    'Images are in assets/images/\n'
                    'and declared in pubspec.yaml\n\n'
                    'Example:\n'
                    'MTImage("no_info", height: 50)\n'
                    'MTImage("no_info", width: 200)'),
              ),
            ],
          ),
        ),

        const SizedBox(height: DEF_HP),

        // MTNetworkImage
        MTListText.h3('MTNetworkImage'),
        const SizedBox(height: DEF_VP),
        const MTListText('Network images with fallback support'),
        const SizedBox(height: DEF_VP),
        MTListTile(
          middle: Column(
            children: [
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
              const SizedBox(height: DEF_VP),
              Container(
                padding: const EdgeInsets.all(DEF_VP),
                decoration: BoxDecoration(
                  border: Border.all(color: context.colorScheme.f3Color.resolve(context)),
                  borderRadius: BorderRadius.circular(P),
                ),
                child: const BaseText('Usage: MTNetworkImage(url)\n'
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
