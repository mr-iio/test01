import 'package:test01/shared/models/bookmark_models.dart';

class BookmarkState {
  final BookmarkFormController bookmarkFormController;
  final List<Bookmark> data;
  const BookmarkState(
      {required this.bookmarkFormController, this.data = const []});
}
