# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2025-01-20

### Added

- **Enhanced scrollable components** with automatic shadow behavior
- **MTScrollConfig** - Configuration class for scroll behavior
- **MTScrollMixin** - Mixin for adding scroll behavior to custom widgets
- **MTScrollableBase** - Base class for scrollable widgets
- **StatusBarTapHandler** - Tap status bar to scroll to top functionality
- **Bottom scroll callbacks** - `onBottomScrolled` callback for bottom scroll detection
- **Automatic shadow positioning** - Shadows appear automatically based on scroll offsets

### Changed

- **BREAKING**: `MTScrollable` API updated:
  - `scrollOffsetTop` → `topScrollOffset`
  - `bottomShadowOffset` → `bottomScrollOffset`
  - `onScrolled` → `onTopScrolled`
  - Removed `bottomShadow: bool` parameter (use `bottomScrollOffset > 0` instead)
- **BREAKING**: `MTPage` API updated:
  - `onScrolled` → `onTopScrolled`
  - Added `onBottomScrolled` parameter
- **BREAKING**: `MTDialog` API updated:
  - Added `onBottomScrolled` parameter
- **Enhanced scroll behavior** - More intuitive offset-based shadow triggers
- **Improved naming consistency** - Clearer parameter names across all scrollable components

### Technical Improvements

- **DRY principle** - Common scroll logic extracted to mixins
- **SOLID principles** - Better separation of concerns
- **KISS principle** - Simplified API with automatic behavior
- **YAGNI principle** - Removed unused ScrollableBuilder component
- **Type safety** - Better type definitions and null safety
- **Performance** - Optimized scroll listeners and shadow rendering

## [0.1.0] - 2025-10-20

### Added

- Initial release of MorozTeam UI Kit
- **31 UI components** ready for production use
- **Theme system** with MTThemeData for flexible customization
- **Color scheme** with MTColorScheme supporting light/dark themes
- **Typography system** with MTTypography for consistent text styling
- **Sizing system** with MTSizing for consistent spacing and dimensions
- **Responsive utilities** with MTAdaptive for different screen sizes
- **Light/dark mode support** using CupertinoDynamicColor
- **Complete example app** with 8 demo screens showcasing all components
- **Comprehensive documentation** with README, migration guide, and API docs

### Components

#### Text Components
- `MText` - Universal text component with multiple variants
- `MText.h1`, `MText.h2`, `MText.h3`, `MText.h4` - Heading variants
- `MText.small` - Small text for captions
- `MText.button` - Button text styling
- `MText.link` - Link text with underline
- `MText.numbers` - Numbers with monospace font
- `MText.f2`, `MText.f3` - Secondary and tertiary text colors
- `MText.medium`, `MText.bold` - Weight variants

#### Button Components
- `MTButton.main` - Primary action button with elevated style
- `MTButton.secondary` - Secondary action button with outlined style
- `MTButton.tertiary` - Tertiary action button with minimal style
- `MTButton.danger` - Danger action button for destructive actions

#### Form Components
- `MTTextField` - Text input field with consistent styling
- `MTCheckBoxTile` - Checkbox with label and tap handling
- `MTSwitch` - Toggle switch component
- `MTField` - Generic field component for custom inputs
- `MTPhoneField` - Phone number input with formatting
- `MTDropdown` - Dropdown selection component

#### Layout Components
- `MTCard` - Card container with consistent styling
- `MTListTile` - List item component with title, subtitle, and trailing
- `MTAvatar` - User avatar component
- `MTCircle` - Circular container component
- `MTDivider` - Visual separator component
- `MTProgress` - Linear progress indicator
- `MTCircularProgress` - Circular progress indicator
- `MTScrollableCentered` - Centered scrollable content wrapper
- `MTShadowed` - Container with shadow styling
- `MTAdaptive` - Responsive container with breakpoint support
- `MTBackgroundWrapper` - Background with gradient styling

#### Navigation Components
- `MTNavBar` - Navigation bar component
- `MTBottomBar` - Bottom navigation bar component
- `MTPage` - Page structure with navigation integration
- `MTPageTitle` - Page title component
- `MTCloseDialogButton` - Close button for dialogs

#### Dialog & Overlay Components
- `MTDialog` - Custom dialog component
- `MTAlertDialog` - Alert dialog component
- `MTSnackbar` - Snackbar notification component
- `MTLoader` - Loading overlay component
- `MTRefresh` - Pull-to-refresh wrapper component
- `MTWebViewDialog` - WebView displayed in dialog

