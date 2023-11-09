import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});
  @override
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  final key = const GlobalObjectKey<FormState>('FORM_KEY');
  var name = '';
  static Database? database;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  @override
  // ページが初めて読み込まれた時のみ動作する
  void initState() {
    super.initState();
    initializeDatabase();
  }

  initializeDatabase() async {
    // データベースファイルのパスを取得
    String databasePath = join(await getDatabasesPath(), 'my_database.db');
    // データベースが作成されたときに実行される初期化処理
    // データベースが既に存在している時は実行されない
    database = await openDatabase(
      databasePath,
      version: 1,
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: AlertDialog(
        title: const Text('ブックマーク登録'),
        content: SingleChildScrollView(
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'タイトル',
              ),
              controller: nameController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'URL',
              ),
              controller: urlController,
              validator: (value) {
                if (value == '') {
                  return 'URLを入力してください';
                }
                if (value!.length > 2000) {
                  return 'URLが長すぎます';
                }
                return null;
              },
            ),
          ]),
        ),
        actions: [
          TextButton(
            child: const Text('キャンセル'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('登録'),
            onPressed: () {
              name = nameController.text;
              // タイトルが空白の場合は代わりに'タイトル'を入力する
              if (name == '') {
                name = 'タイトル';
              }
              if (key.currentState!.validate()) {
                saveValue(name, urlController.text);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$nameの登録に成功しました'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$nameの登録に失敗しました'),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
