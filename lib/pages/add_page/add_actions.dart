import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test01/shared/database_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/shared/globals.dart';
import 'package:test01/shared/provider.dart';

// キャンセル時のアクション
class AddCalcenAction extends StatefulWidget {
  const AddCalcenAction({super.key});

  @override
  State<AddCalcenAction> createState() => _AddCalcenActionState();
}

class _AddCalcenActionState extends State<AddCalcenAction> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return TextButton(
          child: Text(L10n.of(context).cancel),
          onPressed: () {
            ref.refresh(nameController.notifier).state;
            ref.refresh(urlController.notifier).state;
            Navigator.pop(context);
          },
        );
      },
    );
  }
}

// 登録時のアクション
class AddRegistAction extends StatefulWidget {
  const AddRegistAction({super.key});
  @override
  State<AddRegistAction> createState() => _AddRegistActionState();
}

class _AddRegistActionState extends State<AddRegistAction> {
  var name = '';
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return TextButton(
          child: Text(L10n.of(context).regist),
          onPressed: () {
            name = ref.read(nameController).text;
            // タイトルが空白の場合は代わりに'タイトル'を入力する
            if (name == '') {
              name = L10n.of(context).title;
            }
            if (addKey.currentState!.validate()) {
              try {
                saveValue(name, ref.read(urlController).text);
              } on FormatException {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(name + L10n.of(context).failureRegist),
                  ),
                );
              }
              ref.refresh(nameController.notifier).state;
              ref.refresh(urlController.notifier).state;
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(name + L10n.of(context).successRegist),
                ),
              );
            }
          },
        );
      },
    );
  }
}
