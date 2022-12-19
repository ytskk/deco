import 'dart:developer';

import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/features/articles/articles.dart';
import 'package:dev_community/features/bookmarks/widgets/bookmark_button.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

final articlesListProvider = NotifierProviderFamily<
    ArticlesNotifier,
    LoadingDataModel<List<ArticleQuickInfoModel>>,
    String>(ArticlesNotifier.new);

class ArticlesList extends StatelessWidget {
  const ArticlesList({
    super.key,
    required this.type,
    this.spacing = Spacing.medium,
  });

  final String type;
  final Spacing spacing;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final articles = ref.watch(articlesListProvider(type));

        return RefreshIndicator(
          onRefresh: () {
            return ref.read(articlesListProvider(type).notifier).refresh();
          },
          child: InfiniteList(
            padding: EdgeInsets.only(
              top: spacing.value,
              left: 8,
              right: 8,
              bottom: spacing.value,
            ),
            isLoading: articles.isLoading,
            hasError: articles.hasError,
            hasReachedMax: articles.hasReachedMax,
            itemCount: articles.data?.length ?? 0,
            onFetchData: () {
              ref.read(articlesListProvider(type).notifier).loadNextPage();
            },
            loadingBuilder: (_) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            emptyBuilder: (context) => const Center(
              child: Text(
                'No articles found',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            itemBuilder: (context, index) {
              final article = articles.data?[index];

              return ArticleCard(
                article: ArticleConverter.articleQuickInfoToArticleCardModel(
                    article!),
                onPressed: () {
                  context.pushNamedArticleByPath(article.path);
                },
                bookmarkBuilder: (context, articleId, articlePath) =>
                    BookmarkButton(
                  articleId: articleId,
                  articlePath: articlePath,
                ),
              );
            },
            errorBuilder: (context) => Center(
              child: Text(
                'Something went wrong: ${articles.error}',
              ),
            ),
          ),
        );
      },
    );
  }
}
