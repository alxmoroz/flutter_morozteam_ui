# Changelog

All notable changes to this project will be documented in this file.

## [0.1.0] - 2025-01-17

### Added

- **Configuration System**
  - `UIKitConfig` - Theme configuration class
  - `UITheme` and `UIThemeProvider` - Theme system
  - Support for customizable colors, typography, and spacing

- **Color System**
  - `UIColors` - Semantic colors (B0-B3, F1-F3)
  - Support for accent colors (main, danger, safe, warning)
  - Integration with CupertinoDynamicColor

- **Constants System**
  - `UIConstants` - Configurable spacing system (P, P2, P3...)
  - Breakpoints for adaptivity
  - Standard sizes and paddings

- **Typography**
  - `BaseText` - Base text widget
  - `H1`, `H2`, `H3` - Headings
  - `BaseText.medium()`, `BaseText.bold()` - Weight variants
  - `SmallText`, `NumbersText`, `LinkText` - Specialized texts

- **Components**
  - `MTButton` - Universal button with 7 variants (text, main, secondary, danger, safe, icon, card)
  - `MTCard` - Card with shadow
  - `MTLoader` and `MTCircularProgress` - Loading indicators
  - `MTProgress` - Progress bar
  - `MTDivider` - Divider line
  - `MTCircle` - Circular element
  - `MTListTile` - List tile with variants (MTSectionTitle, MTListText)
  - `MTIcon` - Icon system with 15+ ready-to-use icons
  - `MTPage` - Base page widget with leftBar/rightBar support
  - `MTTopBar` and `MTBottomBar` - Navigation toolbars
  - `PageTitle` - Page title widget
  - `MTShadowed` - Widget with shadows
  - `MTScrollable` - Scrollable container with shadows
  - `MTBackgroundWrapper` - Wrapper with gradient background
  - `MTRefresh` - Pull-to-refresh widget

- **Form Components**
  - `MTTextField` - Text input field with `.email()` and `.password()` variants
  - `MTCheckBoxTile` - Checkbox list tile
  - `MTDropdown<T>` - Generic dropdown (no domain dependencies)

- **Utilities**
  - `MTAdaptive` - Adaptive containers with breakpoint support
  - `GestureManaging` - Mixin for gesture management with haptic feedback
  - `FocusDroppable` - Widget that removes focus on tap
  - `material()` - Wrapper for Material widgets

- **Documentation**
  - README.md with usage examples
  - CHANGELOG.md with version history
  - COMPONENT_ANALYSIS.md with detailed component comparison
  - Example app demonstrating all components

### Technical Details

- Flutter SDK: >=3.0.0
- Platform support: iOS, Android, Web, Desktop
- Optimized performance
- Strict typing
- Zero linter warnings
- 23+ components from best versions of 4 different projects

### Notes

This is the initial release combining the best components from:
- avanplan_frontend
- mamagochi_frontend  
- leitsy-frontend
- cast

All components use the latest and most flexible versions from these projects.