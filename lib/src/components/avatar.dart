// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text.dart';
import 'circle.dart';

const double MAX_AVATAR_RADIUS = 200.0; // constants.sWidth / 4

class MTAvatar extends StatelessWidget {
  const MTAvatar(
    this.radius, {
    this.user,
    this.member,
    this.borderColor,
    super.key,
  });
  final double radius;
  final Color? borderColor;
  final User? user;
  final WSMember? member;

  User? get _user => member?.user ?? user;
  bool get _hasAvatar => _user?.hasAvatar == true;
  String get _initials => member?.initials ?? user?.initials ?? '';

  String get _salt => '${_user?.updatedOn?.millisecondsSinceEpoch ?? ''}';
  String? get _fileName => _user?.emailMD5;
  String get _gravatarUrl => 'https://www.gravatar.com/avatar/$_fileName?s=${radius * 6}&d=blank';
  String get _avatarUrl => 'https://api.example.com/v1/avatars/download/$_fileName?$_salt';

  static const _borderWidth = 2.0;
  Color get _noAvatarColor => _user != null ? colors.f2Color : colors.f3Color;
  bool get _hasBorder => borderColor != null;

  Widget _initialsCircle(BuildContext context) {
    final fs = const BaseText('', maxLines: 1).style(context).fontSize ?? 17;
    final sizeScale = radius / fs;
    return MTCircle(
      color: Colors.transparent,
      size: radius * 2,
      border: !_hasBorder ? Border.all(color: _noAvatarColor.resolve(context)) : null,
      child: Center(
        child: BaseText(
          _initials,
          maxLines: 1,
          sizeScale: sizeScale,
          align: TextAlign.center,
          color: borderColor ?? _noAvatarColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final avatar = Stack(
      alignment: Alignment.center,
      children: [
        _initials.isNotEmpty
            ? _initialsCircle(context)
            : Icon(Icons.person, size: radius * (_hasBorder ? 1.3 : 2), color: _noAvatarColor.resolve(context)),
        CircleAvatar(
          radius: radius - (_hasBorder ? _borderWidth : 0),
          backgroundColor: Colors.transparent,
          backgroundImage: !_hasAvatar && _user != null ? NetworkImage(_gravatarUrl) : null,
          foregroundImage: _hasAvatar ? NetworkImage(_avatarUrl) : null,
        ),
      ],
    );
    return MTCircle(
      size: radius * 2,
      color: colors.b3Color,
      border: _hasBorder ? Border.all(width: _borderWidth, color: borderColor!.resolve(context)) : null,
      child: avatar,
    );
  }
}

// Placeholder classes for user data
class User {
  final bool hasAvatar;
  final String? emailMD5;
  final DateTime? updatedOn;
  final String initials;

  const User({
    this.hasAvatar = false,
    this.emailMD5,
    this.updatedOn,
    this.initials = '',
  });
}

class WSMember {
  final User? user;
  final String initials;

  const WSMember({
    this.user,
    this.initials = '',
  });
}
