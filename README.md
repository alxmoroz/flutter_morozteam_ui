# MorozTeam UI Kit

Universal UI kit for Flutter with flexible theming and responsive design.

## Features

- **31 ready-to-use components** - Buttons, forms, layouts, dialogs, and more
- **Light/dark theme support** - Automatic theme switching with CupertinoDynamicColor
- **Fully customizable** - Colors, typography, sizing, and spacing
- **Responsive design utilities** - Adaptive layouts for different screen sizes
- **Material Design 3 compliance** - Modern design system principles
- **Zero dependencies** - Pure Flutter implementation
- **Type-safe** - Full type safety with comprehensive documentation

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  morozteam_ui: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## Quick Start

### 1. Basic setup

```dart
import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildMTTheme(context), // Uses default theme
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MTPage(
      title: 'My App',
      child: Column(
        children: [
          MText.h1('Welcome to MorozTeam UI Kit'),
          MText('This is a regular text component'),
          SizedBox(height: context.sizing.vPadding),
          MTButton.main(
            titleText: 'Get Started',
            onTap: () {
              // Handle button tap
            },
          ),
        ],
      ),
    );
  }
}
```

### 2. Custom theme

```dart
MaterialApp(
  theme: buildMTTheme(
    context,
    colorScheme: MTColorScheme(
      mainColor: Color(0xFF007AFF), // Your brand color
      safeColor: Color(0xFF34C759),
      warningColor: Color(0xFFFF9500),
      dangerColor: Color(0xFFFF3B30),
    ),
    typography: MTTypography(
      fontFamily: 'YourFont', // Your custom font
      h1FontSize: 28.0,
      bodyFontSize: 16.0,
    ),
    sizing: MTSizing(
      p: 4.0, // Base spacing unit
      defBorderRadius: 12.0,
      minButtonHeight: 48.0,
    ),
  ),
  home: MyHomePage(),
)
```

## Components

### Text Components
- `MText` - Universal text component with multiple variants
- `MText.h1`, `MText.h2`, `MText.h3`, `MText.h4` - Headings
- `MText.small` - Small text for captions
- `MText.button` - Button text styling
- `MText.link` - Link text with underline
- `MText.numbers` - Numbers with monospace font
- `MText.f2`, `MText.f3` - Secondary and tertiary text colors
- `MText.medium`, `MText.bold` - Weight variants

### Button Components
- `MTButton.main` - Primary action button
- `MTButton.secondary` - Secondary action button
- `MTButton.tertiary` - Tertiary action button
- `MTButton.danger` - Danger action button

### Form Components
- `MTTextField` - Text input field
- `MTCheckBoxTile` - Checkbox with label
- `MTSwitch` - Toggle switch
- `MTField` - Generic field component
- `MTPhoneField` - Phone number input
- `MTDropdown` - Dropdown selection

### Layout Components
- `MTCard` - Card container
- `MTListTile` - List item component
- `MTAvatar` - User avatar
- `MTCircle` - Circular container
- `MTDivider` - Visual separator
- `MTProgress` - Linear progress indicator
- `MTCircularProgress` - Circular progress indicator
- `MTScrollableCentered` - Centered scrollable content
- `MTShadowed` - Container with shadow
- `MTAdaptive` - Responsive container
- `MTBackgroundWrapper` - Background with gradient

### Navigation Components
- `MTNavBar` - Navigation bar
- `MTBottomBar` - Bottom navigation bar
- `MTPage` - Page structure with navigation
- `MTPageTitle` - Page title component
- `MTCloseDialogButton` - Close button for dialogs

### Dialog & Overlay Components
- `MTDialog` - Custom dialog
- `MTAlertDialog` - Alert dialog
- `MTSnackbar` - Snackbar notification
- `MTLoader` - Loading overlay
- `MTRefresh` - Pull-to-refresh wrapper
- `MTWebViewDialog` - WebView in dialog

### Media Components
- `MTSvgIcon` - SVG icon component
- `MTSvgImage` - SVG image component
- `MTImage` - Asset image component
- `MTNetworkImage` - Network image with fallback

### Scrollable Components
- `MTScrollable` - Scrollable wrapper with automatic shadows and callbacks
- `MTScrollableCentered` - Centered scrollable content
- `StatusBarTapHandler` - Tap status bar to scroll to top

### Utility Components
- `MTScrollConfig` - Scroll behavior configuration
- `MTScrollMixin` - Scroll behavior mixin for custom widgets

## Customization

### Colors

