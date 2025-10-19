// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

/// Controller for toolbar height management
class MTToolbarController extends ChangeNotifier {
  MTToolbarController({double? height}) : _height = height;

  double? _height;

  /// Current toolbar height
  double? get height => _height;

  /// Set toolbar height
  set height(double? value) {
    if (_height != value) {
      _height = value;
      notifyListeners();
    }
  }
}
