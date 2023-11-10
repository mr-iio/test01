import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test01/pages/web_page/web_page.dart';
import 'package:test01/common/database_helper.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});
  @override
  State<HomeBody> createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody> {
  List<Map<String, dynamic>> data = [];
  @override
  Widget build(BuildContext context) {
    Future(() async {
      await initializeDatabase();
      List<Map<String, dynamic>> result = await fetchDataFromDatabase();
      setState(() {
        data = result;
      });
    });
    return (data.isNotEmpty)
        ? ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  data[index]['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(data[index]['url']),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WebPage(url: data[index]['url'])));
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
                              deleteValue(
                                  data[index]['name'], data[index]['url']);
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
  }
}
