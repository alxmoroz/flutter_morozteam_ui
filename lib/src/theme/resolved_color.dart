// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';

/// Extension for Color with CupertinoDynamicColor support
extension ResolvedColor on Color {
  Color resolve(BuildContext context) => CupertinoDynamicColor.resolve(this, context);
}
