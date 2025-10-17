// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../theme/colors.dart';
import 'circular_progress.dart';
import 'toolbar.dart';
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

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setOnConsoleMessage((jsMsg) {
        if (kDebugMode) print(jsMsg.message);
      })
      ..setBackgroundColor(bgColor)
      ..loadRequest(uri);

    controller.setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (request) {
          if (onUrlExit != null) {
            if (onUrlExit!(request.url)) {
              Navigator.of(context).pop(Uri.parse(request.url));
              return NavigationDecision.prevent;
            }
          }
          return NavigationDecision.navigate;
        },
        onPageFinished: (_) {
          if (js?.isNotEmpty == true) {
            controller.runJavaScript(js!);
          }
        },
      ),
    );

    return Container(
      color: bgColor,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              color: bgColor,
              child: const Center(child: MTCircularProgress(size: 40.0)), // constants.P10
            ),
            WebViewWidget(
              gestureRecognizers: const {Factory<VerticalDragGestureRecognizer>(VerticalDragGestureRecognizer.new)},
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
