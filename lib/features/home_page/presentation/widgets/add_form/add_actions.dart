import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/home_page/presentation/providers/home_page_provider.dart';
import 'package:test01/shared/globals.dart';

// キャンセル時のアクション
class AddCalcenAction extends StatefulWidget {
  const AddCalcenAction({super.key});

  @override
  State<AddCalcenAction> createState() => _AddCalcenActionState();
}

class _AddCalcenActionState extends State<AddCalcenAction> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final stateRefresh = ref.refresh(bookmarkNotifierProvider);
        return TextButton(
          child: Text(L10n.of(context).cancel),
          onPressed: () {
            // ref.refresh(titleController.notifier).state;
            // ref.refresh(urlController.notifier).state;
            stateRefresh.bookmark.title;
            stateRefresh.bookmark.url;
            Navigator.pop(context);
          },
        );
      },
    );
  }
}

// 登録時のアクション
class AddRegistAction extends StatefulWidget {
  const AddRegistAction({super.key});
  @override
  State<AddRegistAction> createState() => _AddRegistActionState();
}

class _AddRegistActionState extends State<AddRegistAction> {
  var title = '';
  var url = '';
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(bookmarkNotifierProvider);
        final stateNotifier = ref.watch(bookmarkNotifierProvider.notifier);
        //なぜかstateRefreshでエラーが出る
        // final stateRefresh = ref.refresh(bookmarkNotifierProvider);
        return TextButton(
          child: Text(L10n.of(context).regist),
          onPressed: () {
            title = state.bookmark.title.text;
            url = state.bookmark.url.text;
            // タイトルが空白の場合は代わりに'タイトル'を入力する
            if (title == '') {
              title = L10n.of(context).title;
            }
            if (addKey.currentState!.validate()) {
              try {
                // ref
                //     .read(bookmarkProvider)
                //     .saveValue(title, ref.read(urlController).text);
                stateNotifier.saveBookmark(state.bookmark);
              } on FormatException {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(title + L10n.of(context).failureRegist),
                  ),
                );
              }
              // ref.refresh(titleController.notifier).state;
              // ref.refresh(urlController.notifier).state;
              // stateRefresh.bookmark;
              ref.refresh(bookmarkNotifierProvider).bookmark;
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(title + L10n.of(context).successRegist),
                ),
              );
            }
          },
        );
      },
    );
  }
}
