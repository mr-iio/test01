import 'package:test01/features/home_page/data/bookmark_datasource.dart';
import 'package:test01/features/home_page/domain/bookmark_repository.dart';
import 'package:test01/shared/models/bookmark_models.dart';

class BookmarkRepositoryImpl extends BookmarkRepository {
  final BookmarkDatasource datasource;
  BookmarkRepositoryImpl(this.datasource);

  @override
  Future<void> initializeDatabase() {
    return datasource.initializeDatabase();
  }

  @override
  Future<void> saveValue(String title, String url) {
    return datasource.saveValue(title, url);
  }

  @override
  Future<void> deleteValue(String title, String url) {
    return datasource.deleteValue(title, url);
  }

  @override
  Future<List<BookMark>> fetchDataFromDatabase() {
    return datasource.fetchDataFromDatabase();
  }
}
