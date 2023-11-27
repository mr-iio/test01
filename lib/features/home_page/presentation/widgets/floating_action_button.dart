import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/home_page/presentation/providers/home_page_provider.dart';
import 'package:test01/features/home_page/presentation/widgets/add_form/add_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeFloatingActionButton extends ConsumerWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(bookmarkNotifierProvider);
    return FloatingActionButton(
      onPressed: () async {
        if (state.value!.data.length < 20) {
          await showDialog<void>(
              context: context, builder: (context) => const AddForm());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(L10n.of(context).maxBookmark),
            ),
          );
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
