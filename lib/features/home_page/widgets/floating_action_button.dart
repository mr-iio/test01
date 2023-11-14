import 'package:flutter/material.dart';
import 'package:test01/features/add_page/screens/add_page.dart';

class HomeFloatingActionButton extends StatefulWidget {
  const HomeFloatingActionButton({super.key});

  @override
  State<HomeFloatingActionButton> createState() =>
      _HomeFloatingActionButtonState();
}

class _HomeFloatingActionButtonState extends State<HomeFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await showDialog<void>(
            context: context,
            builder: (context) => const Scaffold(
                backgroundColor: Colors.transparent, body: AddPage()));
      },
      child: const Icon(Icons.add),
    );
  }
}
