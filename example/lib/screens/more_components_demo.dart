// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class MoreComponentsDemo extends StatefulWidget {
  const MoreComponentsDemo({super.key});

  @override
  State<MoreComponentsDemo> createState() => _MoreComponentsDemoState();
}

class _MoreComponentsDemoState extends State<MoreComponentsDemo> {
  bool _checkboxValue = false;
  final bool _checkboxDisabled = false;
  final List<String> _refreshItems = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MTListText.h3('MTCheckBoxTile'),
        SizedBox(height: context.sizing.vPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            children: [
              MTCheckBoxTile(
                title: 'Enabled Checkbox',
                value: _checkboxValue,
                onChanged: (value) => setState(() => _checkboxValue = value ?? false),
              ),
              MTCheckBoxTile(
                title: 'Disabled Checkbox',
                value: _checkboxDisabled,
                onChanged: null,
              ),
              MTCheckBoxTile(
                title: 'Checkbox with Description',
                description: 'This checkbox has a longer description text',
                value: _checkboxValue,
                onChanged: (value) => setState(() => _checkboxValue = value ?? false),
                bottomDivider: true,
              ),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('MTRefresh'),
        SizedBox(height: context.sizing.vPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: SizedBox(
            height: 300,
            child: MTRefresh(
              onRefresh: () async {
                // Simulate network delay
                await Future.delayed(const Duration(seconds: 2));
                setState(() {
                  _refreshItems.shuffle();
                });
              },
              child: ListView.builder(
                itemCount: _refreshItems.length,
                itemBuilder: (context, index) {
                  return MTListTile(
                    titleText: _refreshItems[index],
                    trailing: const ChevronRightIcon(),
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('MTLoader'),
        SizedBox(height: context.sizing.vPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            children: [
              const MTListText('Fullscreen Loader'),
              SizedBox(height: context.sizing.vPadding),
              MTButton.main(
                titleText: 'Show Loader',
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const MTLoader(),
                  );
                  // Auto hide after 3 seconds
                  Future.delayed(const Duration(seconds: 2), () {
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('MTScrollableCentered'),
        SizedBox(height: context.sizing.vPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: SizedBox(
            height: 200,
            child: MTScrollableCentered(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MTListText('Centered Content'),
                  SizedBox(height: context.sizing.vPadding),
                  const MTListText('This content is centered both horizontally and vertically'),
                  SizedBox(height: context.sizing.vPadding),
                  MTButton.main(
                    titleText: 'Centered Button',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('MTShadowed'),
        SizedBox(height: context.sizing.vPadding),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            children: [
              const MTListText('Shadowed Components'),
              SizedBox(height: context.sizing.vPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MTShadowed(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: context.colorScheme.mainColor.resolve(context),
                        borderRadius: BorderRadius.circular(context.sizing.defBorderRadius),
                      ),
                      child: const Icon(
                        CupertinoIcons.star_fill,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                  MTShadowed(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: context.colorScheme.safeColor.resolve(context),
                        borderRadius: BorderRadius.circular(context.sizing.defBorderRadius),
                      ),
                      child: const Icon(
                        CupertinoIcons.checkmark,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                  MTShadowed(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: context.colorScheme.dangerColor.resolve(context),
                        borderRadius: BorderRadius.circular(context.sizing.defBorderRadius),
                      ),
                      child: const Icon(
                        CupertinoIcons.heart_fill,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
