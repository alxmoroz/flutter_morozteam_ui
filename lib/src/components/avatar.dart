// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';

import '../config/ui_theme.dart';
import '../theme/resolved_color.dart';
import '../theme/text.dart';
import '../utils/md5.dart';
import 'circle.dart';
import 'icons.dart';

class MTAvatar extends StatelessWidget {
  const MTAvatar(
    this.radius, {
    this.initials = '',
    this.avatarUrl,
    this.gravatarEmail,
    this.borderColor,
    super.key,
  });

  final double radius;
  final String initials;
  final String? avatarUrl; // Direct avatar URL (if provided)
  final String? gravatarEmail; // Email for Gravatar (fallback)
  final Color? borderColor;

  String get _gravatarUrl => 'https://www.gravatar.com/avatar/${emailToMD5(gravatarEmail!)}?s=${radius * 6}&d=blank';

  static const _borderWidth = 2.0;
  Color _noAvatarColor(BuildContext context) => context.colorScheme.f3Color;
  bool get _hasBorder => borderColor != null;

  Widget _initialsCircle(BuildContext context) {
    final fs = const BaseText('', maxLines: 1).style(context).fontSize ?? 17;
    final validRadius = radius > context.sizing.maxAvatarRadius ? context.sizing.maxAvatarRadius : radius;
    final sizeScale = validRadius / fs;
    return MTCircle(
      color: Colors.transparent,
      size: validRadius * 2,
      border: !_hasBorder ? Border.all(color: _noAvatarColor(context).resolve(context)) : null,
      child: Center(
        child: BaseText(
          initials,
          maxLines: 1,
          sizeScale: sizeScale,
          align: TextAlign.center,
          color: borderColor ?? _noAvatarColor(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Validate radius against maximum
    final validRadius = radius > context.sizing.maxAvatarRadius ? context.sizing.maxAvatarRadius : radius;

    final avatar = Stack(
      alignment: Alignment.center,
      children: [
        // Layer 1: Initials or Icon fallback
        initials.isNotEmpty
            ? _initialsCircle(context)
            : PersonNoAvatarIcon(
                size: validRadius * (_hasBorder ? 1.3 : 2), color: _noAvatarColor(context), circled: !_hasBorder),
        // Layer 2: Gravatar (if email provided)
        if (gravatarEmail != null)
          CircleAvatar(
            radius: validRadius - (_hasBorder ? _borderWidth : 0),
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(_gravatarUrl),
          ),
        // Layer 3: Custom avatar (if URL provided)
        if (avatarUrl != null && avatarUrl!.isNotEmpty)
          CircleAvatar(
            radius: validRadius - (_hasBorder ? _borderWidth : 0),
            backgroundColor: Colors.transparent,
            foregroundImage: NetworkImage(avatarUrl!),
          ),
      ],
    );

    return MTCircle(
      size: validRadius * 2,
      color: context.colorScheme.b3Color,
      border: _hasBorder ? Border.all(width: _borderWidth, color: borderColor!.resolve(context)) : null,
      child: avatar,
    );
  }
}
