import 'package:data_store/data_store.dart';
import 'package:flutter/cupertino.dart';

@immutable
class BookmarksStatisticModel {
  const BookmarksStatisticModel({
    this.total = const [],
    this.read = const [],
    this.unread = const [],
  });

  final List<ArticleWithAuthorModel> total;
  final List<ArticleWithAuthorModel> read;
  final List<ArticleWithAuthorModel> unread;

  int get totalLength => total.length;
  int get readLength => read.length;
  int get unreadLength => unread.length;
}