```dart
MTColorScheme(
  mainColor: Color(0xFF007AFF),     // Primary brand color
  safeColor: Color(0xFF34C759),     // Success/safe actions
  warningColor: Color(0xFFFF9500),  // Warning states
  dangerColor: Color(0xFFFF3B30),   // Danger/error states
  // Background colors (b0-b3)
  b0Color: Color(0xFFFFFFFF),       // Primary background
  b1Color: Color(0xFFF2F2F7),       // Secondary background
  b2Color: Color(0xFFE5E5EA),       // Tertiary background
  b3Color: Color(0xFFD1D1D6),       // Quaternary background
  // Text colors (f1-f3)
  f1Color: Color(0xFF000000),       // Primary text
  f2Color: Color(0xFF3C3C43),       // Secondary text
  f3Color: Color(0xFF3C3C4399),     // Tertiary text
)
```

### Typography

```dart
MTTypography(
  fontFamily: 'SF Pro Display',     // Primary font family
  fontFamilyNumbers: 'SF Mono',     // Numbers font family
  h1FontSize: 28.0,                 // Heading 1 size
  h2FontSize: 22.0,                 // Heading 2 size
  h3FontSize: 20.0,                 // Heading 3 size
  h4FontSize: 17.0,                 // Heading 4 size
  bodyFontSize: 16.0,               // Body text size
  smallFontSize: 13.0,              // Small text size
  buttonFontSize: 16.0,             // Button text size
  linkFontSize: 16.0,               // Link text size
  numbersFontSize: 16.0,            // Numbers text size
  // Font weights
  h1FontWeight: FontWeight.w700,
  h2FontWeight: FontWeight.w600,
  h3FontWeight: FontWeight.w600,
  h4FontWeight: FontWeight.w600,
  bodyFontWeight: FontWeight.w400,
  smallFontWeight: FontWeight.w400,
  buttonFontWeight: FontWeight.w500,
  linkFontWeight: FontWeight.w400,
  numbersFontWeight: FontWeight.w400,
)
```

### Sizing

```dart
MTSizing(
  p: 4.0,                           // Base spacing unit
  minButtonHeight: 48.0,            // Minimum button height
  defBarHeight: 48.0,               // Default bar height
  tappableIconSize: 44.0,           // Tappable icon size
  defBorderRadius: 12.0,            // Default border radius
  buttonBorderRadius: 24.0,         // Button border radius
  cardElevation: 1.0,               // Card elevation
  buttonElevation: 1.0,             // Button elevation
)
```

### Responsive Design

```dart
// Adaptive container
MTAdaptive.s(
  child: Container(
    child: MText('Content for small screens'),
  ),
)

// Check screen size
if (isBigScreen(context)) {
  // Show desktop layout
} else {
  // Show mobile layout
}

// Check if vertical bars can be shown
if (canShowVerticalBars(context)) {
  // Show side navigation
}
```

### Scrollable Components

```dart
// MTScrollable with automatic shadows and callbacks
MTScrollable(
  topScrollOffset: 50.0,        // Show top shadow when scrolled 50px
  bottomScrollOffset: 100.0,    // Show bottom shadow when 100px from bottom
  onTopScrolled: (hasScrolled) {
    // Called when scroll position crosses topScrollOffset
    print('Top scrolled: $hasScrolled');
  },
  onBottomScrolled: (hasScrolledToBottom) {
    // Called when scroll position crosses bottomScrollOffset
    print('Bottom scrolled: $hasScrolledToBottom');
  },
  child: ListView(
    children: [
      // Your scrollable content
    ],
  ),
)

// StatusBarTapHandler for tap-to-scroll functionality
StatusBarTapHandler(
  scrollController: scrollController,
  child: ListView(
    children: [
      // Your content
    ],
  ),
)
```

## Example App

The package includes a comprehensive example app demonstrating all components and features:

```bash
cd example
flutter run
```

The example app includes:
- **Basics** - Typography, colors, icons, and images
- **Buttons** - All button variants and states
- **Forms** - Form components and validation
- **Layout** - Layout components and responsive design
- **Dialogs** - Dialogs, overlays, and notifications
- **Page** - Page structure and navigation
- **Custom** - Live theme customization
- **Patterns** - Common UI patterns and layouts


## API Reference

For detailed API documentation, visit: https://pub.dev/documentation/morozteam_ui/latest/

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes and new features.

## Support

- 📖 [Documentation](https://pub.dev/documentation/morozteam_ui/latest/)
- 🐛 [Report bugs](https://github.com/morozteam/flutter_morozteam_ui/issues)
- 💬 [Discussions](https://github.com/morozteam/flutter_morozteam_ui/discussions)
- 📧 [Email support](mailto:support@morozteam.com)

## Roadmap

- [ ] More form components (date picker, file picker)
- [ ] Chart components
- [ ] Animation utilities
- [ ] Accessibility improvements
- [ ] RTL support
- [ ] More theme variants