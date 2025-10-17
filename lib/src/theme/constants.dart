// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../config/ui_config.dart';

/// Константы для spacing, размеров и других UI параметров
class UIConstants {
  const UIConstants(this.config);

  final UIKitConfig config;

  /// Базовое значение для spacing (P)
  double get P => config.baseSpacing;
  
  /// Производные значения spacing
  double get P2 => P * 2.0; // 12
  double get P3 => P * 3.0; // 18
  double get P4 => P * 4.0; // 24
  double get P5 => P * 5.0; // 30
  double get P6 => P * 6.0; // 36
  double get P7 => P * 7.0; // 42
  double get P8 => P * 8.0; // 48
  double get P9 => P * 9.0; // 54
  double get P10 => P * 10.0; // 60
  double get P11 => P * 11.0; // 66
  double get P12 => P * 12.0; // 72

  /// Дробные значения
  double get P_2 => P / 2; // 3
  double get P_3 => P / 3; // 2

  /// Стандартные отступы для страниц
  double get defPageTopPadding => P3;
  double get defPageBottomPadding => P5;
  double get defDialogBottomPadding => P3;

  /// Стандартные отступы
  double get defHP => P3;
  double get defVP => P2;
  EdgeInsets get defPadding => EdgeInsets.symmetric(horizontal: defHP, vertical: defVP);
  EdgeInsets get defMargin => EdgeInsets.fromLTRB(defHP, defVP, defHP, 0);

  /// Border radius
  double get defBorderRadius => config.defaultBorderRadius;
  double get defBtnBorderRadius => config.buttonRadius;
  double get defBorderWidth => P_3;

  /// Размеры
  double get defBarHeight => config.defaultBarHeight;
  double get minBtnHeight => config.minButtonHeight;
  double get defTappableIconSize => kIsWeb ? P5 : P6;

  /// Breakpoints для адаптивности
  double get scrXXSWidth => config.xxsWidth;
  double get scrXSWidth => config.xsWidth;
  double get scrXSHeight => config.xsHeight;
  double get scrSWidth => config.sWidth;
  double get scrSHeight => config.sHeight;
  double get scrMWidth => config.mWidth;
  double get scrMHeight => config.mHeight;
  double get scrLWidth => config.lWidth;
  double get scrXLWidth => config.xlWidth;
  double get scrXXLWidth => config.xxlWidth;
  
  // Avatar limits
  double get maxAvatarRadius => scrSWidth / 4;

  /// Elevation
  double get cardElevation => config.cardElevation;
  double get buttonElevation => config.buttonElevation;

  /// Длительности анимаций
  Duration get textSaveDelayDuration => const Duration(milliseconds: 500);
  Duration get kbRelatedAnimationDuration => const Duration(milliseconds: 300);
}

/// Глобальный экземпляр констант (будет инициализирован при настройке темы)
UIConstants? _globalConstants;

/// Получить глобальные константы
UIConstants get constants {
  if (_globalConstants == null) {
    throw FlutterError(
      'UIConstants not initialized. Make sure to wrap your app with UIThemeProvider.',
    );
  }
  return _globalConstants!;
}


/// Расширение для BuildContext для удобного доступа к константам
extension UIConstantsExtension on BuildContext {
  UIConstants get ui => constants;
}
