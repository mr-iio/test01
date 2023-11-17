import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/home_page/domain/book_mark_provider.dart';
import 'package:test01/features/home_page/presentation/providers/bookmark_state.dart';
import 'package:test01/shared/models/bookmark_models.dart';
import 'package:flutter/material.dart';

final bookmarkNotifierProvider =
    NotifierProvider<BookmarkNotifier, BookmarkState>(BookmarkNotifier.new);

class BookmarkNotifier extends Notifier<BookmarkState> {
  @override
  BookmarkState build() {
    return BookmarkState(
        bookmark: BookmarkController(
            title: TextEditingController(), url: TextEditingController()));
  }

  Future<void> data() async {
    final repository = ref.read(bookmarkDBProvider);
    await repository.initializeDatabase();
    final List<Bookmark> nextData = await repository.fetchDataFromDatabase();
    state = BookmarkState(
      bookmark: state.bookmark,
      data: nextData,
    );
  }

  Future<void> saveBookmark(BookmarkController bookmark) async {
    final repository = ref.read(bookmarkDBProvider);
    await repository.saveBookmark(bookmark);
  }

  Future<void> deleteBookmark(int id) async {
    final repository = ref.read(bookmarkDBProvider);
    await repository.deleteBookmark(id);
  }
}
