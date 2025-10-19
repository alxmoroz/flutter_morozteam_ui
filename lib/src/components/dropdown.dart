// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../config/ui_theme.dart';
import '../theme/resolved_color.dart';
import '../theme/text.dart';
import 'icons.dart';
import 'text_field.dart';

/// Dropdown list
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
      height: (context.sizing.p * 20),
      alignment: Alignment.centerLeft,
      child: DropdownButtonFormField<T>(
        dropdownColor: context.colorScheme.b3Color.resolve(context),
        focusColor: context.colorScheme.b3Color.resolve(context),
        isDense: true,
        decoration: tfDecoration(
          context,
          label: label,
          helper: helper,
          readOnly: true,
        ),
        icon: const ChevronDownIcon(),
        items: _ddItems,
        isExpanded: true,
        initialValue: value,
        onChanged: onChanged,
        borderRadius: BorderRadius.circular(context.sizing.defBorderRadius),
      ),
    );
  }
}
