import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/home_page/domain/book_mark_provider.dart';
import 'package:test01/features/home_page/presentation/providers/bookmark_state.dart';
import 'package:test01/shared/models/bookmark_models.dart';
import 'package:flutter/material.dart';

final bookmarkNotifierProvider =
    AsyncNotifierProvider<BookmarkNotifier, BookmarkState>(
        BookmarkNotifier.new);

class BookmarkNotifier extends AsyncNotifier<BookmarkState> {
  @override
  Future<BookmarkState> build() async {
    return BookmarkState(
        bookmarkFormController: BookmarkFormController(
            title: TextEditingController(), url: TextEditingController()),
        data: await _fetchBookmarks());
  }

  Future<List<Bookmark>> _fetchBookmarks() async {
    final repository = ref.read(bookmarkDBProvider);
    return await repository.fetchBookmarks();
  }

  Future<void> fetchBookmarks() async {
    state = const AsyncLoading();
    state = AsyncData(BookmarkState(
      bookmarkFormController: state.value!.bookmarkFormController,
      data: await _fetchBookmarks(),
    ));
  }

  Future<void> saveBookmark(
      BookmarkFormController bookmarkFormController) async {
    final repository = ref.read(bookmarkDBProvider);
    await repository.saveBookmark(bookmarkFormController);
  }

  Future<void> deleteBookmark(int id) async {
    final repository = ref.read(bookmarkDBProvider);
    await repository.deleteBookmark(id);
  }

  Future<void> resetController() async {
    state = const AsyncLoading();
    state = AsyncData(BookmarkState(
      bookmarkFormController: BookmarkFormController(
        title: TextEditingController(),
        url: TextEditingController(),
      ),
      data: state.value!.data,
    ));
  }
}
