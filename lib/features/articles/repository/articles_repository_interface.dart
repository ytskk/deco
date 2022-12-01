import 'package:dev_community/features/features.dart';

abstract class ArticlesRepositoryInterface {
  Future<List<ArticleQuickInfoModel>> getArticles({
    int page = 1,
    String type,
  });

  Future<ArticleDetailsModel> getArticleDetails({
    required String path,
  });

  Future<ArticleDetailsModel> getArticleDetailsById({
    required int id,
  });

  Future<ArticleQuickInfoModel> getArticleCard({
    required String slug,
  });
}
