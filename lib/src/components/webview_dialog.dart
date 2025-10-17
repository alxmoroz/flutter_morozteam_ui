// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../theme/colors.dart';
import '../theme/constants.dart';
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
    Uri? uri,
    String? filePath,
    String? js,
    bool Function(String)? onUrlExit,
    Color bgColor = const Color.fromARGB(0, 255, 255, 255),
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
      ..setBackgroundColor(bgColor.resolve(globalContext));

    if (uri != null) {
      controller.loadRequest(uri);
      controller.setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            if (onUrlExit != null) {
              if (onUrlExit(request.url)) {
                Navigator.of(globalContext).pop(Uri.parse(request.url));
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

    return await showMTDialog<Uri?>(MTWebViewDialog._(controller, bgColor: bgColor, safeArea: safeArea));
  }

  Widget _inner(WebViewController controller) {
    return Stack(
      children: [
        Container(color: bgColor, child: Center(child: MTCircularProgress(size: constants.P10))),
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
      topBar: MTTopBar(barColor: bgColor),
      bgColor: bgColor,
      body: safeArea ? SafeArea(child: _inner(_controller)) : _inner(_controller),
    );
  }
}
