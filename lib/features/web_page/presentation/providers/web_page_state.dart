import 'package:webview_flutter/webview_flutter.dart';

class WebPageState {
  final WebViewController webPageController;
  final bool canGoBack;
  final bool canGoForward;
  final bool isLoading;
  const WebPageState(
      {required this.webPageController,
      this.canGoBack = false,
      this.canGoForward = false,
      this.isLoading = true});
}
