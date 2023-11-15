import 'package:test01/shared/models/bookmark_models.dart';

abstract class BookmarkRepository {
  Future<void> initializeDatabase();
  Future<void> saveValue(String title, String url);
  Future<void> deleteValue(String title, String url);
  Future<List<BookMark>> fetchDataFromDatabase();
}
