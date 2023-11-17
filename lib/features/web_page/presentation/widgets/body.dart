import 'package:flutter/material.dart';
import 'package:test01/features/web_page/presentation/providers/web_page_provider.dart';
import 'package:test01/features/web_page/presentation/providers/web_page_state.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebBody extends StatefulWidget {
  final String url;
  const WebBody({Key? key, required this.url}) : super(key: key);

  @override
  State<WebBody> createState() => _WebBodyState();
}

class _WebBodyState extends State<WebBody> {
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // webviewControllerはref.watch()ではダメ
        final state = ref.read(webPageNotifierProvider);
        final selectedUrl = widget.url;
        // webviewcontrollerの詳細
        state.webPageController
          ..setNavigationDelegate(NavigationDelegate(
            onProgress: (progress) {
              this.progress = progress / 100;
            },
            //ここにボタン非活性の処理を追加したい
            onUrlChange: (_) async {
              // if (!await state.webPageController.canGoBack()) {
              //   state = WebPageState(webPageController: state.webPageController);
              // }
            },
          ))
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(selectedUrl));

        return Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              color: Colors.red,
              backgroundColor: Colors.grey,
            ),
            Expanded(
              child: WebViewWidget(controller: state.webPageController),
            ),
          ],
        );
      },
    );
  }
}
