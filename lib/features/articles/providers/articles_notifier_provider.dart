import 'dart:developer';

import 'package:dev_community/features/articles/articles.dart';
import 'package:dev_community/shared/models/loading_data_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticlesNotifier extends FamilyNotifier<
    LoadingDataModel<List<ArticleQuickInfoModel>>, String> {
  late final String type;
  int page = 1;

  @override
  LoadingDataModel<List<ArticleQuickInfoModel>> build(
    String arg,
  ) {
    log('build', name: 'ArticlesNotifier');
    type = arg;

    return const LoadingDataModel();
  }

  Future<void> loadNextPage() async {
    log(
      'loading $type $page page',
      name: 'ArticlesNotifier::loadNextPage',
    );
    try {
      state = state.copyWith(isLoading: true);

      final articles = await ref.read(articlesRepositoryProvider).getArticles(
            type: type,
            page: page,
          );

      state = state.copyWith(
        isLoading: false,
        data: page == 1 ? articles : [...state.data ?? [], ...articles],
      );

      page += 1;
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        error: error,
      );
    }
  }

  Future<void> refresh() async {
    log(
      'refreshing $type',
      name: 'ArticlesNotifier::refresh',
    );
    page = 1;
    await loadNextPage();
  }
}
