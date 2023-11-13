import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test01/pages/add_page/add_actions.dart';
import 'package:test01/pages/add_page/add_column.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({super.key});

  @override
  State<AddDialog> createState() => _AddDialog();
}

class _AddDialog extends State<AddDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(L10n.of(context).addTitle),
      content: const SingleChildScrollView(
        child: AddColumn(),
      ),
      actions: const [AddCalcenAction(), AddRegistAction()],
    );
  }
}
