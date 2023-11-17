import 'package:flutter/material.dart';
import 'package:test01/features/web_page/presentation/providers/web_page_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebBody extends StatefulWidget {
  final String url;
  const WebBody({Key? key, required this.url}) : super(key: key);

  @override
  State<WebBody> createState() => _WebBodyState();
}

class _WebBodyState extends State<WebBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // webviewControllerはref.watch()ではダメ
        final state = ref.read(webPageNotifierProvider);
        final notifier = ref.read(webPageNotifierProvider.notifier);
        final selectedUrl = widget.url;
        // webviewcontrollerの詳細
        state.webPageController
          ..setNavigationDelegate(NavigationDelegate(
            onUrlChange: (_) async {
              if (await state.webPageController.canGoBack()) {
                notifier.canGoBack(true);
              } else {
                notifier.canGoBack(false);
              }
              if (await state.webPageController.canGoForward()) {
                notifier.canGoForward(true);
              } else {
                notifier.canGoForward(false);
              }
            },
          ))
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(selectedUrl));

        return WebViewWidget(controller: state.webPageController);
      },
    );
  }
}
