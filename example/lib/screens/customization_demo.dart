// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

/// Demo screen showing how to customize colors, typography, and sizing
class CustomizationDemo extends StatefulWidget {
  const CustomizationDemo({super.key});

  @override
  State<CustomizationDemo> createState() => _CustomizationDemoState();
}

class _CustomizationDemoState extends State<CustomizationDemo> {
  // Color customization
  Color _mainColor = const Color(0xFF007AFF);
  Color _safeColor = const Color(0xFF34C759);
  Color _warningColor = const Color(0xFFFF9500);
  Color _dangerColor = const Color(0xFFFF3B30);

  // Typography customization
  final String _fontFamily = 'SF Pro Display';
  final String _fontFamilyNumbers = 'SF Mono';
  double _h1FontSize = 28.0;
  double _bodyFontSize = 16.0;

  // Sizing customization
  double _baseSpacingUnit = 4.0;
  double _borderRadius = 12.0;
  double _minButtonHeight = 48.0;

  @override
  Widget build(BuildContext context) {
    return MTPage(
      body: ListView(
        children: [
          MTListText.h2('Live Theme Customization'),
          SizedBox(height: context.sizing.vPadding),

          const MTListText(
            'This demo shows how to customize the UI kit theme in real-time. '
            'Adjust the values below to see immediate changes in the preview components.',
          ),
          SizedBox(height: context.sizing.hPadding),

          // Colors Section
          MTListText.h3('Colors Customization'),
          SizedBox(height: context.sizing.vPadding),

          _buildColorPicker(
            'Main Color',
            _mainColor,
            (color) => setState(() => _mainColor = color),
          ),

          _buildColorPicker(
            'Safe Color',
            _safeColor,
            (color) => setState(() => _safeColor = color),
          ),

          _buildColorPicker(
            'Warning Color',
            _warningColor,
            (color) => setState(() => _warningColor = color),
          ),

          _buildColorPicker(
            'Danger Color',
            _dangerColor,
            (color) => setState(() => _dangerColor = color),
          ),

          SizedBox(height: context.sizing.hPadding),

          // Typography Section
          MTListText.h3('Typography Customization'),
          SizedBox(height: context.sizing.vPadding),

          _buildSlider(
            'H1 Font Size',
            _h1FontSize,
            20.0,
            40.0,
            (value) => setState(() => _h1FontSize = value),
          ),

          _buildSlider(
            'Body Font Size',
            _bodyFontSize,
            12.0,
            20.0,
            (value) => setState(() => _bodyFontSize = value),
          ),

          SizedBox(height: context.sizing.hPadding),

          // Sizing Section
          MTListText.h3('Sizing Customization'),
          SizedBox(height: context.sizing.vPadding),

          _buildSlider(
            'Base Spacing Unit',
            _baseSpacingUnit,
            2.0,
            8.0,
            (value) => setState(() => _baseSpacingUnit = value),
          ),

          _buildSlider(
            'Border Radius',
            _borderRadius,
            4.0,
            24.0,
            (value) => setState(() => _borderRadius = value),
          ),

          _buildSlider(
            'Min Button Height',
            _minButtonHeight,
            40.0,
            60.0,
            (value) => setState(() => _minButtonHeight = value),
          ),

          SizedBox(height: context.sizing.hPadding),

          // Live Preview Section
          MTListText.h3('Live Preview'),
          SizedBox(height: context.sizing.vPadding),

          _buildPreview(),

          SizedBox(height: context.sizing.hPadding),

          // Code Example Section
          MTListText.h3('Code Example'),
          SizedBox(height: context.sizing.vPadding),

          MTCard(
            margin: context.sizing.defMargin,
            padding: context.sizing.defPadding,
            child: MText.small(
              _generateCodeExample(),
              maxLines: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPicker(String label, Color color, ValueChanged<Color> onChanged) {
    return MTCard(
      margin: context.sizing.defMargin,
      padding: context.sizing.defPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText.h4(label),
          SizedBox(height: context.sizing.vPadding),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(context.sizing.smallSpacing),
                  border: Border.all(color: context.colorScheme.f3Color.resolve(context)),
                ),
              ),
              SizedBox(width: context.sizing.vPadding),
              Expanded(
                child: Slider(
                  value: color.red.toDouble(),
                  min: 0,
                  max: 255,
                  onChanged: (value) {
                    onChanged(Color.fromARGB(255, value.toInt(), color.green, color.blue));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return MTCard(
      margin: context.sizing.defMargin,
      padding: context.sizing.defPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              MText.h4(label),
              SizedBox(width: context.sizing.smallSpacing),
              MText(value.toStringAsFixed(1)),
            ],
          ),
          SizedBox(height: context.sizing.vPadding),
          Slider(
            padding: EdgeInsets.zero,
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildPreview() {
    // Create custom theme with current values
    final customTheme = buildMTTheme(
      context,
      colorScheme: MTColorScheme(
        mainColor: _mainColor,
        safeColor: _safeColor,
        warningColor: _warningColor,
        dangerColor: _dangerColor,
      ),
      typography: MTTypography(
        fontFamily: _fontFamily,
        fontFamilyNumbers: _fontFamilyNumbers,
        h1FontSize: _h1FontSize,
        bodyFontSize: _bodyFontSize,
      ),
      sizing: MTSizing(
        p: _baseSpacingUnit,
        defBorderRadius: _borderRadius,
        minButtonHeight: _minButtonHeight,
      ),
    );

    return Theme(
      data: customTheme,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MText.h1('Heading 1'),
          MText.h2('Heading 2'),
          MText.h3('Heading 3'),
          const MText('Body text'),
          MText.small('Small text'),
          MText.numbers('123,456.78'),
          MText.link('Link text'),

          SizedBox(height: context.sizing.vPadding),

          // Button preview
          MTButton.main(titleText: 'Main', onTap: () {}),
          SizedBox(height: context.sizing.vPadding),
          MTButton.secondary(titleText: 'Secondary', onTap: () {}),
          SizedBox(height: context.sizing.vPadding),
          MTButton.safe(titleText: 'Safe', onTap: () {}),
          SizedBox(height: context.sizing.vPadding),
          MTButton.danger(titleText: 'Danger', onTap: () {}),
          SizedBox(height: context.sizing.vPadding),

          // Card preview
          MTCard(
            padding: context.sizing.defPadding,
            child: MText.h4('Card with custom border radius', padding: EdgeInsets.symmetric(vertical: 40)),
          ),
        ],
      ),
    );
  }

  String _generateCodeExample() {
    return '''
// Custom theme configuration
final customTheme = buildMTTheme(
  context,
  colorScheme: MTColorScheme(
    mainColor: Color(0x${_mainColor.value.toRadixString(16).padLeft(8, '0')}),
    safeColor: Color(0x${_safeColor.value.toRadixString(16).padLeft(8, '0')}),
    warningColor: Color(0x${_warningColor.value.toRadixString(16).padLeft(8, '0')}),
    dangerColor: Color(0x${_dangerColor.value.toRadixString(16).padLeft(8, '0')}),
  ),
  typography: MTTypography(
    fontFamily: '$_fontFamily',
    fontFamilyNumbers: '$_fontFamilyNumbers',
    h1FontSize: $_h1FontSize,
    bodyFontSize: $_bodyFontSize,
  ),
  sizing: MTSizing(
    p: $_baseSpacingUnit,
    defBorderRadius: $_borderRadius,
    minButtonHeight: $_minButtonHeight,
  ),
);

// Apply to your app
MaterialApp(
  theme: customTheme,
  home: MyApp(),
)
''';
  }
}
