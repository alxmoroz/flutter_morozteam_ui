// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/widgets.dart';

import 'ui_config.dart';

/// InheritedWidget для доступа к UIKitConfig через контекст
class UITheme extends InheritedWidget {
  const UITheme({
    super.key,
    required this.config,
    required super.child,
  });

  final UIKitConfig config;

  /// Получить UIKitConfig из контекста
  static UIKitConfig of(BuildContext context) {
    final UITheme? theme = context.dependOnInheritedWidgetOfExactType<UITheme>();
    if (theme == null) {
      throw FlutterError(
        'UITheme.of() called with a context that does not contain a UITheme.\n'
        'No ancestor could be found starting from the context that was passed to UITheme.of().\n'
        'The context used was:\n'
        '  $context',
      );
    }
    return theme.config;
  }

  /// Получить UIKitConfig из контекста, возвращает null если не найден
  static UIKitConfig? maybeOf(BuildContext context) {
    final UITheme? theme = context.dependOnInheritedWidgetOfExactType<UITheme>();
    return theme?.config;
  }

  @override
  bool updateShouldNotify(UITheme oldWidget) {
    return config != oldWidget.config;
  }
}

/// Обертка для приложения с UITheme
class UIThemeProvider extends StatelessWidget {
  const UIThemeProvider({
    super.key,
    required this.config,
    required this.child,
  });

  final UIKitConfig config;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Инициализируем глобальные константы и цвета при первом построении
    _initializeGlobals(config);
    return UITheme(
      config: config,
      child: child,
    );
  }

  void _initializeGlobals(UIKitConfig config) {
    // Инициализируем глобальные константы и цвета
    // Это делается через функции в constants.dart и colors.dart
    // Глобальные переменные будут доступны после первого обращения к constants и colors
  }
}
