// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../theme/constants.dart';
import '../theme/resolved_color.dart';
import 'circular_progress.dart';
import 'dialog.dart';
import 'toolbar.dart';

class MTWebViewDialog extends StatelessWidget {
  const MTWebViewDialog._(
    this._controller, {
    required this.bgColor,
    required this.safeArea,
  });

  final WebViewController _controller;
  final Color bgColor;
  final bool safeArea;

  static Future<Uri?> show({
    required BuildContext context,
    Uri? uri,
    String? filePath,
    String? js,
    bool Function(String)? onUrlExit,
    Color bgColor = Colors.transparent,
    bool safeArea = true,
  }) async {
    assert(uri != null || filePath != null);

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setOnConsoleMessage((jsMsg) {
        if (kDebugMode) print(jsMsg.message);
      })
      ..clearCache()
      ..clearLocalStorage()
      ..setBackgroundColor(bgColor.resolve(context));

    if (uri != null) {
      controller.loadRequest(uri);
      controller.setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            if (onUrlExit != null) {
              if (onUrlExit(request.url)) {
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
    } else if (filePath != null) {
      controller.loadFile(filePath);
    }

    return await showMTDialog<Uri?>(
      MTWebViewDialog._(controller, bgColor: bgColor, safeArea: safeArea),
      context: context,
    );
  }

  Widget _inner(WebViewController controller) {
    return Stack(
      children: [
        Container(color: bgColor, child: const Center(child: MTCircularProgress(size: P15))),
        WebViewWidget(
          gestureRecognizers: const {
            Factory<VerticalDragGestureRecognizer>(VerticalDragGestureRecognizer.new),
            Factory<HorizontalDragGestureRecognizer>(HorizontalDragGestureRecognizer.new),
            Factory<PanGestureRecognizer>(PanGestureRecognizer.new),
          },
          controller: controller,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MTDialog(
      topBar: MTTopBar(color: bgColor),
      bgColor: bgColor,
      body: safeArea ? SafeArea(child: _inner(_controller)) : _inner(_controller),
    );
  }
}
