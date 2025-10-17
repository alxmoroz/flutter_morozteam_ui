// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class NewComponentsDemo extends StatefulWidget {
  const NewComponentsDemo({super.key});

  @override
  State<NewComponentsDemo> createState() => _NewComponentsDemoState();
}

class _NewComponentsDemoState extends State<NewComponentsDemo> {
  final _phoneController = TextEditingController();

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
        const H2('Alert Dialog'),
        SizedBox(height: constants.P2),
        MTButton.main(
          titleText: 'Show Alert Dialog',
          onTap: () => _showAlertDialog(context),
        ),
        SizedBox(height: constants.P3),
        const H2('Snackbar'),
        SizedBox(height: constants.P2),
        MTButton.secondary(
          titleText: 'Show Snackbar',
          onTap: () => _showSnackbar(context),
        ),
        SizedBox(height: constants.P3),
        const H2('Avatar Examples'),
        SizedBox(height: constants.P2),
        Wrap(
          spacing: constants.P2,
          runSpacing: constants.P2,
          children: const [
            // Initials only
            MTAvatar(20, initials: 'JD'),
            // Initials with border
            MTAvatar(20, initials: 'AB', borderColor: CupertinoColors.systemBlue),
            // Gravatar
            MTAvatar(20, gravatarEmail: 'john.doe@example.com'),
            // Custom URL
            MTAvatar(20, avatarUrl: 'https://picsum.photos/40/40'),
            // No data (icon fallback)
            MTAvatar(20),
            // Large with initials
            MTAvatar(40, initials: 'JD'),
            // Large with Gravatar and border
            MTAvatar(40, gravatarEmail: 'jane.smith@example.com', borderColor: CupertinoColors.systemGreen),
          ],
        ),
        SizedBox(height: constants.P3),
        const H2('Image Examples'),
        SizedBox(height: constants.P2),
        const MTImage('no_info', height: 100, width: 100),
        SizedBox(height: constants.P2),
        const MTNetworkImage('https://picsum.photos/200/200', height: 100, width: 100, fallbackName: 'no_info'),
        SizedBox(height: constants.P3),
        const H2('Field Examples'),
        SizedBox(height: constants.P2),
        const MTField(
          _demoFieldData,
          leading: Icon(Icons.person),
          value: BaseText('John Doe'),
          trailing: Icon(Icons.edit),
        ),
        SizedBox(height: constants.P2),
        const MTField(
          _demoFieldDataEmpty,
          leading: Icon(Icons.email),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        SizedBox(height: constants.P3),
        const H2('Phone Field'),
        SizedBox(height: constants.P2),
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

  void _showAlertDialog(BuildContext context) async {
    final result = await showMTAlertDialog<String>(
      title: 'Alert Dialog',
      description: 'This is an alert dialog example',
      actions: [
        const MTDialogAction(title: 'Cancel', result: 'cancel'),
        const MTDialogAction(title: 'OK', result: 'ok', type: MTButtonType.main),
      ],
    );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Result: $result')),
      );
    }
  }

  void _showSnackbar(BuildContext context) async {
    await showMTSnackbar(
      'This is a snackbar dialog example',
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Snackbar tapped!')),
        );
      },
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
