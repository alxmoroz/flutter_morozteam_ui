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
        SizedBox(height: context.sizing.vPadding),
        MTButton.main(titleText: 'MTButton.main', onTap: () {}),
        SizedBox(height: context.sizing.vPadding),
        MTButton.main(titleText: 'Main Button Disabled'),
        SizedBox(height: context.sizing.vPadding),
        MTButton.main(titleText: 'Loading Button', loading: true, onTap: () {}),
        SizedBox(height: context.sizing.vPadding),
        MTButton.secondary(titleText: 'MTButton.secondary', onTap: () {}),
        SizedBox(height: context.sizing.vPadding),
        MTButton.danger(titleText: 'MTButton.danger', onTap: () {}),
        SizedBox(height: context.sizing.vPadding),
        MTButton.safe(titleText: 'MTButton.safe', onTap: () {}),
        SizedBox(height: context.sizing.vPadding),
        Align(child: MTButton(titleText: 'MTButton', onTap: () {})),
        SizedBox(height: context.sizing.hPadding),
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
        SizedBox(height: context.sizing.hPadding),
        MTListText.h3('Button V2 Components'),
        SizedBox(height: context.sizing.vPadding),
        MTButtonV2(
          type: MTButtonType.main,
          titleText: 'MTButtonV2.main',
          onTap: () {},
        ),
        SizedBox(height: context.sizing.vPadding),
        MTButtonV2(
          type: MTButtonType.secondary,
          titleText: 'MTButtonV2.secondary',
          onTap: () {},
        ),
        SizedBox(height: context.sizing.vPadding),
        MTButtonV2(
          type: MTButtonType.danger,
          titleText: 'MTButtonV2.danger',
          onTap: () {},
        ),
        SizedBox(height: context.sizing.vPadding),
        MTButtonV2(
          type: MTButtonType.safe,
          titleText: 'MTButtonV2.safe',
          onTap: () {},
        ),
        SizedBox(height: context.sizing.vPadding),
        MTButtonV2(
          type: MTButtonType.text,
          titleText: 'MTButtonV2.text',
          onTap: () {},
        ),
        SizedBox(height: context.sizing.vPadding),
        MTButtonV2(
          type: MTButtonType.card,
          titleText: 'MTButtonV2.card',
          onTap: () {},
        ),
        SizedBox(height: context.sizing.vPadding),
        MTButtonV2(
          type: MTButtonType.icon,
          icon: const PlusIcon(),
          onTap: () {},
        ),
      ],
    );
  }
}
