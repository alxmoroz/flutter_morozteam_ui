// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/colors.dart';
import '../theme/constants.dart';
import '../theme/text.dart';
import 'button.dart';
import 'icons.dart';
import 'list_tile.dart';
import 'text_field.dart';

// Phone country data structure
class PhoneCountry {
  const PhoneCountry({
    required this.code,
    required this.name,
    required this.mask,
    required this.iconPath,
  });

  final String code;
  final String name;
  final String mask;
  final String iconPath;

  static const List<PhoneCountry> values = [
    PhoneCountry(code: '7', name: 'Russia', mask: '(###) ###-##-##', iconPath: 'assets/flags/ru.png'),
    PhoneCountry(code: '1', name: 'United States', mask: '(###) ###-####', iconPath: 'assets/flags/us.png'),
    PhoneCountry(code: '44', name: 'United Kingdom', mask: '#### ### ####', iconPath: 'assets/flags/gb.png'),
    PhoneCountry(code: '49', name: 'Germany', mask: '### ########', iconPath: 'assets/flags/de.png'),
    PhoneCountry(code: '33', name: 'France', mask: '# ## ## ## ##', iconPath: 'assets/flags/fr.png'),
  ];

  String maskText(String text) {
    final digits = text.replaceAll(RegExp(r'[^\d]'), '');
    final buffer = StringBuffer();
    int digitIndex = 0;
    
    for (int i = 0; i < mask.length && digitIndex < digits.length; i++) {
      if (mask[i] == '#') {
        buffer.write(digits[digitIndex]);
        digitIndex++;
      } else {
        buffer.write(mask[i]);
      }
    }
    
    return buffer.toString();
  }
}

class _PhoneCountrySelectorDialog extends StatelessWidget {
  const _PhoneCountrySelectorDialog(this._onChangeCountry);
  final Function(PhoneCountry) _onChangeCountry;

  void _selectCountry(BuildContext context, PhoneCountry country) {
    Navigator.of(context).pop();
    _onChangeCountry(country);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(constants.P3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const H2('Select Country'),
          SizedBox(height: constants.P2),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: PhoneCountry.values.length,
              itemBuilder: (_, index) {
                final country = PhoneCountry.values[index];
                return MTListTile(
                  color: colors.b3Color,
                  leading: Icon(Icons.flag, color: colors.mainColor),
                  middle: BaseText('${country.name} ', maxLines: 1),
                  trailing: BaseText.f2('+${country.code}', maxLines: 1),
                  onTap: () => _selectCountry(context, country),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MTPhoneField extends StatelessWidget {
  const MTPhoneField({
    required this.controller,
    required this.country,
    required this.onChangeCountry,
    this.onSubmit,
    this.autofocus = false,
    this.label = 'Phone Number',
    super.key,
  });

  final TextEditingController? controller;
  final PhoneCountry country;
  final Function(PhoneCountry) onChangeCountry;
  final Function(String)? onSubmit;
  final bool autofocus;
  final String label;

  void _showCountrySelector(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: _PhoneCountrySelectorDialog(onChangeCountry),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MTListTile(
      leading: SizedBox(
        width: constants.P8 * 2,
        child: MTButton(
          type: MTButtonType.card,
          middle: Icon(Icons.flag, color: colors.mainColor),
          trailing: const ChevronDownIcon(),
          padding: EdgeInsets.symmetric(horizontal: constants.P2),
          onTap: () => _showCountrySelector(context),
        ),
      ),
      middle: MTTextField(
        controller: controller,
        margin: EdgeInsets.zero,
        autofocus: autofocus,
        label: label,
        keyboardType: TextInputType.phone,
        onSubmit: onSubmit,
        maxLines: 1,
        inputFormatters: [
          TextInputFormatter.withFunction((_, v) {
            if (v.text.isNotEmpty) {
              String formattedValue = country.maskText(v.text);
              final selectionOffset = v.selection.baseOffset + (formattedValue.length - v.text.length);
              v = v.copyWith(
                text: formattedValue,
                selection: TextSelection.collapsed(offset: selectionOffset),
              );
            }
            return v;
          })
        ],
      ),
    );
  }
}
