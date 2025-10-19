import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

void main() {
  test('MTColorScheme creates valid configuration', () {
    const colorScheme = MTColorScheme(
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

    expect(colorScheme.b0Color, const Color(0xFF1A1A1A));
    expect(colorScheme.mainColor, const Color(0xFF007AFF));
  });
}
