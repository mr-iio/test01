import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BookmarkLocalDBHelper {
  Database? database;

// データベースに接続
  Future<void> initializeDatabase() async {
    // データベースファイルのパスを取得
    String databasePath = join(await getDatabasesPath(), 'my_database.db');
    database = await openDatabase(
      databasePath,
      version: 1,
      // データベースが作成されたときに実行される初期化処理
      // データベースが既に存在している時は実行されない
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE saved_values(id INTEGER PRIMARY KEY, name TEXT, url TEXT)');
      },
    );
  }
}
