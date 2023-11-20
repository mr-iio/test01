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
        notifier.resetController();
        Navigator.pop(context);
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
        if (state.bookmarkFormController.title.text == '') {
          state.bookmarkFormController.title.text = L10n.of(context).title;
        }
        if (addKey.currentState!.validate()) {
          try {
            notifier.saveBookmark(state.bookmarkFormController);
            notifier.resetController();
            Future(
              () async {
                await notifier.fetchBookmarks();
              },
            );
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.bookmarkFormController.title.text +
                    L10n.of(context).successRegist),
              ),
            );
          } on FormatException {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.bookmarkFormController.title.text +
                    L10n.of(context).failureRegist),
              ),
            );
          }
        }
      },
    );
  }
}
