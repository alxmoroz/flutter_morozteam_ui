// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/svg.dart'; // TODO: Add flutter_svg dependency

enum ImageName {
  app_icon,
  delete,
  empty_sources,
  empty_tasks,
  finance,
  goal,
  goal_done,
  google_calendar,
  hello,
  import,
  loading,
  mail_icon,
  no_info,
  not_found,
  notifications,
  privacy,
  purchase,
  relations,
  save,
  server_error,
  sync,
  team,
  telegram_icon,
  transfer,
  upgrade,
  vk_icon,
  web_icon,
}

String _assetPath(String name, BuildContext context) {
  final dark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
  return 'assets/images/$name${dark ? '_dark' : ''}.png';
}

double _defaultImageHeight(BuildContext context) => min(200, max(120, MediaQuery.sizeOf(context).height / 3.5));

// TODO: Add flutter_svg dependency to enable SVG support
// class MTSvgImage extends StatelessWidget {
//   const MTSvgImage(this.name, {this.width, this.height, super.key});
//   final String name;
//   final double? width;
//   final double? height;

//   @override
//   Widget build(BuildContext context) {
//     return SvgPicture.asset('assets/images/$name.svg', width: width, height: height);
//   }
// }

class MTImage extends StatelessWidget {
  const MTImage(this.name, {super.key, this.height, this.width, this.fallbackName});
  final String? name;
  final double? height;
  final double? width;
  final String? fallbackName;

  @override
  Widget build(BuildContext context) {
    final h = height ?? _defaultImageHeight(context);
    final w = width ?? h;

    return SizedBox(
      width: w,
      height: h,
      child: Image.asset(
        _assetPath(name ?? fallbackName ?? 'no_info', context),
        errorBuilder: (_, __, ___) => Image.asset(
          _assetPath(fallbackName ?? 'no_info', context),
        ),
      ),
    );
  }
}

class MTNetworkImage extends StatelessWidget {
  const MTNetworkImage(
    this.url, {
    super.key,
    this.height,
    this.width,
    this.fallbackName = 'category-icon-placeholder',
    this.color,
  });

  final String? url;
  final double? height;
  final double? width;
  final String fallbackName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final h = height ?? _defaultImageHeight(context);
    final w = width ?? h;

    return SizedBox(
      width: w,
      height: h,
      child: _isValidUrl(url)
          ? Image.network(url!, errorBuilder: (context, error, stackTrace) => _buildFallbackImage(context))
          : _buildFallbackImage(context),
    );
  }

  Widget _buildFallbackImage(BuildContext context) {
    return Image.asset(_assetPath(fallbackName, context), color: color);
  }

  bool _isValidUrl(String? url) {
    return url != null && url.isNotEmpty && url.startsWith('http');
  }
}
