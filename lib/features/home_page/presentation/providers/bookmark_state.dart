import 'package:test01/shared/models/bookmark_models.dart';

class BookmarkState {
  final BookMarkController bookmark;
  final List<BookMark> data;
  const BookmarkState({required this.bookmark, this.data = const []});
}
