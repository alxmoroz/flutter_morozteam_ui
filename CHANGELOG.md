# Changelog

All notable changes to this project will be documented in this file.

## 0.2.0

### BREAKING CHANGES
- Package renamed from `flutter_morozteam_ui` to `morozteam_ui`
- Update your imports: `package:morozteam_ui/morozteam_ui.dart`
- Repository and folder names remain unchanged

### Added
- Complete MTAvatar refactoring with generic parameters
- MD5 utility for Gravatar email hashing
- Layered image loading in MTAvatar (initials → gravatar → custom URL → icon)
- Comprehensive avatar examples in demo app

### Changed
- MTAvatar now accepts `initials`, `avatarUrl`, `gravatarEmail`, `borderColor` parameters
- Removed all domain dependencies from MTAvatar
- Improved avatar fallback system

## 0.1.0

### Added
- Initial release
- Core UI components and theme system
- Flexible configuration with UIKitConfig
- Global colors and constants accessors
- Comprehensive example application

