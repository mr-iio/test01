import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database? database;

// データベースに接続
initializeDatabase() async {
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

// データベースに値を保存
saveValue(String name, String url) async {
  await database!.insert('saved_values', {'name': name, 'url': url},
      conflictAlgorithm: ConflictAlgorithm.replace);
}

// データを削除
deleteValue(String name, String url) async {
  await database!.delete('saved_values',
      where: 'name = ? AND url = ?', whereArgs: [name, url]);
}

// データを取得
fetchDataFromDatabase() async {
  final List<Map<String, dynamic>> result =
      await database!.query('saved_values');
  return result;
}
