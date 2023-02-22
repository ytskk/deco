import 'package:data_store/data_store.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookmarksProvider = StreamProvider<List<ArticleWithAuthorModel>>((ref) {
  final dao = ref.watch(articlesDaoProvider);

  return dao.allSavedArticles();
});
