import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/shared/provider.dart';

class WebBody extends StatefulWidget {
  const WebBody({super.key});

  @override
  State<WebBody> createState() => _WebBodyState();
}

class _WebBodyState extends State<WebBody> {
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // webviewcontrollerの詳細
        Future(() {
          ref.read(webPageController.notifier).state
            ..setNavigationDelegate(NavigationDelegate(
              onProgress: (progress) {
                this.progress = progress / 100;
              },
              onUrlChange: (_) async {
                if (!await ref.read(webPageController).canGoBack()) {
                  ref.read(cantGoBack.notifier).state = false;
                }
              },
            ))
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(Uri.parse(ref.watch(selectedUrl)));
        });

        return Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              color: Colors.red,
              backgroundColor: Colors.grey,
            ),
            Expanded(
              child: WebViewWidget(controller: ref.read(webPageController)),
            ),
          ],
        );
      },
    );
  }
}
