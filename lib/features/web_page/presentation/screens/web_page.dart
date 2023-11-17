import 'package:flutter/material.dart';
import 'package:test01/features/web_page/presentation/widgets/body.dart';
import 'package:test01/features/web_page/presentation/widgets/bottom_appbar.dart';
import 'package:test01/features/web_page/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebPage extends StatefulWidget {
  final String url;
  const WebPage({Key? key, required this.url}) : super(key: key);
  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    final selectedUrl = widget.url;
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(selectedUrl),
            automaticallyImplyLeading: false,
          ),
          body: WebBody(url: selectedUrl),
          bottomNavigationBar: const WebBottomAppBar(),
        );
      },
    );
  }
}
