import 'package:flutter/material.dart';
import 'package:test01/features/home_page/providers/home_page_provider.dart';
import 'package:test01/features/web_page/widgets/body.dart';
import 'package:test01/features/web_page/widgets/bottom_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});
  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
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
