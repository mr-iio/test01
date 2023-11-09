import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test01/add_page.dart';
import 'package:test01/web_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  static Database? database;
  List<Map<String, dynamic>> data = [];

  @override
  // ページが初めて読み込まれた時のみ動作する
  void initState() {
    super.initState();
    Future(() async {
      await initializeDatabase();
      await fetchDataFromDatabase();
    });
  }

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

  // データを取得
  fetchDataFromDatabase() async {
    final List<Map<String, dynamic>> result =
        await database!.query('saved_values');
    setState(() {
      data = result;
    });
  }

  //データを削除
  deleteValue(String name, String url) async {
    await database!.delete('saved_values',
        where: 'name = ? AND url = ?', whereArgs: [name, url]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ブックマーク一覧'),
        automaticallyImplyLeading: false,
      ),
      body: (data.isNotEmpty)
          ? ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['name']),
                  subtitle: Text(data[index]['url']),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WebPage(url: data[index]['url'])));
                  },
                  onLongPress: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: const Text('削除しますか？'),
                          actions: [
                            TextButton(
                              child: const Text('キャンセル'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                                onPressed: () {
                                  deleteValue(
                                      data[index]['name'], data[index]['url']);
                                  Navigator.of(context).pop();
                                  fetchDataFromDatabase();
                                },
                                child: const Text('はい'))
                          ],
                        );
                      },
                    );
                  },
                );
              },
            )
          : const Text('何も登録されていません,あるいは読み込み中かも'),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog<void>(
              context: context,
              builder: (context) => const Scaffold(
                  backgroundColor: Colors.transparent, body: AddPage()));
          fetchDataFromDatabase();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
