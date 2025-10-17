// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart'; // TODO: Add webview_flutter dependency
import '../theme/colors.dart';
import 'circular_progress.dart';
// import 'dialog.dart'; // TODO: Add dialog component

class MTWebViewDialog extends StatelessWidget {
  const MTWebViewDialog._(this.uri, {this.onUrlExit, this.bgColor, this.js});
  final Uri uri;
  final bool Function(String)? onUrlExit;
  final Color? bgColor;
  final String? js;

  static Future<Uri?> show(Uri uri, {bool Function(String)? onUrlExit, Color? bgColor, String? js}) async {
    // TODO: Implement showMTDialog
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = (this.bgColor ?? colors.b2Color).resolve(context);

    return Container(
      color: bgColor,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MTCircularProgress(size: 40.0),
            SizedBox(height: 16),
            Text('WebView requires webview_flutter dependency'),
          ],
        ),
      ),
    );
  }
}
