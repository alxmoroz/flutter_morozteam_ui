// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

/// Обертка для Material виджетов
Widget material(Widget child, {Color? color}) => 
    Material(color: color ?? Colors.transparent, child: child);
