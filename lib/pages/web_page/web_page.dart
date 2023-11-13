import 'package:flutter/material.dart';
import 'package:test01/pages/web_page/body.dart';
import 'package:test01/pages/web_page/bottom_navigation_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/shared/provider.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});
  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  //WebViewを管理するコントローラー
  WebViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(ref.watch(selectedUrl)),
            automaticallyImplyLeading: false,
          ),
          body: const WebBody(),
          bottomNavigationBar: const WebBottomNavigationBar(),
        );
      },
    );
  }
}
