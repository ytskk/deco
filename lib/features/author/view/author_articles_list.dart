import 'dart:developer';

import 'package:data_store/data_store.dart';
import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

final authorArticlesLoadModelProvider = StateProvider.family
    .autoDispose<ArticlesLoadModel, String>((ref, authorName) {
  return ArticlesLoadModel(type: authorName);
});

class AuthorArticlesList extends StatelessWidget {
  const AuthorArticlesList({
    super.key,
    required this.authorName,
    required this.isOrganization,
  });

  final String authorName;
  final bool isOrganization;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final state = ref.watch(authorArticlesLoadModelProvider(authorName));

        return _AuthorArticlesList(
          articlesModel: state,
          onFetchData: () async {
            await _onFetchData(
              ref,
              state.page + 1,
              isOrganization,
            );
          },
          bookmarkBuilder: (_, articleId, articlePath) {
            return BookmarkButton(
              articleId: articleId,
              articlePath: articlePath,
            );
          },
        );
      },
    );
  }

  Future<void> _onFetchData(
    WidgetRef ref,
    int page,
    bool isOrganization,
  ) async {
    try {
      // push loading state
      ref
          .read(
            authorArticlesLoadModelProvider(authorName).state,
          )
          .update(
            (state) => state.copyWith(isLoading: true),
          );

      // load articles
      final articles =
          await ref.read(authorRepositoryProvider).getArticlesByUsername(
                username: authorName,
                page: page,
                isOrganization: isOrganization,
              );

      // // push articles. Set isLoading to false and hasReachedMax to true if
      // // new articles.length is less than 30 (default articles per page).
      ref.read(authorArticlesLoadModelProvider(authorName).notifier).update(
        (state) {
          final newArticles =
              page == 1 ? articles : [...state.articles, ...articles];

          return state.copyWith(
            page: page,
            articles: newArticles,
            isLoading: false,
            hasReachedMax: articles.length < 30,
          );
        },
      );
    } catch (error) {
      log('error: $error');
    }
  }
}

class _AuthorArticlesList extends StatelessWidget {
  const _AuthorArticlesList({
    required this.articlesModel,
    required this.onFetchData,
    this.bookmarkBuilder,
  });

  final ArticlesLoadModel articlesModel;
  final VoidCallback onFetchData;
  final BookmarkBuilder? bookmarkBuilder;

  @override
  Widget build(BuildContext context) {
    return SliverInfiniteList(
      isLoading: articlesModel.isLoading,
      hasReachedMax: articlesModel.hasReachedMax,
      itemCount: articlesModel.articles.length,
      onFetchData: onFetchData,
      loadingBuilder: (context) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
      emptyBuilder: articlesModel.isLoading
          ? (_) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: InfoList(title: AppStrings.articlesEmptyTitle),
              )
          : null,
      itemBuilder: (context, index) {
        final article = articlesModel.articles.elementAt(index);
        return ArticleCard(
          article: ArticleConverter.articleQuickInfoToArticleCardModel(
            article,
          ),
          onPressed: () {
            final article = articlesModel.articles.elementAt(index);
            context.pushNamedArticleByPath(
              article.path,
            );
          },
          bookmarkBuilder: bookmarkBuilder,
        );
      },
    );
  }
}
