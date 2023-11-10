import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebBody extends StatefulWidget {
  final String url;
  final Function(WebViewController) f;
  // late WebViewController controller;
  const WebBody({Key? key, required this.url, required this.f})
      : super(key: key);

  @override
  State<WebBody> createState() => _WebBodyState();
}

class _WebBodyState extends State<WebBody> {
  // //WebViewを管理するコントローラー
  late WebViewController controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: progress,
          color: Colors.red,
          backgroundColor: Colors.grey,
        ),
        Expanded(
          child: WebView(
            initialUrl: widget.url,
            // JavaScriptを有効にするか制限するかを設定ß
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (v) {
              //このWebViewを管理するコントローラー
              controller = v;
              widget.f(v);
            },
            onProgress: (progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
          ),
        ),
      ],
    );
  }
}
