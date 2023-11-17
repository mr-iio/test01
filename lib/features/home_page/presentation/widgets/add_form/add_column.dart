import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/home_page/presentation/providers/home_page_provider.dart';
import 'package:test01/shared/globals.dart';

class AddColumn extends ConsumerWidget {
  const AddColumn({super.key});

  @override
  Widget build(BuildContext context, ref) {
    RegExp urlReg = RegExp(regExpUrl);
    final state = ref.watch(bookmarkNotifierProvider);
    return Column(children: [
      TextFormField(
        decoration: InputDecoration(
          labelText: L10n.of(context).title,
        ),
        controller: state.bookmarkFormController.title,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: L10n.of(context).url,
        ),
        controller: state.bookmarkFormController.url,
        validator: (value) {
          if (value == '' || !urlReg.hasMatch(value!)) {
            return L10n.of(context).url + L10n.of(context).required;
          }
          if (value.length > 2000) {
            return L10n.of(context).url + L10n.of(context).tooLong;
          }
          return null;
        },
      ),
    ]);
  }
}
