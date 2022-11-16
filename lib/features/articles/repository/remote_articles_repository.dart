import 'dart:developer';

import 'package:dev_community/constants/api_constants.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/utils/utils.dart';
import 'package:dio/dio.dart';

class RemoteArticlesRepository implements ArticlesRepositoryInterface {
  const RemoteArticlesRepository({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<ArticleCardModel>> getArticles({
    int page = 1,
    String type = ArticleTypes.popular,
  }) async {
    final requestConfiguration = _mapArticlesTypeToRequest(page, type);

    final response = await _dio.get(
      requestConfiguration['path'] as String,
      queryParameters:
          requestConfiguration['queryParameters'] as Map<String, dynamic>,
    );

    final articles = response.data as List;

    return articles
        .map((e) => ArticleCardModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> _mapArticlesTypeToRequest(
    int page,
    String type,
  ) {
    final request = <String, dynamic>{};
    request['queryParameters'] = {
      'page': page,
    };

    switch (type) {
      case ArticleTypes.popular:
        request['path'] = ApiConstants.articles;
        return request;
      case ArticleTypes.latest:
        request['path'] = StringUtils.joinBy(
          [
            ApiConstants.articles,
            ApiConstants.articlesLatest,
          ],
          separator: '/',
        );
        return request;
      default:
        request['path'] = StringUtils.joinBy(
          [
            ApiConstants.articles,
            ApiConstants.articlesLatest,
          ],
          separator: '/',
        );
        request['queryParameters'] = {
          'page': page,
          'tag': type,
        };
        log('requesting articles with tag: $type, request is $request');

        return request;
    }
  }

  @override
  Future<ArticleDetailsModel> getArticleDetails({
    required String slug,
  }) async {
    final res = await _dio.get(
      StringUtils.joinBy(
        [
          ApiConstants.articles,
          slug,
        ],
        separator: '/',
      ),
    );

    return ArticleDetailsModel.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<ArticleCardModel> getArticleCard({
    required String slug,
  }) async {
    final res = await _dio.get(
      StringUtils.joinBy(
        [
          ApiConstants.articles,
          slug,
        ],
        separator: '/',
      ),
    );

    return ArticleCardModel.fromJson(res.data as Map<String, dynamic>);
  }
}
