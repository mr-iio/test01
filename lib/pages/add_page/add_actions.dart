import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test01/common/database_helper.dart';

// キャンセル時のアクション
class AddCalcenAction extends StatefulWidget {
  const AddCalcenAction({super.key});

  @override
  State<AddCalcenAction> createState() => _AddCalcenActionState();
}

class _AddCalcenActionState extends State<AddCalcenAction> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(L10n.of(context).cancel),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

// 登録時のアクション
class AddRegistAction extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController urlController;
  const AddRegistAction(
      {Key? key, required this.nameController, required this.urlController})
      : super(key: key);

  @override
  State<AddRegistAction> createState() => _AddRegistActionState();
}

class _AddRegistActionState extends State<AddRegistAction> {
  var name = '';
  final key = const GlobalObjectKey<FormState>('FORM_KEY');
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(L10n.of(context).regist),
      onPressed: () {
        name = widget.nameController.text;
        // タイトルが空白の場合は代わりに'タイトル'を入力する
        if (name == '') {
          name = L10n.of(context).title;
        }
        if (key.currentState!.validate()) {
          try {
            saveValue(name, widget.urlController.text);
          } on FormatException {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(name + L10n.of(context).failureRegist),
              ),
            );
          }

          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(name + L10n.of(context).successRegist),
            ),
          );
        }
      },
    );
  }
}
