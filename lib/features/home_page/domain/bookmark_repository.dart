import 'package:test01/shared/models/bookmark_models.dart';

abstract class BookmarkRepository {
  Future<void> initializeDatabase();
  Future<void> saveValue(BookMarkController bookmark);
  Future<void> deleteValue(BookMarkController bookmark);
  Future<List<BookMark>> fetchDataFromDatabase();
}
