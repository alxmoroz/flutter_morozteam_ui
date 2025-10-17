// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(constants.P3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const H2('Adaptive Containers'),
          SizedBox(height: constants.P2),
          MTAdaptive.xxs(
            child: Container(
              padding: EdgeInsets.all(constants.P2),
              color: colors.mainColor.resolve(context).withValues(alpha: 0.1),
              child: const BaseText('XXS Container (max 290px)'),
            ),
          ),
          SizedBox(height: constants.P2),
          MTAdaptive.s(
            child: Container(
              padding: EdgeInsets.all(constants.P2),
              color: colors.safeColor.resolve(context).withValues(alpha: 0.1),
              child: const BaseText('S Container (max 480px)'),
            ),
          ),
          SizedBox(height: constants.P3),
          const H2('Shadowed Container'),
          SizedBox(height: constants.P2),
          MTShadowed(
            child: Container(
              height: 200,
              color: colors.b3Color.resolve(context),
              child: const Center(
                child: BaseText('Container with top shadow'),
              ),
            ),
          ),
          SizedBox(height: constants.P3),
          const H2('Background Gradient'),
          SizedBox(height: constants.P2),
          const MTBackgroundWrapper(
            SizedBox(
              height: 150,
              child: Center(
                child: BaseText('Container with gradient background'),
              ),
            ),
          ),
          SizedBox(height: constants.P3),
          const H2('Spacing System'),
          SizedBox(height: constants.P2),
          MTCard(
            padding: EdgeInsets.all(constants.P2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText('P = ${constants.P}'),
                BaseText('P2 = ${constants.P2}'),
                BaseText('P3 = ${constants.P3}'),
                BaseText('P4 = ${constants.P4}'),
                BaseText('P6 = ${constants.P6}'),
                BaseText('P8 = ${constants.P8}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
