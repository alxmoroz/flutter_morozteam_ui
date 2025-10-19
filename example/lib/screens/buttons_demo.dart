// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class ButtonsDemo extends StatelessWidget {
  const ButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MTListText.h3('Button Types'),
        SizedBox(height: context.sizing.verticalPadding),
        MTButton.main(titleText: 'MTButton.main', onTap: () {}),
        SizedBox(height: context.sizing.verticalPadding),
        MTButton.main(titleText: 'Main Button Disabled'),
        SizedBox(height: context.sizing.verticalPadding),
        MTButton.main(titleText: 'Loading Button', loading: true, onTap: () {}),
        SizedBox(height: context.sizing.verticalPadding),
        MTButton.secondary(titleText: 'MTButton.secondary', onTap: () {}),
        SizedBox(height: context.sizing.verticalPadding),
        MTButton.danger(titleText: 'MTButton.danger', onTap: () {}),
        SizedBox(height: context.sizing.verticalPadding),
        MTButton.safe(titleText: 'MTButton.safe', onTap: () {}),
        SizedBox(height: context.sizing.verticalPadding),
        Align(child: MTButton(titleText: 'MTButton', onTap: () {})),
        SizedBox(height: context.sizing.horizontalPadding),
        MTListText.h3('Icon Buttons'),
        MTListTile(
          middle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MTButton.icon(const PlusIcon(), onTap: () {}),
              MTButton.icon(const CloseIcon(), onTap: () {}),
              MTButton.icon(const CheckIcon(), onTap: () {}),
              MTButton.icon(const SearchIcon(), onTap: () {}),
              MTButton.icon(const SettingsIcon(), onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
