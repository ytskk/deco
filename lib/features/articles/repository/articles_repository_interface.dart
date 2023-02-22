import 'package:dev_community/features/features.dart';

abstract class ArticlesRepositoryInterface {
  /// Returns articles list.
  ///
  /// Fetches for provided [type] (popular, latest or tag name) on [page].
  Future<List<ArticleQuickInfoModel>> getArticles({
    int page = 1,
    String type,
  });

  Future<ArticleDetailsModel> getArticleDetails({
    required String path,
  });

  Future<ArticleQuickInfoModel> getArticleCard({
    required String slug,
  });
}
