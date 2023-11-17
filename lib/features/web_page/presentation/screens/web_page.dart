import 'package:flutter/material.dart';
import 'package:test01/features/web_page/presentation/widgets/body.dart';
import 'package:test01/features/web_page/presentation/widgets/bottom_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/shared/models/bookmark_models.dart';

class WebPage extends StatefulWidget {
  final Bookmark bookmarkFormController;
  const WebPage({Key? key, required this.bookmarkFormController})
      : super(key: key);
  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    final selectedTitle = widget.bookmarkFormController.title;
    final selectedUrl = widget.bookmarkFormController.url;
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(selectedTitle),
            automaticallyImplyLeading: false,
          ),
          body: WebBody(url: selectedUrl),
          bottomNavigationBar: const WebBottomAppBar(),
        );
      },
    );
  }
}
