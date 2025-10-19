// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

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
    showMTDialog(
      MTDialog(
        topBar: const MTTopBar(pageTitle: 'Select Country'),
        body: SingleChildScrollView(
          child: Column(
            children: countries.map((country) {
              return MTListTile(
                color: context.colorScheme.b3Color,
                leading: country.icon ?? MTIcon(Icons.flag, color: context.colorScheme.mainColor.resolve(context)),
                middle: BaseText('${country.name} ', maxLines: 1),
                trailing: BaseText.f2('+${country.code}', maxLines: 1),
                onTap: () {
                  Navigator.of(context).pop();
                  onChangeCountry(country);
                },
              );
            }).toList(),
          ),
        ),
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MTListTile(
      leading: MTButton(
        type: MTButtonType.card,
        middle: country.icon ?? MTIcon(Icons.flag, color: context.colorScheme.mainColor.resolve(context)),
        trailing: const ChevronDownIcon(),
        padding: EdgeInsets.symmetric(horizontal: context.sizing.smallSpacing),
        onTap: () => _showCountrySelector(context),
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
