import 'package:flutter/material.dart';

class BookMark {
  final int id;
  final String title;
  final String url;
  const BookMark({this.id = 0, this.title = '', this.url = ''});
}

class BookMarkController {
  final TextEditingController title;
  final TextEditingController url;
  const BookMarkController({required this.title, required this.url});
}

class BookMarkColumns {
  static const String id = 'id';
  static const String title = 'name';
  static const String url = 'url';
}
