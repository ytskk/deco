import 'dart:developer';

import 'package:dev_community/features/articles/articles.dart';
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
            onFetchData: () async {
              await _loadPage(state.page + 1);
            },
            loadingBuilder: (context) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return NewsArticle(
                article: state.articles.elementAt(index),
                onPressed: () {
                  final article = state.articles.elementAt(index);
                  context.pushNamedArticleByPath(
                    article.path,
                    extra: state.articles.elementAt(index),
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
      ref.read(articleListStateProvider(widget.type).state).update(
            (state) => state.copyWith(isLoading: true),
          );

      final articles = await ref.read(articlesRepositoryProvider).getArticles(
            type: widget.type,
            page: page,
          );

      ref.read(articleListStateProvider(widget.type).state).update(
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
      log('error: $error');
    }
  }
}
