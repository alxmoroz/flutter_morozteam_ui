# flutter_morozteam_ui

Universal Flutter UI Kit with flexible theming system for MorozTeam projects.

## Features

- 🎨 Flexible theme configuration via `UIKitConfig`
- 📐 Configurable spacing system based on base value P
- 🎯 23+ ready-to-use components
- 📱 Adaptive UI support
- 🌈 Semantic color system
- ✍️ Typography system with multiple font families

## Installation

```yaml
dependencies:
  flutter_morozteam_ui:
    git:
      url: https://github.com/MorozTeam/flutter_morozteam_ui.git
      ref: main
```

## Quick Start

```dart
import 'package:flutter_morozteam_ui/flutter_morozteam_ui.dart';

void main() {
  runApp(
    UIThemeProvider(
      config: UIKitConfig(
        b0Color: Color(0xFF000000),
        b1Color: Color(0xFF1C1C1E),
        b2Color: Color(0xFF2C2C2E),
        b3Color: Color(0xFF3A3A3C),
        f1Color: Color(0xFFFFFFFF),
        f2Color: Color(0xFFE5E5E7),
        f3Color: Color(0xFF8E8E93),
        mainColor: Color(0xFF007AFF),
        dangerColor: Color(0xFFFF3B30),
      ),
      child: MyApp(),
    ),
  );
}
```

## Components

- **Buttons**: MTButton with 7 variants
- **Form**: MTTextField, MTCheckBoxTile, MTDropdown
- **Layout**: MTPage, MTCard, MTListTile
- **Navigation**: MTTopBar, MTBottomBar, PageTitle
- **Indicators**: MTLoader, MTCircularProgress, MTProgress
- **UI Elements**: MTDivider, MTCircle, MTIcon

See [README.md](../README.md) for full documentation.

## License

Proprietary - © 2025 MorozTeam

