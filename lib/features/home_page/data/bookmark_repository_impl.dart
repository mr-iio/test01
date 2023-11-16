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
  Future<void> saveValue(BookMarkController bookmark) {
    return datasource.saveValue(bookmark);
  }

  @override
  Future<void> deleteValue(int id) {
    return datasource.deleteValue(id);
  }

  @override
  Future<List<BookMark>> fetchDataFromDatabase() {
    return datasource.fetchDataFromDatabase();
  }
}
