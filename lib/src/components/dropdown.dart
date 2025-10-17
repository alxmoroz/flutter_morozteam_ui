// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/constants.dart';
import '../theme/text.dart';
import 'text_field.dart';

/// Выпадающий список
class MTDropdown<T> extends StatelessWidget {
  const MTDropdown({
    super.key,
    required this.label,
    this.helper,
    this.onChanged,
    this.value,
    this.ddItems,
    this.items,
    this.margin,
  }) : assert((ddItems == null && items != null) || (ddItems != null && items == null));

  final Function(T?)? onChanged;
  final T? value;
  final List<T>? items;
  final List<DropdownMenuItem<T>>? ddItems;
  final String label;
  final String? helper;
  final EdgeInsets? margin;

  List<DropdownMenuItem<T>> get _ddItems =>
      ddItems ??
      [
        for (int i = 0; i < items!.length; i++)
          DropdownMenuItem<T>(
            value: items![i],
            child: BaseText('${items![i]}'),
          ),
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      height: constants.P10,
      alignment: Alignment.centerLeft,
      child: DropdownButtonFormField<T>(
        dropdownColor: colors.b3Color.resolve(context),
        focusColor: colors.b3Color.resolve(context),
        isDense: true,
        decoration: tfDecoration(
          context,
          label: label,
          helper: helper,
          readOnly: true,
        ),
        icon: const Icon(Icons.keyboard_arrow_down),
        items: _ddItems,
        isExpanded: true,
        initialValue: value,
        onChanged: onChanged,
        borderRadius: BorderRadius.circular(constants.defBorderRadius),
      ),
    );
  }
}
