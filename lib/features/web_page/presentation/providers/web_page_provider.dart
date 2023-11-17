import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/web_page/presentation/providers/web_page_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

final webPageNotifierProvider =
    NotifierProvider<WebPageNotifier, WebPageState>(WebPageNotifier.new);

class WebPageNotifier extends Notifier<WebPageState> {
  @override
  WebPageState build() {
    return WebPageState(webPageController: WebViewController());
  }

  void canGoBack(bool bool) {
    state = WebPageState(
        webPageController: state.webPageController,
        canGoBack: bool,
        canGoForward: state.canGoForward);
  }

  void canGoForward(bool bool) {
    state = WebPageState(
        webPageController: state.webPageController,
        canGoBack: state.canGoBack,
        canGoForward: bool);
  }
}
