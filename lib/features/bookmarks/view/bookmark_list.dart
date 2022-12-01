import 'package:data_store/data_store.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final savedArticlesProvider =
    FutureProvider.autoDispose<List<ArticleWithAuthorModel>>((ref) {
  final dao = ref.watch(articlesDaoProvider);

  return dao.allSavedArticlesList();
});

class BookmarkList extends StatelessWidget {
  const BookmarkList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final articles = ref.watch(savedArticlesProvider);

        return articles.when(
          data: (List<ArticleWithAuthorModel> data) {
            if (data.isEmpty) {
              return const Center(
                child: Text('No bookmarks yet'),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 24,
              ),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final article = data[index];

                return ArticleCard(
                  article:
                      ArticleConverter.articleWithAuthorToArticleCard(article),
                  onPressed: () {
                    context.pushNamedArticleByPath(
                      article.article.path,
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
          },
          error: (Object error, StackTrace stackTrace) {
            return Center(
              child: Text('Error: $error'),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        );
      },
    );
  }
}
