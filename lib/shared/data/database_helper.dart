import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BookmarkLocalDBHelper {
  // BookmarkLocalDBHelper._privateConstructor();
  // static final BookmarkLocalDBHelper instance =
  //     BookmarkLocalDBHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    await initializeDatabase();
    return _database;
  }

// データベースに接続
  initializeDatabase() async {
    // データベースファイルのパスを取得
    String databasePath = join(await getDatabasesPath(), 'my_database.db');
    _database = await openDatabase(
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
