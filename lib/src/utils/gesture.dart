// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// Типы тактильной обратной связи
enum FeedbackType { light, medium, heavy, vibrate, selection }

/// Убрать фокус со всех элементов
void unfocusAll() {
  final fm = FocusManager.instance;
  fm.applyFocusChangesIfNeeded();
  fm.primaryFocus?.unfocus();
}

/// Миксин для управления жестами и тактильной обратной связью
mixin GestureManaging {
  /// Выполнить действие с управлением фокусом и тактильной обратной связью
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

/// Виджет, который убирает фокус при нажатии
class FocusDroppable extends StatelessWidget {
  const FocusDroppable(this.child, {super.key});
  final Widget? child;

  @override
  Widget build(BuildContext context) => GestureDetector(onTap: unfocusAll, child: child);
}
