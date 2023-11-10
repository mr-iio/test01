import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test01/pages/home_page/body.dart';
import 'package:test01/pages/home_page/floating_action_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
