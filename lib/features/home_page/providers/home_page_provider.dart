import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test01/shared/models/bookmark_models.dart';

final data = StateProvider<List<BookMark>>((ref) => []);
final selectedUrl = StateProvider((ref) => '');
