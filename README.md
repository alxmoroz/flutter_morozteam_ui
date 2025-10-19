# MorozTeam UI Kit

[![pub package](https://img.shields.io/pub/v/morozteam_ui.svg)](https://pub.dev/packages/morozteam_ui)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Universal UI kit for Flutter applications with flexible theming system.

## Features

✨ **31 Ready-to-use Components** - Buttons, forms, dialogs, navigation, and more  
🎨 **Flexible Theme System** - Easily customize colors, typography, and spacing  
🌓 **Light/Dark Mode** - Built-in support for theme switching  
📱 **Responsive Design** - Adaptive layouts for mobile, tablet, and desktop  
🎯 **Material Design 3** - Modern design principles  
⚡ **High Performance** - Optimized widgets with minimal rebuilds  
🔧 **Highly Customizable** - Override any component styling

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  morozteam_ui: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## Quick Start

### 1. Setup Theme

Wrap your `MaterialApp` with theme configuration:

```dart
import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          title: 'My App',
          theme: buildMTTheme(context),
          home: MyHomePage(),
        );
      },
    );
  }
}
```

### 2. Use Components

```dart
import 'package:morozteam_ui/morozteam_ui.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MTPage(
      navBar: MTNavBar(pageTitle: 'Home'),
      body: ListView(
        children: [
          MTCard(
            margin: context.sizing.defMargin,
            child: Column(
              children: [
                const H2('Welcome'),
                const BaseText('This is MorozTeam UI Kit'),
                SizedBox(height: context.sizing.vPadding),
                MTButton.main(
                  titleText: 'Get Started',
                  onTap: () {
                    showMTSnackbar('Hello!', context: context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

## Customization

### Colors

```dart
buildMTTheme(
  context,
  colorScheme: MTColorScheme(
    mainColor: CupertinoDynamicColor.withBrightness(
      color: Colors.purple,
      darkColor: Colors.purpleAccent,
    ),
    dangerColor: CupertinoDynamicColor.withBrightness(
      color: Colors.red,
      darkColor: Colors.redAccent,
    ),
    // ... customize other colors
  ),
)
```

### Typography

```dart
buildMTTheme(
  context,
  typography: MTTypography(
    fontFamily: 'YourCustomFont',
    h1FontSize: 32.0,
    h1FontWeight: FontWeight.bold,
    bodyFontSize: 16.0,
    // ... customize other typography
  ),
)
```

### Sizing & Spacing

```dart
buildMTTheme(
  context,
  sizing: MTSizing(
    p: 4.0, // base spacing unit (affects all spacing)
    minButtonHeight: 48.0,
    defBorderRadius: 12.0,
    cardElevation: 2.0,
  ),
)
```

### Breakpoints

```dart
buildMTTheme(
  context,
  breakpoints: MTBreakpoints(
    sWidth: 480.0,
    mWidth: 640.0,
    lWidth: 960.0,
    // ... customize breakpoints
  ),
)
```

## Components Overview

### Buttons
- `MTButton` - Universal button with 7 variants
- `MTButton.main()` - Primary action button
- `MTButton.secondary()` - Secondary button
- `MTButton.danger()` - Destructive action
- `MTButton.safe()` - Success/safe action
- `MTButton.icon()` - Icon-only button

### Forms
- `MTTextField` - Text input with validation
- `MTTextField.email()` - Email input
- `MTTextField.password()` - Password input
- `MTPhoneField` - Phone with country selector
- `MTCheckBoxTile` - Checkbox list item
- `MTDropdown<T>` - Dropdown selector
- `MTField` - Read-only field display

### Layout
- `MTPage` - Base page structure
- `MTCard` - Card with shadow
- `MTListTile` - Universal list item
- `MTDivider` - Visual separator
- `MTAvatar` - User avatar with Gravatar
- `MTAdaptive` - Responsive container

### Dialogs
- `showMTDialog()` - Custom dialog
- `showMTAlertDialog()` - Alert with actions
- `showMTSnackbar()` - Snackbar notification
- `MTLoader` - Loading indicator

### Typography
- `H1`, `H2`, `H3`, `H4` - Headings
- `BaseText` - Body text
- `SmallText` - Small text
- `NumbersText` - Numeric display
- `ButtonText` - Button labels
- `LinkText` - Clickable links

### Navigation
- `MTNavBar` - Top navigation bar
- `MTBottomBar` - Bottom navigation bar
- `MTToolbar` - Custom toolbar
- `MTPageTitle` - Page header

### Progress
- `MTProgress` - Linear progress
- `MTCircularProgress` - Circular spinner
- `MTRefresh` - Pull-to-refresh
- `MTLoader` - Full-screen loader

## Theme Access

Access theme values anywhere in your widget tree:

```dart
// Colors
context.colorScheme.mainColor
context.colorScheme.b3Color
context.colorScheme.f1Color

// Typography
context.typography.h1FontSize
context.typography.fontFamily

// Sizing
context.sizing.hPadding
context.sizing.vPadding
context.sizing.defBorderRadius

// Breakpoints
context.breakpoints.mWidth
```

## Example App

Check out the [example app](example/) for a comprehensive demonstration of all components and features.

To run the example:

```bash
cd example
flutter run
```

## Documentation

Full API documentation is available on [pub.dev](https://pub.dev/documentation/morozteam_ui/latest/).

## Platform Support

| Platform | Supported |
|----------|-----------|
| iOS      | ✅        |
| Android  | ✅        |
| Web      | ✅        |
| macOS    | ✅        |
| Windows  | ✅        |
| Linux    | ✅        |

## Requirements

- Flutter SDK: >=3.0.0
- Dart SDK: >=3.0.0

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Contributing

This is an internal package for MorozTeam projects. If you'd like to contribute or report issues, please contact the maintainers.

## Maintainers

- Alexandr Moroz

---

Made with ❤️ by MorozTeam