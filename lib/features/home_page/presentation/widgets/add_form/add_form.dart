import 'package:flutter/material.dart';
import 'package:test01/features/home_page/presentation/widgets/add_form/add_dialog.dart';
import 'package:test01/shared/globals.dart';

class AddForm extends StatelessWidget {
  const AddForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      key: addKey,
      child: AddDialog(),
    );
  }
}
