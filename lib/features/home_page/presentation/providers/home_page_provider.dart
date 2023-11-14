import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/shared/models/bookmark_models.dart';
import 'package:flutter/material.dart';

// final data = StateProvider<List<BookMark>>((ref) => []);
final data = NotifierProvider<_Data, List<BookMark>>(_Data.new);

class _Data extends Notifier<List<BookMark>> {
  @override
  List<BookMark> build() {
    return [];
  }
}

// final selectedUrl = StateProvider((ref) => '');
final selectedUrl = NotifierProvider<_SelectedUrl, String>(_SelectedUrl.new);

class _SelectedUrl extends Notifier<String> {
  @override
  String build() {
    return '';
  }
}

// final nameController = StateProvider((ref) => TextEditingController());
final nameController = NotifierProvider<_NameController, TextEditingController>(
    _NameController.new);

class _NameController extends Notifier<TextEditingController> {
  @override
  TextEditingController build() {
    return TextEditingController();
  }
}

// final urlController = StateProvider((ref) => TextEditingController());
final urlController =
    NotifierProvider<_UrlController, TextEditingController>(_UrlController.new);

class _UrlController extends Notifier<TextEditingController> {
  @override
  TextEditingController build() {
    return TextEditingController();
  }
}
