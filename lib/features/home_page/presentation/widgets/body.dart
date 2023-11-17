import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test01/features/home_page/presentation/providers/home_page_provider.dart';
import 'package:test01/features/web_page/presentation/screens/web_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});
  @override
  State<HomeBody> createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final notifier = ref.watch(bookmarkNotifierProvider.notifier);
        final state = ref.watch(bookmarkNotifierProvider);
        Future(() async {
          await notifier.data();
        });
        return (state.data.isNotEmpty)
            ? ListView.separated(
                itemCount: state.data.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final selectedBookmark = state.data[index];
                  return ListTile(
                    title: Text(
                      selectedBookmark.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(selectedBookmark.url),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebPage(
                                  bookmarkFormController: selectedBookmark)));
                    },
                    onLongPress: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(L10n.of(context).deleteConf),
                            actions: [
                              TextButton(
                                child: Text(L10n.of(context).cancel),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                onPressed: () {
                                  notifier.deleteBookmark(selectedBookmark.id);
                                  Navigator.of(context).pop();
                                },
                                child: Text(L10n.of(context).yes),
                              )
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              )
            : Text(L10n.of(context).noDataOrLoading);
      },
    );
  }
}
