import 'package:flutter/material.dart';
import 'package:test01/features/web_page/presentation/providers/web_page_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebBody extends ConsumerWidget {
  final String url;
  const WebBody({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(webPageNotifierProvider(url));
    return Column(
      children: [
        state.isLoading
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
