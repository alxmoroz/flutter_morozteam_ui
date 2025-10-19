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
  final _phoneController = TextEditingController();
  bool _checkbox1 = false;
  bool _checkbox2 = true;
  String? _dropdown = 'Option 1';

  final List<PhoneCountry> _demoCountries = [
    const PhoneCountry(
      code: '7',
      name: 'Russia',
      mask: '(###) ###-##-##',
      icon: Text('🇷🇺', style: TextStyle(fontSize: 24)),
    ),
    const PhoneCountry(
      code: '1',
      name: 'United States',
      mask: '(###) ###-####',
      icon: Text('🇺🇸', style: TextStyle(fontSize: 24)),
    ),
    const PhoneCountry(
      code: '44',
      name: 'United Kingdom',
      mask: '#### ### ####',
      icon: Text('🇬🇧', style: TextStyle(fontSize: 24)),
    ),
    const PhoneCountry(
      code: '49',
      name: 'Germany',
      mask: '### ########',
      icon: Text('🇩🇪', style: TextStyle(fontSize: 24)),
    ),
    const PhoneCountry(
      code: '33',
      name: 'France',
      mask: '# ## ## ## ##',
      icon: Text('🇫🇷', style: TextStyle(fontSize: 24)),
    ),
  ];

  PhoneCountry _selectedCountry = const PhoneCountry(
    code: '7',
    name: 'Russia',
    mask: '(###) ###-##-##',
    icon: Text('🇷🇺', style: TextStyle(fontSize: 24)),
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MTListText.h3('MTTextField'),
        SizedBox(height: context.sizing.verticalPadding),
        MTTextField(
          controller: _textController,
          label: 'Username',
          hint: 'Enter your username',
          helper: 'This is a helper text',
          margin: context.sizing.defaultMargin,
        ),
        MTTextField.email(
          controller: _emailController,
          label: 'Email',
          hint: 'example@email.com',
          margin: context.sizing.defaultMargin,
        ),
        MTTextField.password(
          controller: _passwordController,
          label: 'Password',
          hint: 'Enter password',
          margin: context.sizing.defaultMargin,
        ),
        MTTextField(
          label: 'Message',
          hint: 'Enter your message',
          maxLines: 4,
          margin: context.sizing.defaultMargin,
        ),
        SizedBox(height: context.sizing.horizontalPadding),
        MTListText.h3('MTCheckBoxTile'),
        SizedBox(height: context.sizing.verticalPadding),
        MTCard(
          margin: context.sizing.defaultMargin,
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
        SizedBox(height: context.sizing.horizontalPadding),
        MTListText.h3('MTDropdown'),
        SizedBox(height: context.sizing.verticalPadding),
        MTDropdown<String>(
          label: 'Select option',
          value: _dropdown,
          items: const ['Option 1', 'Option 2', 'Option 3'],
          onChanged: (value) => setState(() => _dropdown = value),
          margin: context.sizing.defaultMargin,
        ),
        SizedBox(height: context.sizing.horizontalPadding),
        MTButton.main(
          titleText: 'Submit Form',
          onTap: () => _showMessage(context, 'Form submitted!'),
          margin: context.sizing.defaultMargin,
        ),
        SizedBox(height: context.sizing.horizontalPadding),
        MTListText.h3('MTField'),
        SizedBox(height: context.sizing.verticalPadding),
        MTField(
          _demoFieldData,
          value: BaseText('John Doe'),
          trailing: EditIcon(),
          margin: context.sizing.defaultMargin,
        ),
        SizedBox(height: context.sizing.verticalPadding),
        MTField(
          _demoFieldDataEmpty,
          trailing: ChevronRightIcon(),
          margin: context.sizing.defaultMargin,
        ),
        SizedBox(height: context.sizing.horizontalPadding),
        MTListText.h3('MTPhoneField'),
        SizedBox(height: context.sizing.verticalPadding),
        MTPhoneField(
          controller: _phoneController,
          country: _selectedCountry,
          countries: _demoCountries,
          onChangeCountry: (country) => setState(() => _selectedCountry = country),
          label: 'Phone Number',
          selectorTitle: 'Select Country',
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

// Demo data
const _demoFieldData = MTFieldData(
  1,
  label: 'Name',
  placeholder: 'Enter your name',
  text: 'John Doe',
);

const _demoFieldDataEmpty = MTFieldData(
  2,
  label: 'Email',
  placeholder: 'Enter your email',
);
