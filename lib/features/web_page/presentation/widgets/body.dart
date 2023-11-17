import 'package:flutter/material.dart';
import 'package:test01/features/web_page/presentation/providers/web_page_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebBody extends ConsumerStatefulWidget {
  final String url;
  const WebBody({Key? key, required this.url}) : super(key: key);

  @override
  ConsumerState<WebBody> createState() => _WebBodyState();
}

class _WebBodyState extends ConsumerState<WebBody> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    final state = ref.read(webPageNotifierProvider);
    final notifier = ref.read(webPageNotifierProvider.notifier);
    // webviewcontrollerの詳細
    state.webPageController
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (_) {
          if (mounted) {
            setState(() {
              isLoading = true;
            });
          }
        },
        onPageFinished: (_) {
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        },
        onUrlChange: (_) async {
          notifier.setCanGoState();
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(webPageNotifierProvider);
    return Column(
      children: [
        isLoading
            ? const LinearProgressIndicator(
                color: Colors.red,
                backgroundColor: Colors.grey,
              )
            : const SizedBox.shrink(),
        Expanded(
          child: WebViewWidget(controller: state.webPageController),
        ),
      ],
    );
  }
}
