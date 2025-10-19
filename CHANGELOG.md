# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-01-20

### Added
- Initial release of MorozTeam UI Kit
- 31 customizable UI components
- Flexible theme system:
  - MTColorScheme with 14 configurable colors
  - MTTypography with customizable fonts and sizes
  - MTSizing for consistent spacing and sizing
  - MTBreakpoints for responsive design
- Built-in light/dark theme support via CupertinoDynamicColor
- Responsive design utilities (MTAdaptive, breakpoints)
- Comprehensive example app demonstrating all components

#### Components
**Buttons & Interactive:**
- MTButton with 7 style variants (main, secondary, danger, safe, text, icon, card)

**Forms & Input:**
- MTTextField with variants (email, password)
- MTPhoneField with country selector
- MTCheckBoxTile
- MTDropdown
- MTField

**Layout & Structure:**
- MTPage with navigation bars support
- MTCard with elevation and shadows
- MTListTile with multiple configurations
- MTDivider
- MTAvatar with Gravatar support
- MTCircle

**Dialogs & Overlays:**
- MTDialog (responsive: dialog on desktop, bottom sheet on mobile)
- MTAlertDialog
- MTSnackbar
- MTWebviewDialog
- MTLoader
- MTCloseDialogButton

**Navigation:**
- MTToolbar with MTToolbarController
- MTPageTitle
- MTNavBar
- MTBottomBar

**Progress & Feedback:**
- MTProgress (linear)
- MTCircularProgress
- MTRefresh (pull-to-refresh)

**Typography:**
- BaseText with variants (f2, f3, medium, bold)
- H1, H2, H3, H4 headings
- SmallText, NumbersText, ButtonText, LinkText
- MTListText with all typography variants

**Media & Icons:**
- MTIcon (Cupertino icons wrapper)
- MTSvgIcon (SVG assets from icons/)
- MTSvgImage (SVG assets from images/)
- MTImage (raster assets)
- MTNetworkImage with fallback

**Utilities:**
- MTAdaptive (responsive width constraints)
- MTScrollable with shadow effects
- MTScrollableCentered
- MTShadowed (top shadow overlay)
- MTBackgroundWrapper (gradient background)

### Technical Details
- Minimum Flutter SDK: 3.0.0
- Minimum Dart SDK: 3.0.0
- Material Design 3 support
- Cross-platform: iOS, Android, Web, Desktop