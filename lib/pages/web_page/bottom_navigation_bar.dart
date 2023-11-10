import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WebBottomNavigationBar extends StatefulWidget {
  final WebViewController? controller;
  const WebBottomNavigationBar({Key? key, required this.controller})
      : super(key: key);

  @override
  State<WebBottomNavigationBar> createState() => _WebBottomNavigationBarState();
}

class _WebBottomNavigationBarState extends State<WebBottomNavigationBar> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.arrow_back),
          label: L10n.of(context).back,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.arrow_forward),
          label: L10n.of(context).forward,
        ),
        BottomNavigationBarItem(
            icon: const Icon(Icons.refresh), label: L10n.of(context).reload),
        BottomNavigationBarItem(
            icon: const Icon(Icons.close), label: L10n.of(context).close),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: (index) async {
        setState(() {
          selectedIndex = index;
        });
        if (index == 0) {
          if (await widget.controller!.canGoBack()) {
            widget.controller!.goBack();
          }
        } else if (index == 1) {
          if (await widget.controller!.canGoForward()) {
            widget.controller!.goForward();
          }
        } else if (index == 2) {
          widget.controller!.reload();
        } else {
          Navigator.pop(context);
        }
      },
    );
  }
}
