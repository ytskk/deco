import 'dart:developer';

import 'package:dev_community/features/articles/articles.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final articlesServiceProvider =
    Provider.family<ArticlesService, ArticlesLoadModel>(
        (ref, articleLoadModel) {
  final articlesRepository = ref.watch(articlesRepositoryProvider);

  return ArticlesService(
    articlesRepository: articlesRepository,
    articlesLoadModel: articleLoadModel,
  );
});

class ArticlesService {
  const ArticlesService({
    required ArticlesRepositoryInterface articlesRepository,
    required ArticlesLoadModel articlesLoadModel,
  })  : _articlesRepository = articlesRepository,
        _articlesLoadModel = articlesLoadModel;

  final ArticlesRepositoryInterface _articlesRepository;
  final ArticlesLoadModel _articlesLoadModel;

  Future<ArticlesLoadModel> loadArticles({
    int? page,
  }) async {
    try {
      final articles = await _articlesRepository.getArticles(
        page: page ?? _articlesLoadModel.page,
        type: _articlesLoadModel.type,
      );

      return _articlesLoadModel.copyWith(
        articles: articles,
        page: page != null ? page + 1 : _articlesLoadModel.page + 1,
      );
    } on DioError catch (e) {
      log('error: $e');
      rethrow;
    }
  }

  Future<ArticlesLoadModel> refreshArticles() async {
    return loadArticles(page: 1);
  }
}
