import 'package:flutter/material.dart';
import 'package:test01/features/web_page/presentation/widgets/body.dart';
import 'package:test01/features/web_page/presentation/widgets/bottom_appbar.dart';
import 'package:test01/shared/models/bookmark_models.dart';

class WebPage extends StatelessWidget {
  final Bookmark bookmarkFormController;
  const WebPage({Key? key, required this.bookmarkFormController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookmarkFormController.title),
        automaticallyImplyLeading: false,
      ),
      body: WebBody(url: bookmarkFormController.url),
      bottomNavigationBar: WebBottomAppBar(url: bookmarkFormController.url),
    );
  }
}
