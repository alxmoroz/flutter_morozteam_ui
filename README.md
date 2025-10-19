# MorozTeam UI Kit

Universal Flutter UI Kit with flexible theme configuration for colors, typography, and spacing.

## Features

- 🎨 **Flexible Theme System** - Customizable colors, typography, and spacing using Flutter's ThemeExtension
- 📱 **Adaptive Design** - Support for different screen sizes and responsive layouts
- 🎯 **Consistency** - Uniform components and styles across all MorozTeam projects
- ⚡ **Performance** - Optimized widgets with efficient rendering
- 🔧 **Customization** - Easy configuration for any project needs
- 🌙 **Dark Mode** - Built-in support for light and dark themes

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  morozteam_ui:
    git:
      url: https://github.com/MorozTeam/flutter_morozteam_ui.git
      ref: main
```

Then run:

```bash
flutter pub get
```

## Quick Start

### 1. Basic Setup

Use `buildMTTheme()` with `Builder` to create theme for MaterialApp:

```dart
import 'package:morozteam_ui/morozteam_ui.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          theme: buildMTTheme(context),
          home: MyHomePage(),
        );
      },
    );
  }
}
```

### 2. Custom Theme Configuration

```dart
Builder(
  builder: (context) {
    return MaterialApp(
      theme: buildMTTheme(
        context,
        colorScheme: MTColorScheme(
          // Background colors (b0 - darkest, b3 - lightest)
          b0Color: Color(0xFF1A1A1A),
          b1Color: Color(0xFF2A2A2A),
          b2Color: Color(0xFF3A3A3A),
          b3Color: Color(0xFFF5F5F5),
          
          // Text colors (f1 - primary, f3 - lightest)
          f1Color: Color(0xFF1A1A1A),
          f2Color: Color(0xFF666666),
          f3Color: Color(0xFF999999),
          
          // Accent colors
          mainColor: Color(0xFF007AFF),
          dangerColor: Color(0xFFFF3B30),
          safeColor: Color(0xFF34C759),
        ),
        typography: MTTypography(
          fontFamily: 'Roboto',
          fontFamilyNumbers: 'Montserrat',
          baseFontSize: 16.0,
        ),
        sizing: MTSizing(
          p: 4.0, // Base spacing unit
          minButtonHeight: 48.0,
          defBorderRadius: 12.0,
        ),
      ),
      home: MyHomePage(),
    );
  },
)
```

### 3. Project-Specific Configuration

For existing MorozTeam projects, use project-specific fonts and colors:

```dart
// For Avanplan project
Builder(
  builder: (context) {
    return MaterialApp(
      theme: buildMTTheme(
        context,
        typography: MTTypography(
          fontFamily: 'RobotoAvanplan',
          fontFamilyNumbers: 'MontserratAvanplan',
          fontFamilyDecorative: 'ComfortaaAvanplan',
        ),
        // Standard color scheme works for Avanplan
      ),
      home: MyHomePage(),
    );
  },
)

// For CAST project
Builder(
  builder: (context) {
    return MaterialApp(
      theme: buildMTTheme(
        context,
        typography: MTTypography(
          fontFamily: 'GeistMono500na700',
          baseFontSize: 14.0,
        ),
        colorScheme: MTColorScheme(
          // Simplified B/W scheme for CAST
          b3Color: Color(0xFFFFFFFF),
          b2Color: Color(0xFFEEEEEE),
          f1Color: Color(0xFF000000),
          f2Color: Color(0xFF666666),
        ),
      ),
      home: MyHomePage(),
    );
  },
)
```

### 4. Use Components

```dart
// Buttons
MTButton.main(
  titleText: 'Main Button',
  onTap: () => print('Pressed!'),
)

MTButton.secondary(
  titleText: 'Secondary Button',
  onTap: () => print('Pressed!'),
)

// Text
H1('Heading 1')
H2('Heading 2')
BaseText('Regular text')
BaseText.medium('Medium weight text')
SmallText('Small text')

