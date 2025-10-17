// Copyright (c) 2025. Alexandr Moroz

import 'dart:convert';
import 'package:crypto/crypto.dart';

/// Generate MD5 hash for email (used for Gravatar)
String emailToMD5(String email) {
  final normalizedEmail = email.trim().toLowerCase();
  final bytes = utf8.encode(normalizedEmail);
  final digest = md5.convert(bytes);
  return digest.toString();
}
