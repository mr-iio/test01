// import 'package:equatable/equatable.dart';
// import 'package:test01/shared/models/bookmark_models.dart';

// class BookmarkState extends Equatable {
//   final BookMark bookmark;
//   final List<BookMark> bookmarkList;

//   const BookmarkState({required this.bookmark, this.bookmarkList = const []});

//   const BookmarkState.initial(
//       {this.bookmark = const BookMark(title: '', url: ''),
//       this.bookmarkList = const []});

//   BookmarkState copyWith({
//     String? title,
//     String? url,
//     List<BookMark>? bookmarkList,
//   }) {
//     return BookmarkState(
//       bookmark: BookMark(
//         title: title ?? bookmark.title,
//         url: url ?? bookmark.url,
//       ),
//       bookmarkList: bookmarkList ?? this.bookmarkList,
//     );
//   }

//   @override
//   List<Object?> get props => [bookmark, bookmarkList];
// }
