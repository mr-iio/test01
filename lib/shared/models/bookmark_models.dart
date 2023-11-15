import 'package:flutter/material.dart';

class BookMark {
  final String title;
  final String url;
  const BookMark({this.title = '', this.url = ''});
}

class BookMarkController {
  final TextEditingController title;
  final TextEditingController url;
  const BookMarkController({required this.title, required this.url});
}

class BookMarkColumns {
  static const String title = 'name';
  static const String url = 'url';
}
