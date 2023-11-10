import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddColumn extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController urlController;
  const AddColumn(
      {Key? key, required this.nameController, required this.urlController})
      : super(key: key);

  @override
  State<AddColumn> createState() => _AddColumnState();
}

class _AddColumnState extends State<AddColumn> {
  RegExp urlReg = RegExp(r'https?://([\w-]+\.)+[\w-]+(/[\w-./?%&=#]*)?');

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        decoration: InputDecoration(
          labelText: L10n.of(context).title,
        ),
        controller: widget.nameController,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: L10n.of(context).url,
        ),
        controller: widget.urlController,
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
  }
}
