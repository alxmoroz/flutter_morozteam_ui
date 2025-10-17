// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

/// Wrapper for Material widgets
Widget material(Widget child, {Color? color}) => Material(color: color ?? Colors.transparent, child: child);
