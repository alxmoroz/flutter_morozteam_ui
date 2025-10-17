// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import '../config/ui_config.dart';

/// Расширение для Color с поддержкой CupertinoDynamicColor
extension ResolvedColor on Color {
  Color resolve(BuildContext context) => CupertinoDynamicColor.resolve(this, context);
}

/// Класс для работы с цветами UI Kit
class UIColors {
  const UIColors(this.config);

  final UIKitConfig config;

  /// Цвета фона (b0 - самый темный, b3 - самый светлый)
  Color get b0Color => config.b0Color;
  Color get b1Color => config.b1Color;
  Color get b2Color => config.b2Color;
  Color get b3Color => config.b3Color;

  /// Цвета текста (f1 - основной, f3 - самый светлый)
  Color get f1Color => config.f1Color;
  Color get f2Color => config.f2Color;
  Color get f3Color => config.f3Color;

  /// Акцентные цвета
  Color get mainColor => config.mainColor;
  Color get dangerColor => config.dangerColor;
  Color get safeColor => config.safeColor ?? config.mainColor;
  Color get warningColor => config.warningColor ?? config.dangerColor;

  /// Специальные цвета
  Color get mainBtnTitleColor => config.mainBtnTitleColor ?? config.b2Color;
  Color get navbarColor => config.navbarColor ?? const Color.fromARGB(0, 255, 255, 255);
  Color get defaultBarrierColor => config.defaultBarrierColor ?? config.b1Color;

  /// Белый цвет (для иконок и текста на цветном фоне)
  Color get whiteColor => const Color(0xFFFFFFFF);

  /// Статические цвета для совместимости
  Color get grayColor => const Color(0xFFEEEEEE);
  Color get black40Color => const Color(0xFF999999);
  Color get grayColorDark => const Color(0xFF666666);
  Color get black40ColorDark => const Color(0xFF222222);
  Color get blackColor => const Color(0xFF010101);
}

/// Глобальный экземпляр цветов (будет инициализирован при настройке темы)
UIColors? _globalColors;

/// Инициализировать глобальные цвета
void initializeColors(UIKitConfig config) {
  _globalColors = UIColors(config);
}

/// Получить глобальные цвета
UIColors get colors {
  if (_globalColors == null) {
    throw FlutterError(
      'UIColors not initialized. Make sure to wrap your app with UIThemeProvider.',
    );
  }
  return _globalColors!;
}

/// Расширение для BuildContext для удобного доступа к цветам
extension UIColorsExtension on BuildContext {
  UIColors get uiColors => colors;
}
