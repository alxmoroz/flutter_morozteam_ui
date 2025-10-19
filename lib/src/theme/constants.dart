// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

// ============================================================================
// Compile-time constants (4px grid)
// ============================================================================

/// Base spacing unit (4px grid) - internal use only
const double P = 4.0;
const double P2 = P * 2.0; // 8
const double P3 = P * 3.0; // 12
const double P4 = P * 4.0; // 16
const double P5 = P * 5.0; // 20
const double P6 = P * 6.0; // 24
const double P7 = P * 7.0; // 28
const double P8 = P * 8.0; // 32
const double P9 = P * 9.0; // 36
const double P10 = P * 10.0; // 40
const double P11 = P * 11.0; // 44
const double P12 = P * 12.0; // 48
const double P15 = P * 15.0; // 60

const double P_2 = P / 2; // 2

// Semantic constants - Page padding
const double DEF_PAGE_TOP_PADDING = P5;
const double DEF_PAGE_BOTTOM_PADDING = P8;
const double DEF_DIALOG_BOTTOM_PADDING = P5;

// Semantic constants - Standard padding/margin
const double DEF_HP = P5;
const double DEF_VP = P3;
const EdgeInsets DEF_PADDING = EdgeInsets.symmetric(horizontal: DEF_HP, vertical: DEF_VP);
const EdgeInsets DEF_MARGIN = EdgeInsets.fromLTRB(DEF_HP, DEF_VP, DEF_HP, 0);

// Semantic constants - Border
const double DEF_BORDER_RADIUS = P3;
const double DEF_BORDER_WIDTH = P_2;

// Semantic constants - Sizes
const double MIN_BTN_HEIGHT = P12;
const double DEF_BAR_HEIGHT = P12;
const double DEF_TAPPABLE_ICON_SIZE = kIsWeb ? P8 : P9;
const double DEF_BTN_BORDER_RADIUS = MIN_BTN_HEIGHT / 2;
const double DEF_ICON_SIZE = P6;
const double DEF_SMALL_PADDING = P2;
const double DEF_LOADING_ICON_SIZE = P4;
const double DEF_PROGRESS_SIZE = P9;

// Semantic constants - Avatar
const double MAX_AVATAR_RADIUS = SCR_S_WIDTH / 4;

// Semantic constants - Breakpoints
const double SCR_XXS_WIDTH = 290;
const double SCR_XS_WIDTH = 364;
const double SCR_XS_HEIGHT = 480;
const double SCR_S_WIDTH = 480;
const double SCR_S_HEIGHT = 640;
const double SCR_M_WIDTH = 640;
const double SCR_M_HEIGHT = 860;
const double SCR_L_WIDTH = 760;
const double SCR_XL_WIDTH = 960;
const double SCR_XXL_WIDTH = 1280;

// Semantic constants - Durations
const TEXT_SAVE_DELAY_DURATION = Duration(milliseconds: 500);
const KB_RELATED_ANIMATION_DURATION = Duration(milliseconds: 300);

// Semantic constants - Elevation
double get cardElevation => kIsWeb ? 3 : 1;
double get buttonElevation => kIsWeb ? 3 : 1;
