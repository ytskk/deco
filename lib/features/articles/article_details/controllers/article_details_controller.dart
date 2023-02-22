import 'dart:developer';
import 'dart:io';

import 'package:data_store/data_store.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleDetailsController extends StateNotifier<ArticleDetailsState> {
  ArticleDetailsController({
    required ArticlesRepositoryInterface articlesRepository,
    required ArticlesDataStoreInterface articlesDataStore,
    required this.articlePath,
  })  : _articleRepository = articlesRepository,
        _articlesDataStore = articlesDataStore,
        super(const ArticleDetailsState.loading()) {
    getArticleDetails();
  }

  final ArticlesRepositoryInterface _articleRepository;
  final ArticlesDataStoreInterface _articlesDataStore;
  final String articlePath;

  Future<void> getArticleDetails() async {
    state = const ArticleDetailsState.loading();
    try {
      final articleDetails =
          await _articleRepository.getArticleDetails(path: articlePath);

      state = ArticleDetailsState.data(articleDetails);
    } on DioError catch (e) {
      // No internet connection
      if (e.error.runtimeType == SocketException) {
        log(
          'SocketException: ${e.error}',
          name: 'ArticleDetailsController',
        );
        final articleWithAuthor =
            await _articlesDataStore.savedArticleByPath(articlePath);

        final articleDetails =
            ArticleConverter.articleWithAuthorToArticleDetails(
          articleWithAuthor,
        );

        state = ArticleDetailsState.data(articleDetails);
        return;
      }
      state = ArticleDetailsState.error(e);
      log(
        'DioError: ${e.message}',
        name: 'ArticleDetailsController::getArticleDetails',
      );
    }
  }
}
