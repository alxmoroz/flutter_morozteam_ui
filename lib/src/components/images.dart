// Copyright (c) 2025. Alexandr Moroz

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

double _defaultImageHeight(BuildContext context) => min(200, max(120, MediaQuery.sizeOf(context).height / 3.5));

class MTSvgImage extends StatelessWidget {
  const MTSvgImage(this.name, {this.width, this.height, super.key});
  final String name;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final dark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;

    return SvgPicture.asset(
      // Try dark version first if in dark mode
      dark ? 'assets/images/${name}_dark.svg' : 'assets/images/$name.svg',
      width: width,
      height: height,
      // Fallback to light version if dark version doesn't exist
      errorBuilder: (context, error, stackTrace) {
        if (dark) {
          // If dark version failed, try light version
          return SvgPicture.asset(
            'assets/images/$name.svg',
            width: width,
            height: height,
          );
        }
        // If light version also failed, show empty
        return const SizedBox.shrink();
      },
    );
  }
}

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
    final dark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    final imageName = name ?? fallbackName ?? 'no_info';

    return SizedBox(
      width: w,
      height: h,
      child: Image.asset(
        // Try dark version first if in dark mode
        dark ? 'assets/images/${imageName}_dark.png' : 'assets/images/$imageName.png',
        errorBuilder: (_, _, _) {
          // Fallback 1: If dark failed, try light version
          if (dark) {
            return Image.asset(
              'assets/images/$imageName.png',
              errorBuilder: (_, _, _) {
                // Fallback 2: If light also failed, try fallbackName
                if (fallbackName != null && fallbackName != imageName) {
                  return Image.asset('assets/images/$fallbackName.png');
                }
                // Fallback 3: Show placeholder or empty
                return const SizedBox.shrink();
              },
            );
          }
          // If not dark or light failed, try fallbackName
          if (fallbackName != null && fallbackName != imageName) {
            return Image.asset('assets/images/$fallbackName.png');
          }
          return const SizedBox.shrink();
        },
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
    this.fallbackName,
    this.color,
  });

  final String? url;
  final double? height;
  final double? width;
  final String? fallbackName;
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
    if (fallbackName == null) {
      return const SizedBox.shrink(); // No fallback = empty
    }

    final dark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    return Image.asset(
      dark ? 'assets/images/${fallbackName}_dark.png' : 'assets/images/$fallbackName.png',
      color: color,
      errorBuilder: (_, _, _) {
        // Try light version if dark fails
        if (dark) {
          return Image.asset(
            'assets/images/$fallbackName.png',
            color: color,
            errorBuilder: (_, _, _) => const SizedBox.shrink(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  bool _isValidUrl(String? url) {
    return url != null && url.isNotEmpty && url.startsWith('http');
  }
}
