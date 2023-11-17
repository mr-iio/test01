import 'package:test01/shared/models/bookmark_models.dart';

abstract class BookmarkRepository {
  Future<void> initializeDatabase();
  Future<void> saveBookmark(BookmarkFormController bookmarkFormController);
  Future<void> deleteBookmark(int id);
  Future<List<Bookmark>> fetchDataFromDatabase();
}
