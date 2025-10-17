// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class ButtonsDemo extends StatelessWidget {
  const ButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const H2('Button Types'),
        SizedBox(height: constants.P2),
        MTButton.main(
          titleText: 'Main Button',
          onTap: () => _showMessage(context, 'Main button pressed'),
        ),
        SizedBox(height: constants.P2),
        MTButton.secondary(
          titleText: 'Secondary Button',
          onTap: () => _showMessage(context, 'Secondary button pressed'),
        ),
        SizedBox(height: constants.P2),
        MTButton.danger(
          titleText: 'Danger Button',
          onTap: () => _showMessage(context, 'Danger button pressed'),
        ),
        SizedBox(height: constants.P2),
        MTButton.safe(
          titleText: 'Safe Button',
          onTap: () => _showMessage(context, 'Safe button pressed'),
        ),
        SizedBox(height: constants.P2),
        MTButton(
          titleText: 'Text Button',
          onTap: () => _showMessage(context, 'Text button pressed'),
        ),
        SizedBox(height: constants.P3),
        const H2('Icon Buttons'),
        SizedBox(height: constants.P2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MTButton.icon(
              const PlusIcon(),
              onTap: () => _showMessage(context, 'Add'),
            ),
            MTButton.icon(
              const CloseIcon(),
              onTap: () => _showMessage(context, 'Close'),
            ),
            MTButton.icon(
              const CheckIcon(),
              onTap: () => _showMessage(context, 'Check'),
            ),
            MTButton.icon(
              const SearchIcon(),
              onTap: () => _showMessage(context, 'Search'),
            ),
            MTButton.icon(
              const SettingsIcon(),
              onTap: () => _showMessage(context, 'Settings'),
            ),
          ],
        ),
        SizedBox(height: constants.P3),
        const H2('Loading States'),
        SizedBox(height: constants.P2),
        MTButton.main(
          titleText: 'Loading Button',
          loading: true,
          onTap: () {},
        ),
      ],
    );
  }

  void _showMessage(BuildContext context, String message) {
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
