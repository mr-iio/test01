import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BookmarkLocalDBHelper {
  BookmarkLocalDBHelper._internal();
  static final BookmarkLocalDBHelper instance =
      BookmarkLocalDBHelper._internal();
  static Database? _database;

  Future get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

// データベースに接続
  Future<Database> initDatabase() async {
    // データベースファイルのパスを取得
    String databasePath = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
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
