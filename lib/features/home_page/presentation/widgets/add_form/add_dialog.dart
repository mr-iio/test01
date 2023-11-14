import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test01/features/home_page/presentation/widgets/add_form/add_actions.dart';
import 'package:test01/features/home_page/presentation/widgets/add_form/add_column.dart';

class AddDialog extends StatelessWidget {
  const AddDialog({super.key});

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
