import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/web_page/presentation/providers/web_page_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

// // final webPageController =
// //     StateProvider<WebViewController>((ref) => WebViewController());
// final webPageController =
//     NotifierProvider<_WebPageController, WebViewController>(
//         _WebPageController.new);

// class _WebPageController extends Notifier<WebViewController> {
//   @override
//   WebViewController build() {
//     return WebViewController();
//   }
// }

// // final selectedButtonNumber = StateProvider((ref) => 3);
// final selectedButtonNumber =
//     NotifierProvider<_SelectedButtonNumber, int>(_SelectedButtonNumber.new);

// class _SelectedButtonNumber extends Notifier<int> {
//   @override
//   int build() {
//     return 3;
//   }
// }

final webPageNotifierProvider =
    NotifierProvider<WebPageNotifier, WebPageState>(WebPageNotifier.new);

class WebPageNotifier extends Notifier<WebPageState> {
  @override
  WebPageState build() {
    return WebPageState(webPageController: WebViewController());
  }
}
