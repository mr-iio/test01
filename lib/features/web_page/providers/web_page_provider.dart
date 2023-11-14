import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

final webPageController =
    StateProvider<WebViewController>((ref) => WebViewController());
final selectedButtonNumber = StateProvider((ref) => 3);
