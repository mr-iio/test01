import 'package:flutter/material.dart';
import 'package:test01/pages/add_page/add_dialog.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final key = const GlobalObjectKey<FormState>('FORM_KEY');
  var name = '';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  RegExp urlReg = RegExp(r'https?://([\w-]+\.)+[\w-]+(/[\w-./?%&=#]*)?');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: const AddDialog(),
    );
  }
}