// Adaptive containers
MTAdaptive.xxs(
  child: Container(
    child: Text('Narrow container'),
  ),
)

// Access theme values
Widget build(BuildContext context) {
  return Container(
    color: context.colorScheme.mainColor.resolve(context),
    padding: context.sizing.defPadding,
    child: BaseText(
      'Styled text',
      style: TextStyle(
        fontSize: context.typography.bodyFontSize,
        fontFamily: context.typography.fontFamily,
      ),
    ),
  );
}
```

## Components

### Buttons and List Items

- `MTButton` - Universal button with 7 variants (text, main, secondary, danger, safe, icon, card)
- `MTListTile` - List item
- `MTSectionTitle` - Section header
- `MTListText` - Text list item

### Containers and Cards

- `MTCard` - Card with shadow
- `MTCircle` - Circular element
- `MTBackgroundWrapper` - Wrapper with gradient background

### Indicators

- `MTLoader` - Loader with semi-transparent background
- `MTCircularProgress` - Circular progress indicator
- `MTProgress` - Progress bar
- `MTDivider` - Divider line

### Icons

- `MTIcon` - Base class
- `PlusIcon`, `CloseIcon`, `BackIcon`, and more

### Pages and Navigation

- `MTPage` - Base page widget
- `MTTopBar` / `MTBottomBar` - Navigation bars
- `PageTitle` - Page title

### Scrolling and Shadows

- `MTScrollable` - Scrollable container with shadows
- `MTShadowed` - Widget with shadows
- `MTRefresh` - Pull-to-refresh

### Typography

- `H1`, `H2`, `H3` - Headings
- `BaseText` - Regular text
- `BaseText.medium()` - Medium weight text
- `BaseText.bold()` - Bold text
- `SmallText` - Small text
- `NumbersText` - Text for numbers
- `LinkText` - Links

### Form Components

- `MTTextField` - Text input field with `.email()` and `.password()` variants
- `MTCheckBoxTile` - Checkbox list tile
- `MTDropdown<T>` - Generic dropdown

### Utilities

- `MTAdaptive` - Adaptive containers
- `GestureManaging` - Mixin for gesture management
- `FocusDroppable` - Removes focus on tap

## Color System

The UI Kit uses a semantic color system:

- **B0-B3** - Background colors (from darkest to lightest)
- **F1-F3** - Text colors (from primary to light)
- **mainColor** - Primary accent color
- **dangerColor** - Color for dangerous actions
- **safeColor** - Color for safe actions
- **warningColor** - Color for warnings

## Spacing System

Base value `P = 4.0` (fixed):

- `P` = 4.0
- `P2` = 8.0
- `P3` = 12.0
- `P4` = 16.0
- `P5` = 20.0
- `P6` = 24.0
- etc.

## Architecture

The UI Kit uses Flutter's standard `ThemeExtension` approach for theming:

- **MTThemeData** - Main theme data class extending `ThemeExtension<MTThemeData>`
- **MTThemeProvider** - Widget that provides theme configuration to the widget tree
- **MTColorScheme** - Color configuration with light/dark theme support
- **MTTypography** - Typography configuration (fonts, sizes, weights)
- **MTSizing** - Spacing and sizing configuration
- **MTBreakpoints** - Responsive design breakpoints

### Theme Access

Components access theme data through the `BuildContext` extension:

```dart
// Access theme data
final theme = context.mtTheme;
final colors = context.colorScheme;
final typography = context.typography;
final sizing = context.sizing;
final breakpoints = context.breakpoints;
```

### Color Resolution

Colors are resolved using the `ResolvedColor` extension:

```dart
// Resolve dynamic colors for current theme
final resolvedColor = context.colorScheme.mainColor.resolve(context);
```

## Example

See the `example/` folder for a complete usage example.

## License

Proprietary - © 2025 MorozTeam

## Author

Alexandr Moroz - MorozTeam