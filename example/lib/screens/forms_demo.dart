// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class FormsDemo extends StatefulWidget {
  const FormsDemo({super.key});

  @override
  State<FormsDemo> createState() => _FormsDemoState();
}

class _FormsDemoState extends State<FormsDemo> {
  final _textController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _checkbox1 = false;
  bool _checkbox2 = true;
  String? _dropdown = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const H2('Text Fields'),
        SizedBox(height: constants.P2),
        MTTextField(
          controller: _textController,
          label: 'Username',
          hint: 'Enter your username',
          helper: 'This is a helper text',
        ),
        MTTextField.email(
          controller: _emailController,
          label: 'Email',
          hint: 'example@email.com',
        ),
        MTTextField.password(
          controller: _passwordController,
          label: 'Password',
          hint: 'Enter password',
        ),
        const MTTextField(
          label: 'Message',
          hint: 'Enter your message',
          maxLines: 4,
        ),
        SizedBox(height: constants.P3),
        const H2('Checkboxes'),
        SizedBox(height: constants.P2),
        MTCard(
          child: Column(
            children: [
              MTCheckBoxTile(
                title: 'Enable notifications',
                description: 'Receive push notifications',
                value: _checkbox1,
                onChanged: (value) => setState(() => _checkbox1 = value ?? false),
              ),
              MTCheckBoxTile(
                title: 'Auto-update',
                description: 'Update app automatically',
                value: _checkbox2,
                onChanged: (value) => setState(() => _checkbox2 = value ?? false),
                bottomDivider: true,
              ),
            ],
          ),
        ),
        SizedBox(height: constants.P3),
        const H2('Dropdown'),
        SizedBox(height: constants.P2),
        MTDropdown<String>(
          label: 'Select option',
          value: _dropdown,
          items: const ['Option 1', 'Option 2', 'Option 3'],
          onChanged: (value) => setState(() => _dropdown = value),
        ),
        SizedBox(height: constants.P3),
        MTButton.main(
          titleText: 'Submit Form',
          onTap: () => _showMessage(context, 'Form submitted!'),
        ),
      ],
    );
  }

  void _showMessage(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
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
