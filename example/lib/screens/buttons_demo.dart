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
        const SizedBox(height: DEF_VP),
        MTButton.main(titleText: 'MTButton.main', onTap: () {}),
        const SizedBox(height: DEF_VP),
        MTButton.main(titleText: 'Main Button Disabled'),
        const SizedBox(height: DEF_VP),
        MTButton.main(titleText: 'Loading Button', loading: true, onTap: () {}),
        const SizedBox(height: DEF_VP),
        MTButton.secondary(titleText: 'MTButton.secondary', onTap: () {}),
        const SizedBox(height: DEF_VP),
        MTButton.danger(titleText: 'MTButton.danger', onTap: () {}),
        const SizedBox(height: DEF_VP),
        MTButton.safe(titleText: 'MTButton.safe', onTap: () {}),
        const SizedBox(height: DEF_VP),
        Align(child: MTButton(titleText: 'MTButton', onTap: () {})),
        const SizedBox(height: DEF_HP),
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
