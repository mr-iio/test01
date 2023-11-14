import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

// final webPageController =
//     StateProvider<WebViewController>((ref) => WebViewController());
final webPageController =
    NotifierProvider<_WebPageController, WebViewController>(
        _WebPageController.new);

class _WebPageController extends Notifier<WebViewController> {
  @override
  WebViewController build() {
    return WebViewController();
  }
}

// final selectedButtonNumber = StateProvider((ref) => 3);
final selectedButtonNumber =
    NotifierProvider<_SelectedButtonNumber, int>(_SelectedButtonNumber.new);

class _SelectedButtonNumber extends Notifier<int> {
  @override
  int build() {
    return 3;
  }
}
