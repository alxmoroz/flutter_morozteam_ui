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
    this.icon,
  });

  final String code;
  final String name;
  final String mask;
  final Widget? icon;

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
  const _PhoneCountrySelectorDialog(
    this._onChangeCountry,
    this._countries,
    this._title,
  );
  
  final Function(PhoneCountry) _onChangeCountry;
  final List<PhoneCountry> _countries;
  final String _title;

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
          H2(_title),
          SizedBox(height: constants.P2),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _countries.length,
              itemBuilder: (_, index) {
                final country = _countries[index];
                return MTListTile(
                  color: colors.b3Color,
                  leading: country.icon ?? Icon(Icons.flag, color: colors.mainColor),
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
    required this.countries,
    required this.onChangeCountry,
    this.onSubmit,
    this.autofocus = false,
    this.label,
    this.selectorTitle,
    super.key,
  });

  final TextEditingController? controller;
  final PhoneCountry country;
  final List<PhoneCountry> countries;
  final Function(PhoneCountry) onChangeCountry;
  final Function(String)? onSubmit;
  final bool autofocus;
  final String? label;
  final String? selectorTitle;

  void _showCountrySelector(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: _PhoneCountrySelectorDialog(
          onChangeCountry,
          countries,
          selectorTitle ?? 'Select Country',
        ),
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
          middle: country.icon ?? Icon(Icons.flag, color: colors.mainColor),
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
