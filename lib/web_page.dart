import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String url;
  const WebPage({Key? key, required this.url}) : super(key: key);
  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late WebViewController controller; //WebViewを管理するコントローラー
  int selectedIndex = 3;
  double progress = 0;
  // bool canGoBack = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _updateCanGoBack();
  // }

  // Future<void> _updateCanGoBack() async {
  //   final _canGoBack = await controller.canGoBack();
  //   setState(() {
  //     canGoBack = _canGoBack;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final url = widget.url;
    return Scaffold(
      appBar: AppBar(
        title: Text(url),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            color: Colors.red,
            backgroundColor: Colors.grey,
          ),
          Expanded(
            child: WebView(
              initialUrl: url,
              // JavaScriptを有効にするか制限するかを設定ß
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                this.controller = controller; //このWebViewを管理する
              },
              onProgress: (progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
          ),
        ],
      ),
      // persistentFooterButtons: [
      //   ElevatedButton(
      //     onPressed: () async {
      //       if (await controller.canGoBack()) {
      //         controller.goBack();
      //       }
      //     },
      //     child: const Column(
      //       children: [Icon(Icons.arrow_back), Text('戻る')],
      //     ),
      //   ),
      //   ElevatedButton(
      //     onPressed: (canGoBack)
      //         ? () {
      //             controller.goForward();
      //           }
      //         : null,
      //     child: const Column(
      //       children: [Icon(Icons.arrow_forward), Text('進む')],
      //     ),
      //   ),
      //   ElevatedButton(
      //     onPressed: () {
      //       controller.reload();
      //     },
      //     child: const Column(
      //       children: [Icon(Icons.refresh), Text('更新')],
      //     ),
      //   ),
      //   ElevatedButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Column(
      //       children: [Icon(Icons.close), Text('終了')],
      //     ),
      //   )
      // ],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: '戻る',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: '進む',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: '更新'),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: '終了'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) async {
          if (index == 0) {
            if (await controller.canGoBack()) {
              selectedIndex = 0;
              controller.goBack();
            }
          } else if (index == 1) {
            if (await controller.canGoForward()) {
              selectedIndex = 1;
              controller.goForward();
            }
          } else if (index == 2) {
            selectedIndex = 2;
            controller.reload();
          } else if (index == 3) {
            selectedIndex = 3;
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
