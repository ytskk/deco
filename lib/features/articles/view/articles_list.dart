import 'dart:developer';

import 'package:dev_community/features/articles/articles.dart';
import 'package:dev_community/features/bookmarks/widgets/bookmark_button.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

final articleListStateProvider =
    StateProvider.family<ArticlesLoadModel, String>(
  (ref, type) {
    return ArticlesLoadModel(type: type);
  },
);

class ArticlesList extends ConsumerStatefulWidget {
  const ArticlesList({
    super.key,
    required this.type,
  });

  final String type;

  @override
  ConsumerState createState() => _ArticlesListState();
}

class _ArticlesListState extends ConsumerState<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    final onBackgroundColor =
        Theme.of(context).textTheme.bodyMedium!.secondary.color;

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final state = ref.watch(articleListStateProvider(widget.type));

        return RefreshIndicator(
          onRefresh: () async {
            await _loadPage(1);
          },
          child: InfiniteList(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 24,
            ),
            isLoading: state.isLoading,
            itemCount: state.articles.length,
            hasReachedMax: state.hasReachedMax,
            hasError: state.hasError,
            onFetchData: () async {
              await _loadPage(state.page + 1);
            },
            loadingBuilder: (context) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },

            /// TODO: beautify
            errorBuilder: (context) => const Center(
              child: Text('error'),
            ),
            itemBuilder: (BuildContext context, int index) {
              return ArticleCard(
                article: ArticleConverter.articleQuickInfoToArticleCardModel(
                  state.articles.elementAt(index),
                ),
                onPressed: () {
                  final article = state.articles.elementAt(index);
                  context.pushNamedArticleByPath(
                    article.path,
                    extra: state.articles.elementAt(index),
                  );
                },
                bookmarkBuilder: (_, articleId, articlePath) {
                  return BookmarkButton(
                    articleId: articleId,
                    articlePath: articlePath,
                    color: onBackgroundColor,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  /// BUG: Loads next page on every opening page. May calls onFetchData
  /// every time the widget is created.
  Future<void> _loadPage(int page) async {
    try {
      ref.read(articleListStateProvider(widget.type).notifier).update(
            (state) => state.copyWith(isLoading: true),
          );

      final articles = await ref.read(articlesRepositoryProvider).getArticles(
            type: widget.type,
            page: page,
          );

      ref.read(articleListStateProvider(widget.type).notifier).update(
        (state) {
          final newArticles =
              page == 1 ? articles : [...state.articles, ...articles];

          return state.copyWith(
            page: page,
            articles: newArticles,
            isLoading: false,
            // TODO: in case if article per page will be changed.
            // Change in organization articles too.
            hasReachedMax: articles.length < 30,
          );
        },
      );
    } catch (error) {
      ref.read(articleListStateProvider(widget.type).notifier).update(
            (state) => state.copyWith(hasError: true),
          );
      // log('error: $error');
    }
  }
}
