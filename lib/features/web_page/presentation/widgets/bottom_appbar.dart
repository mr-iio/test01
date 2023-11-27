import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/web_page/presentation/providers/web_page_provider.dart';

class WebBottomAppBar extends ConsumerWidget {
  final String url;
  const WebBottomAppBar({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(webPageNotifierProvider(url));
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
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
            label: Text(L10n.of(context).close),
          )
        ],
      ),
    );
  }
}
