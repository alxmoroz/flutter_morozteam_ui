// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class NewComponentsDemo extends StatefulWidget {
  const NewComponentsDemo({super.key});

  @override
  State<NewComponentsDemo> createState() => _NewComponentsDemoState();
}

class _NewComponentsDemoState extends State<NewComponentsDemo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MTButton.secondary(
          titleText: 'Show MTDialog',
          onTap: () => _showCustomDialog(context),
          margin: DEF_MARGIN,
        ),
        MTButton.secondary(
          titleText: 'Show MTAlertDialog',
          onTap: () => _showAlertDialog(context),
          margin: DEF_MARGIN,
        ),
        MTButton.secondary(
          titleText: 'Show MTSnackbar',
          onTap: () => _showSnackbar(context),
          margin: DEF_MARGIN,
        ),
        MTListText.h3('MTAvatar'),
        const SizedBox(height: DEF_VP),
        const MTListTile(
          middle: Wrap(
            spacing: DEF_VP,
            runSpacing: DEF_VP,
            children: [
              // Initials only
              MTAvatar(20, initials: 'JD'),
              // Initials with border
              MTAvatar(20, initials: 'AB', borderColor: CupertinoColors.systemBlue),
              // Gravatar
              MTAvatar(20, gravatarEmail: 'john.doe@example.com'),
              // No data (icon fallback)
              MTAvatar(20),
              // Large with initials
              MTAvatar(40, initials: 'JD'),
            ],
          ),
        ),
        MTListText.h3('MTCircle'),
        const SizedBox(height: DEF_VP),
        MTListTile(
          middle: Row(
            children: [
              MTCircle(color: context.colorScheme.mainColor, size: 40),
              const SizedBox(width: DEF_VP),
              MTCircle(color: context.colorScheme.dangerColor, size: 40),
              const SizedBox(width: DEF_VP),
              MTCircle(color: context.colorScheme.safeColor, size: 40),
            ],
          ),
        ),
      ],
    );
  }

  void _showAlertDialog(BuildContext context) async {
    final result = await showMTAlertDialog<String>(
      context: context,
      title: 'Alert Dialog',
      description: 'This is an alert dialog example with three button types',
      actions: [
        const MTDialogAction(title: 'OK', result: 'ok', type: MTButtonType.main),
        const MTDialogAction(title: 'Secondary', result: 'secondary', type: MTButtonType.secondary),
        const MTDialogAction(title: 'Cancel', result: 'cancel', type: MTButtonType.text),
      ],
    );
    if (context.mounted) {
      showMTSnackbar('Result: $result', context: context);
    }
  }

  void _showSnackbar(BuildContext context) async {
    await showMTSnackbar(
      'This is a snackbar dialog example',
      context: context,
      onTap: () {
        showMTSnackbar('Snackbar tapped!', context: context);
      },
    );
  }

  void _showCustomDialog(BuildContext context) async {
    await showMTDialog(
      MTCard(
        padding: const EdgeInsets.all(DEF_HP),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MTListText.h3('Custom Dialog'),
            const SizedBox(height: DEF_VP),
            const MTListText('This is a custom MTDialog with any content'),
            const SizedBox(height: DEF_HP),
            MTButton.main(
              titleText: 'Close',
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      context: context,
    );
  }
}
