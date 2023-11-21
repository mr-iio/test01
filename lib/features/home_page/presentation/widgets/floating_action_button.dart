import 'package:flutter/material.dart';
import 'package:test01/features/home_page/presentation/widgets/add_form/add_form.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await showDialog<void>(
            context: context, builder: (context) => const AddForm());
      },
      child: const Icon(Icons.add),
    );
  }
}
