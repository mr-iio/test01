import 'package:flutter/material.dart';
import 'package:test01/features/add_page/widgets/add_dialog.dart';
import 'package:test01/shared/globals.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return const Form(
      key: addKey,
      child: AddDialog(),
    );
  }
}