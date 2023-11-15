import 'package:sqflite/sqflite.dart';
import 'package:test01/shared/data/database_helper.dart';
import 'package:test01/shared/models/bookmark_models.dart';

abstract class BookmarkDatasource extends BookmarkLocalDBHelper {
  Future<void> saveValue(BookMarkController bookmark);
  Future<void> deleteValue(BookMarkController bookmark);
  Future<List<BookMark>> fetchDataFromDatabase();
}

class BookmarkLocalDatasource extends BookmarkDatasource {
  @override
  // データベースに値を保存
  Future<void> saveValue(BookMarkController bookmark) async {
    await database!.insert(
        'saved_values', {'name': bookmark.title.text, 'url': bookmark.url.text},
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
// データを削除
  Future<void> deleteValue(BookMarkController bookmark) async {
    await database!.delete('saved_values',
        where: 'name = ? AND url = ?',
        whereArgs: [bookmark.title.text, bookmark.url.text]);
  }

  @override
// データを取得
  Future<List<BookMark>> fetchDataFromDatabase() async {
    final List<Map<String, dynamic>> data =
        await database!.query('saved_values');
    final List<BookMark> result = data
        .map((value) => BookMark(
            title: value[BookMarkColumns.title],
            url: value[BookMarkColumns.url]))
        .toList();
    return result;
  }
}
