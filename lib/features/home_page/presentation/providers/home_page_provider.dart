import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/home_page/domain/book_mark_provider.dart';
import 'package:test01/features/home_page/domain/bookmark_repository.dart';
import 'package:test01/features/home_page/presentation/providers/bookmark_state.dart';
import 'package:test01/shared/models/bookmark_models.dart';
import 'package:flutter/material.dart';

final bookmarkNotifierProvider =
    NotifierProvider<BookmarkNotifier, BookmarkState>(BookmarkNotifier.new);

class BookmarkNotifier extends Notifier<BookmarkState> {
  @override
  BookmarkState build() {
    return BookmarkState(
        bookmark: BookMarkController(
            title: TextEditingController(), url: TextEditingController()));
  }

  Future<void> data() async {
    final repository = ref.read(bookmarkDBProvider);
    final List<BookMark> nextData = await repository.fetchDataFromDatabase();
    state = BookmarkState(
      bookmark: state.bookmark,
      data: nextData,
      selectedUrl: state.selectedUrl,
    );
  }

  Future<void> save() async {
    final repository = ref.read(bookmarkDBProvider);
    await repository.saveValue(state.bookmark);
  }

  Future<void> delete() async {
    final repository = ref.read(bookmarkDBProvider);
    await repository.deleteValue(state.bookmark);
  }
}

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

// final titleController = StateProvider((ref) => TextEditingController());
final titleController =
    NotifierProvider<_TitleController, TextEditingController>(
        _TitleController.new);

class _TitleController extends Notifier<TextEditingController> {
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

final inputController = NotifierProvider<_InputController, BookMarkController>(
    _InputController.new);

class _InputController extends Notifier<BookMarkController> {
  @override
  BookMarkController build() {
    return BookMarkController(
        title: TextEditingController(), url: TextEditingController());
  }
}

//domainで記述したproviderをいい感じにここで使う
final bookmarkProvider =
    Provider<BookmarkRepository>((ref) => ref.watch(bookmarkDBProvider));
