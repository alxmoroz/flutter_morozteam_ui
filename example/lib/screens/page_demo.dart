// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class PageDemo extends StatelessWidget {
  const PageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MTListText.h2('MTPage Component'),
        SizedBox(height: context.sizing.vPadding),
        const MTListText('The MTPage component you\'re currently viewing includes:'),
        SizedBox(height: context.sizing.vPadding),
        const MTListText('• MTNavBar with title and actions'),
        const MTListText('• MTBottomBar with tab navigation'),
        const MTListText('• Scrollable body with shadow effects'),
        const MTListText('• Safe area and keyboard handling'),
        const MTListText('• Responsive breakpoints'),
        const MTListText('• Background wrapper'),
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('Example Usage'),
        SizedBox(height: context.sizing.vPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MTListText('Basic MTPage structure:'),
              SizedBox(height: context.sizing.vPadding),
              Container(
                padding: EdgeInsets.all(context.sizing.vPadding),
                decoration: BoxDecoration(
                  color: context.colorScheme.b3Color.resolve(context),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '''MTPage(
  navBar: MTNavBar(pageTitle: 'Demo'),
  body: YourContent(),
  bottomBar: MTBottomBar(...),
)''',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('Features'),
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
      ],
    );
  }
}
