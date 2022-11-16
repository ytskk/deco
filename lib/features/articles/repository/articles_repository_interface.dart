import 'package:dev_community/features/features.dart';

abstract class ArticlesRepositoryInterface {
  Future<List<ArticleCardModel>> getArticles({
    int page = 1,
    String type,
  });

  Future<ArticleDetailsModel> getArticleDetails({
    required String slug,
  });

  Future<ArticleCardModel> getArticleCard({
    required String slug,
  });
}
