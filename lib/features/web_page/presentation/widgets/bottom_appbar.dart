import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/web_page/presentation/providers/web_page_provider.dart';

class WebBottomAppBar extends StatefulWidget {
  const WebBottomAppBar({super.key});

  @override
  State<WebBottomAppBar> createState() => _WebBottomAppBarState();
}

class _WebBottomAppBarState extends State<WebBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(webPageNotifierProvider);
        return BottomAppBar(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: (state.canGoBack)
                      ? () {
                          state.webPageController.goBack();
                        }
                      : null,
                  icon: const Icon(Icons.arrow_back),
                  label: Text(L10n.of(context).back),
                ),
                TextButton.icon(
                  onPressed: (state.canGoForward)
                      ? () {
                          state.webPageController.goForward();
                        }
                      : null,
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(L10n.of(context).forward),
                ),
                TextButton.icon(
                  onPressed: () {
                    state.webPageController.reload();
                  },
                  icon: const Icon(Icons.refresh),
                  label: Text(L10n.of(context).reload),
                ),
                TextButton.icon(
                  onPressed: () {
                    ref.refresh(webPageNotifierProvider).webPageController;
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  label: Text(L10n.of(context).close),
                )
              ],
            ));
      },
    );
  }
}
