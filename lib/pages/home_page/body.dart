import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test01/pages/web_page/web_page.dart';
import 'package:test01/shared/database_helper.dart';
import 'package:test01/shared/globals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/shared/provider.dart';

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
        Future(() async {
          await initializeDatabase();
          List<Map<String, dynamic>> result = await fetchDataFromDatabase();
          ref.read(data.notifier).state = result;
        });

        final refData = ref.watch(data);
        return (refData.isNotEmpty)
            ? ListView.separated(
                itemCount: refData.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      refData[index][dbName],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(refData[index][dbUrl]),
                    onTap: () {
                      ref.read(selectedUrl.notifier).state =
                          refData[index][dbUrl];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WebPage()));
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
                                  deleteValue(refData[index][dbName],
                                      refData[index][dbUrl]);
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
