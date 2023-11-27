import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/web_page/presentation/providers/web_page_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

final webPageNotifierProvider = NotifierProvider.autoDispose
    .family<WebPageNotifier, WebPageState, String>(WebPageNotifier.new);

class WebPageNotifier extends AutoDisposeFamilyNotifier<WebPageState, String> {
  @override
  WebPageState build(String arg) {
    return WebPageState(
        webPageController: WebViewController()
          ..setNavigationDelegate(NavigationDelegate(
            onPageStarted: (_) {
              startLoading();
            },
            onPageFinished: (_) {
              endLoading();
            },
            onUrlChange: (_) {
              setCanGoState();
            },
          ))
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(arg)),
        canGoBack: false,
        canGoForward: false,
        isLoading: true);
  }

  Future<void> setCanGoState() async {
    state = WebPageState(
        webPageController: state.webPageController,
        canGoBack: await state.webPageController.canGoBack(),
        canGoForward: await state.webPageController.canGoForward(),
        isLoading: state.isLoading);
  }

  void startLoading() {
    state = WebPageState(
        webPageController: state.webPageController,
        canGoBack: state.canGoBack,
        canGoForward: state.canGoForward,
        isLoading: true);
  }

  void endLoading() {
    state = WebPageState(
        webPageController: state.webPageController,
        canGoBack: state.canGoBack,
        canGoForward: state.canGoForward,
        isLoading: false);
  }
}
