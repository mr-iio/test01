import 'package:sqflite/sqflite.dart';
import 'package:test01/shared/data/database_helper.dart';
import 'package:test01/shared/globals.dart';
import 'package:test01/shared/models/bookmark_models.dart';

abstract class BookmarkDatasource {
  Future<void> saveBookmark(BookmarkFormController bookmarkFormController);
  Future<void> deleteBookmark(int id);
  Future<List<Bookmark>> fetchBookmarks();
}

class BookmarkLocalDatasource extends BookmarkDatasource {
  final BookmarkLocalDBHelper localDB;
  BookmarkLocalDatasource(this.localDB);

  @override
  // データベースに値を保存
  Future<void> saveBookmark(
      BookmarkFormController bookmarkFormController) async {
    final Database db = await localDB.database;
    await db.insert(
        savedDBValues,
        {
          dbName: bookmarkFormController.title.text,
          dbUrl: bookmarkFormController.url.text
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
// データを削除
  Future<void> deleteBookmark(int id) async {
    final Database db = await localDB.database;
    await db.delete(savedDBValues, where: '$dbId = ?', whereArgs: [id]);
  }

  @override
// データを取得
  Future<List<Bookmark>> fetchBookmarks() async {
    final Database db = await localDB.database;
    final List<Map<String, dynamic>> data = await db.query(savedDBValues);
    final List<Bookmark> result = data
        .map((value) => Bookmark(
            id: value[BookmarkColumns.id],
            title: value[BookmarkColumns.title],
            url: value[BookmarkColumns.url]))
        .toList();
    return result;
  }
}
