import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/web_page/presentation/providers/web_page_provider.dart';

class WebBottomNavigationBar extends StatefulWidget {
  const WebBottomNavigationBar({super.key});

  @override
  State<WebBottomNavigationBar> createState() => _WebBottomNavigationBarState();
}

class _WebBottomNavigationBarState extends State<WebBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(webPageNotifierProvider);
        return BottomNavigationBar(
          selectedItemColor: Colors.pink,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.arrow_back),
              label: L10n.of(context).back,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.arrow_forward),
              label: L10n.of(context).forward,
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.refresh),
                label: L10n.of(context).reload),
            BottomNavigationBarItem(
                icon: const Icon(Icons.close), label: L10n.of(context).close),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: state.selectedButtonNumber,
          // ref.watch(selectedButtonNumber)
          onTap: (index) async {
            // ref.read(selectedButtonNumber.notifier).state = index;
            ref.read(webPageNotifierProvider.notifier).nextIndex(index);
            if (index == 0) {
              if (await state.webPageController.canGoBack()) {
                state.webPageController.goBack();
              }
            } else if (index == 1) {
              if (await state.webPageController.canGoForward()) {
                state.webPageController.goForward();
              }
            } else if (index == 2) {
              state.webPageController.reload();
            } else {
              // ref.refresh(webPageController.notifier).state;
              ref.refresh(webPageNotifierProvider).webPageController;
              Navigator.pop(context);
            }
          },
        );
      },
    );
  }
}
