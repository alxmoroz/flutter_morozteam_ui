// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../theme/colors.dart';
import 'button.dart';
import 'circular_progress.dart';
import 'dialog.dart';
import 'toolbar.dart';

class MTWebViewDialog extends StatelessWidget {
  const MTWebViewDialog._(this.uri, {this.onUrlExit, this.bgColor, this.js});
  final Uri uri;
  final bool Function(String)? onUrlExit;
  final Color? bgColor;
  final String? js;

  static Future<Uri?> show(Uri uri, {bool Function(String)? onUrlExit, Color? bgColor, String? js}) async {
    return await showMTDialog<Uri?>(
      MTWebViewDialog._(uri, onUrlExit: onUrlExit, bgColor: bgColor, js: js),
    );
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

    return MTDialog(
      topBar: MTTopBar(
        pageTitle: 'WebView',
        leading: MTButton.icon(
          Icon(Icons.close),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      bgColor: bgColor,
      body: Stack(
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
    );
  }
}
