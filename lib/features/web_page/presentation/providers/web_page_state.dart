// class BookmarkState {
//   final BookMarkController bookmark;
//   final List<BookMark> data;
//   final String selectedUrl;
//   const BookmarkState(
//       {required this.bookmark, this.data = const [], this.selectedUrl = ''});
// }

import 'package:webview_flutter/webview_flutter.dart';

class WebPageState {
  final WebViewController webPageController;
  final bool canGoBack;
  final bool canGoForward;
  const WebPageState(
      {required this.webPageController,
      this.canGoBack = false,
      this.canGoForward = false});
}
