import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

final selectedUrl = StateProvider((ref) => '');
final nameController = StateProvider((ref) => TextEditingController());
final urlController = StateProvider((ref) => TextEditingController());
final webPageController =
    StateProvider<WebViewController>((ref) => WebViewController());
final selectedButtonNumber = StateProvider((ref) => 3);
final data = StateProvider<List>((ref) => []);
final cantGoBack = StateProvider<bool>((ref) => true);

class listNotifier extends StateNotifier<List> {
  listNotifier() : super([]);
}

// void add(){
//   state = [...];
// }

// final Provider = StateNotifierProvider<List>((ref){Notifier();});