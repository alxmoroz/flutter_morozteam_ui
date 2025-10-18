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
        // MTNavBar Example
        const H2('MTNavBar'),
        SizedBox(height: constants.P2),
        MTButton.main(
          titleText: 'Show MTNavBar Dialog',
          onTap: () => _showNavBarDialog(context),
        ),
        SizedBox(height: constants.P3),

        // MTSvgIcon Example
        const H2('MTSvgIcon'),
        SizedBox(height: constants.P2),
        MTButton.secondary(
          titleText: 'Show MTSvgIcon Info',
          onTap: () => _showSvgIconInfo(context),
        ),
        SizedBox(height: constants.P3),

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
            // No data (icon fallback)
            MTAvatar(20),
            // Large with initials
            MTAvatar(40, initials: 'JD'),
            // Large with Gravatar and border
            MTAvatar(40, gravatarEmail: 'jane.smith@example.com', borderColor: CupertinoColors.systemGreen),
            // With both initials and Gravatar (Gravatar priority)
            MTAvatar(40, initials: 'JS', gravatarEmail: 'test@example.com'),
          ],
        ),
        SizedBox(height: constants.P3),
        const H2('Image Examples'),
        SizedBox(height: constants.P2),
        const MTImage('no_info', height: 100, width: 100),
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
      showMTSnackbar('Result: $result');
    }
  }

  void _showSnackbar(BuildContext context) async {
    await showMTSnackbar(
      'This is a snackbar dialog example',
      onTap: () {
        showMTSnackbar('Snackbar tapped!');
      },
    );
  }

  void _showNavBarDialog(BuildContext context) async {
    await showMTDialog(
      MTDialog(
        topBar: const MTNavBar(
          pageTitle: 'Navigation Bar',
        ),
        body: Container(
          height: 300,
          color: context.uiConfig.b2Color.resolve(context),
          child: const Center(
            child: H3('Full screen navigation bar example'),
          ),
        ),
      ),
    );
  }

  void _showSvgIconInfo(BuildContext context) async {
    await showMTAlertDialog(
      title: 'SVG Icons',
      description: 'MTSvgIcon loads SVG files from assets/icons/\n\n'
          'Example: MTSvgIcon("icon_name")\n\n'
          'Note: SVG assets need to be provided by the app',
      actions: [
        const MTDialogAction(title: 'OK', result: 'ok', type: MTButtonType.main),
      ],
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
