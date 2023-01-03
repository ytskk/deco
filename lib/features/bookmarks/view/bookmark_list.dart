import 'dart:developer';

import 'package:data_store/data_store.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BookmarkList extends StatelessWidget {
  const BookmarkList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final articles = ref.watch(bookmarksProvider);

            return articles.when(
              data: (articles) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final article = articles[index];

                      return ArticleCard(
                        article:
                            ArticleConverter.articleWithAuthorToArticleCard(
                          article,
                        ),
                        onPressed: () {
                          context.pushNamedArticleByPath(article.article.path);
                        },
                        bookmarkBuilder: (context, articleId, articlePath) =>
                            BookmarkButton(
                          articleId: articleId,
                          articlePath: articlePath,
                        ),
                      );
                    },
                    childCount: articles.length,
                  ),
                );
              },
              loading: () => const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stack) => const SliverToBoxAdapter(
                child: Center(
                  child: Text('Error'),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
