# Flutter MorozTeam UI

Universal Flutter UI Kit with flexible theme configuration for colors, typography, and spacing.

## Features

- 🎨 **Flexible Theme System** - Customizable colors, typography, and spacing
- 📱 **Adaptive Design** - Support for different screen sizes
- 🎯 **Consistency** - Uniform components and styles
- ⚡ **Performance** - Optimized widgets
- 🔧 **Customization** - Easy configuration for any project

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  morozteam_ui:
    git:
      url: https://github.com/alxmoroz/flutter_morozteam_ui.git
      ref: main
```

Then run:

```bash
flutter pub get
```

## Quick Start

### 1. Theme Setup

Wrap your app with `UIThemeProvider`:

```dart
import 'package:morozteam_ui/morozteam_ui.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: UIThemeProvider(
        config: myConfig,
        child: MyHomePage(),
      ),
    );
  }
}
```

### 2. Create Configuration

```dart
const myConfig = UIKitConfig(
  // Color scheme
  colorScheme: UIColorScheme(
    // Background colors
    b0Color: Color(0xFF1A1A1A),
    b1Color: Color(0xFF2A2A2A),
    b2Color: Color(0xFF3A3A3A),
    b3Color: Color(0xFFF5F5F5),
    
    // Text colors
    f1Color: Color(0xFF1A1A1A),
    f2Color: Color(0xFF666666),
    f3Color: Color(0xFF999999),
    
    // Accent colors
    mainColor: Color(0xFF007AFF),
    dangerColor: Color(0xFFFF3B30),
    safeColor: Color(0xFF34C759),
  ),
  
  // Typography
  fontFamily: 'SF Pro Text',
  fontFamilyNumbers: 'SF Mono',
  baseFontSize: 16.0,
  
  // Sizes
  minButtonHeight: 48.0,
  defaultBorderRadius: 12.0,
);
```

### 3. Customization Guide

You can customize colors, typography, and spacing for your project:

```dart
// Custom color scheme
const customColorScheme = UIColorScheme(
  mainColor: Color(0xFF6B46C1), // Purple theme
  dangerColor: Color(0xFFDC2626),
  safeColor: Color(0xFF059669),
  // ... other colors
);

// Custom configuration
const customConfig = UIKitConfig(
  colorScheme: customColorScheme,
  fontFamily: 'Inter', // Custom font
  baseFontSize: 18.0,  // Larger text
  minButtonHeight: 52.0, // Taller buttons
);
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

## Migration from Old Projects

If you're migrating from existing MorozTeam projects (Avanplan, Mamagochi), here's what changed:

### Color Configuration
```dart
// Old way (direct colors in UIKitConfig)
const config = UIKitConfig(
  b0Color: Color(0xFF1A1A1A),
  mainColor: Color(0xFF007AFF),
  // ...
);

// New way (UIColorScheme)
const config = UIKitConfig(
  colorScheme: UIColorScheme(
    b0Color: Color(0xFF1A1A1A),
    mainColor: Color(0xFF007AFF),
    // ...
  ),
);
```

### Dialog Methods
```dart
// Old way (global context)
showMTDialog(child);
showMTAlertDialog(title: 'Title', actions: actions);

// New way (explicit context)
showMTDialog(child, context: context);
showMTAlertDialog(
  context: context,
  title: 'Title', 
  actions: actions,
);
```

### Backward Compatibility
All existing component APIs remain the same. Only configuration and dialog methods changed.

## Example

See the `example/` folder for a complete usage example.

## License

Proprietary - © 2025 MorozTeam

## Author

Alexandr Moroz - MorozTeam