#### Media Components
- `MTSvgIcon` - SVG icon component with asset support
- `MTSvgImage` - SVG image component for illustrations
- `MTImage` - Asset image component
- `MTNetworkImage` - Network image with fallback support

#### Utility Components
- `MTScrollable` - Scrollable wrapper with scroll callbacks

### Theme System

#### MTThemeData
- Central theme configuration extending ThemeExtension
- Support for color schemes, typography, sizing, and breakpoints
- Fallback to default values when theme is not provided
- Seamless integration with Flutter's theme system

#### MTColorScheme
- Primary colors: mainColor, safeColor, warningColor, dangerColor
- Background colors: b0Color, b1Color, b2Color, b3Color
- Text colors: f1Color, f2Color, f3Color
- Light/dark theme support with CupertinoDynamicColor

#### MTTypography
- Font family configuration for primary and numbers fonts
- Font size configuration for all text variants
- Font weight configuration for consistent typography
- Support for custom font families

#### MTSizing
- Base spacing unit (p) for consistent spacing
- Component-specific sizing (button height, border radius, etc.)
- Elevation configuration for Material Design compliance
- Responsive icon sizing with platform-specific defaults

#### MTBreakpoints
- Responsive breakpoints for different screen sizes
- Support for mobile, tablet, and desktop layouts
- Utility functions for responsive design

### Responsive Design

#### MTAdaptive
- Responsive container with breakpoint support
- Automatic width constraints based on screen size
- Support for force mode to override constraints

#### Responsive Utilities
- `isBigScreen()` - Check if screen is large enough for desktop layout
- `canShowVerticalBars()` - Check if vertical navigation can be shown
- `screenSize()` - Get current screen size
- Breakpoint constants for consistent responsive design

### Example App

#### Demo Screens
- **Basics** - Typography, colors, icons, and images
- **Buttons** - All button variants and states
- **Forms** - Form components and validation examples
- **Layout** - Layout components and responsive design
- **Dialogs** - Dialogs, overlays, and notifications
- **Page** - Page structure and navigation
- **Custom** - Live theme customization with real-time preview
- **Patterns** - Common UI patterns and layouts

#### Features
- Live theme customization with sliders and color pickers
- Code examples for all components
- Interactive demonstrations of all features
- Responsive design examples
- Common UI pattern implementations

### Documentation

#### README.md
- Comprehensive installation and setup guide
- Quick start examples
- Component documentation with usage examples
- Customization guide with code examples
- API reference links

#### MIGRATION.md
- Step-by-step migration guide from inline components
- Component mapping table
- Breaking changes documentation
- Example project migration timelines
- Migration checklist

#### API Documentation
- Complete API documentation for all components
- Type-safe documentation with examples
- Theme system documentation
- Responsive design utilities documentation

### Technical Features

#### Type Safety
- Full type safety with comprehensive documentation
- Null-safe implementation
- Generic type support where appropriate

#### Performance
- Zero dependencies on external packages
- Optimized rendering with minimal rebuilds
- Efficient theme resolution with caching

#### Accessibility
- Semantic widget structure
- Support for accessibility labels and hints
- Keyboard navigation support
- Screen reader compatibility

#### Platform Support
- iOS and Android support
- Web support with responsive design
- Desktop support with adaptive layouts
- Consistent behavior across platforms


### Quality Assurance

#### Code Quality
- Comprehensive linting and formatting
- Type safety with strict analysis
- Consistent code style and documentation
- Error handling and fallback values

#### Testing
- Example app serves as comprehensive test suite
- All components demonstrated and tested
- Responsive design tested across screen sizes
- Theme customization tested with live examples

#### Documentation Quality
- Complete API documentation
- Usage examples for all components
- Migration guide for existing projects
- Best practices and patterns documentation

### Future Roadmap

#### Planned Features
- More form components (date picker, file picker)
- Chart components for data visualization
- Animation utilities for smooth transitions
- Enhanced accessibility features
- RTL (Right-to-Left) language support
- Additional theme variants and presets

#### Community
- Open source development
- Community contributions welcome
- Issue tracking and feature requests
- Regular updates and improvements

---

## Version History

### v0.1.0 (2025-10-20)
- Initial release with 31 components
- Complete theme system
- Responsive design utilities
- Comprehensive documentation
- Example app with 8 demo screens
- Migration guide for existing projects

---

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details on how to contribute to this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- 📖 [Documentation](https://pub.dev/documentation/morozteam_ui/latest/)
- 🐛 [Report bugs](https://github.com/morozteam/flutter_morozteam_ui/issues)
- 💬 [Discussions](https://github.com/morozteam/flutter_morozteam_ui/discussions)
- 📧 [Email support](mailto:support@moroz.team)