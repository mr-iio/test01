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

  void setCanGoState() async {
    state = WebPageState(
        webPageController: state.webPageController,
        canGoBack: await state.webPageController.canGoBack(),
        canGoForward: await state.webPageController.canGoForward());
  }

  void canGoForward(bool bool) {
    state = WebPageState(
        webPageController: state.webPageController,
        canGoBack: state.canGoBack,
        canGoForward: bool);
  }
}
