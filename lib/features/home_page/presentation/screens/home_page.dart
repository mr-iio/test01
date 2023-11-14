import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test01/features/home_page/presentation/widgets/body.dart';
import 'package:test01/features/home_page/presentation/widgets/floating_action_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).mainTitle),
        automaticallyImplyLeading: false,
      ),
      body: const HomeBody(),
      floatingActionButton: const HomeFloatingActionButton(),
    );
  }
}
