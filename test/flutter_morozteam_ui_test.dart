import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_morozteam_ui/flutter_morozteam_ui.dart';

void main() {
  test('UIKitConfig creates valid configuration', () {
    const config = UIKitConfig(
      b0Color: Color(0xFF1A1A1A),
      b1Color: Color(0xFF2A2A2A),
      b2Color: Color(0xFF3A3A3A),
      b3Color: Color(0xFFF5F5F5),
      f1Color: Color(0xFF1A1A1A),
      f2Color: Color(0xFF666666),
      f3Color: Color(0xFF999999),
      mainColor: Color(0xFF007AFF),
      dangerColor: Color(0xFFFF3B30),
    );

    expect(config.baseSpacing, 6.0);
    expect(config.baseFontSize, 16.0);
    expect(config.minButtonHeight, 48.0);
  });
}
