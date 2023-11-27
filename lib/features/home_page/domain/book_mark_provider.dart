import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/features/home_page/data/bookmark_datasource.dart';
import 'package:test01/features/home_page/data/bookmark_repository_impl.dart';
import 'package:test01/features/home_page/domain/bookmark_repository.dart';
import 'package:test01/shared/data/database_helper.dart';

final bookmarkDBProvider = Provider<BookmarkRepository>((ref) {
  final localDB = BookmarkLocalDBHelper.instance;
  return BookmarkRepositoryImpl(BookmarkLocalDatasource(localDB));
});
