import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/add_page/providers/add_page_provider.dart';

class AddColumn extends StatefulWidget {
  const AddColumn({super.key});
  @override
  State<AddColumn> createState() => _AddColumnState();
}

class _AddColumnState extends State<AddColumn> {
  RegExp urlReg = RegExp(r'https?://([\w-]+\.)+[\w-]+(/[\w-./?%&=#]*)?');
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Column(children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: L10n.of(context).title,
            ),
            controller: ref.read(nameController.notifier).state,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: L10n.of(context).url,
            ),
            controller: ref.read(urlController.notifier).state,
            validator: (value) {
              if (value == '') {
                return L10n.of(context).url + L10n.of(context).required;
              }
              if (value!.length > 2000) {
                return L10n.of(context).url + L10n.of(context).tooLong;
              }
              if (!urlReg.hasMatch(value)) {
                return L10n.of(context).url + L10n.of(context).required;
              }
              return null;
            },
          ),
        ]);
      },
    );
  }
}
