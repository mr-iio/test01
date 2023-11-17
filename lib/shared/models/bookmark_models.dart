import 'package:flutter/material.dart';

class Bookmark {
  final int id;
  final String title;
  final String url;
  const Bookmark({this.id = 0, this.title = '', this.url = ''});
}

class BookmarkFormController {
  final TextEditingController title;
  final TextEditingController url;
  const BookmarkFormController({required this.title, required this.url});
}

class BookmarkColumns {
  static const String id = 'id';
  static const String title = 'name';
  static const String url = 'url';
}
