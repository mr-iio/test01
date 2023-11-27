import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/home_page/presentation/providers/home_page_provider.dart';
import 'package:test01/shared/globals.dart';

// キャンセル時のアクション
class AddCancelAction extends ConsumerWidget {
  const AddCancelAction({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(bookmarkNotifierProvider.notifier);
    return TextButton(
      child: Text(L10n.of(context).cancel),
      onPressed: () {
        Navigator.pop(context);
        notifier.resetController();
      },
    );
  }
}

// 登録時のアクション
class AddRegistAction extends ConsumerWidget {
  const AddRegistAction({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(bookmarkNotifierProvider);
    final notifier = ref.watch(bookmarkNotifierProvider.notifier);
    return TextButton(
      child: Text(L10n.of(context).regist),
      onPressed: () {
        // タイトルが空白の場合は代わりに'タイトル'を入力する
        if (state.value!.bookmarkFormController.title.text == '') {
          state.value!.bookmarkFormController.title.text =
              L10n.of(context).title;
        }
        if (addKey.currentState!.validate()) {
          try {
            notifier
                .saveBookmark(state.value!.bookmarkFormController)
                .then((_) {
              notifier.fetchBookmarks().then((_) => notifier.resetController());
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.value!.bookmarkFormController.title.text +
                      L10n.of(context).successRegist),
                ),
              );
            });
          } on FormatException {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.value!.bookmarkFormController.title.text +
                    L10n.of(context).failureRegist),
              ),
            );
          }
        }
      },
    );
  }
}
