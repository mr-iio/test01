import 'package:flutter/material.dart';
import 'package:test01/pages/web_page/body.dart';
import 'package:test01/pages/web_page/bottom_navigation_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String url;
  const WebPage({Key? key, required this.url}) : super(key: key);
  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  //WebViewを管理するコントローラー
  WebViewController? controller;

  void _setController(WebViewController value) {
    setState(() {
      controller = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final url = widget.url;
    return Scaffold(
      appBar: AppBar(
        title: Text(url),
        automaticallyImplyLeading: false,
      ),
      body: WebBody(url: url, f: _setController),
      bottomNavigationBar: WebBottomNavigationBar(controller: controller),
    );
  }
}
