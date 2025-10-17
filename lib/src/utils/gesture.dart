// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// Types of haptic feedback
enum FeedbackType { light, medium, heavy, vibrate, selection }

/// Remove focus from all elements
void unfocusAll() {
  final fm = FocusManager.instance;
  fm.applyFocusChangesIfNeeded();
  fm.primaryFocus?.unfocus();
}

/// Mixin for gesture management and haptic feedback
mixin GestureManaging {
  /// Execute action with focus management and haptic feedback
  Future tapAction(bool uf, Function action, {FeedbackType? fbType}) async {
    if (uf) unfocusAll();

    if (fbType != null) {
      switch (fbType) {
        case FeedbackType.light:
          await HapticFeedback.lightImpact();
          break;
        case FeedbackType.medium:
          await SystemSound.play(SystemSoundType.click);
          await HapticFeedback.mediumImpact();
          break;
        case FeedbackType.heavy:
          await HapticFeedback.heavyImpact();
          break;
        case FeedbackType.vibrate:
          await HapticFeedback.vibrate();
          break;
        case FeedbackType.selection:
          await HapticFeedback.selectionClick();
          break;
      }
    }

    await action();
  }
}

/// Widget that removes focus when tapped
class FocusDroppable extends StatelessWidget {
  const FocusDroppable(this.child, {super.key});
  final Widget? child;

  @override
  Widget build(BuildContext context) => GestureDetector(onTap: unfocusAll, child: child);
}
