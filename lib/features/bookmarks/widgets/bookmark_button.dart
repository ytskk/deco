import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favouriteArticleProvider = StreamProvider.family.autoDispose(
  (ref, int articleId) {
    final dao = ref.watch(articlesDaoProvider);

    return dao.isArticleSaved(articleId);
  },
);

class BookmarkBuilder extends StatelessWidget {
  const BookmarkBuilder({
    super.key,
    required this.articleId,
  });

  final int articleId;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final favouriteArticle = ref.watch(
          favouriteArticleProvider(articleId),
        );

        return favouriteArticle.when(
          data: (isFavourite) {
            return GestureDetector(
              onTap: () async {
                if (isFavourite) {
                  await ref.read(articlesDaoProvider).deleteArticle(articleId);
                } else {
                  final articlesProvider = ref.read(articlesRepositoryProvider);
                  // log('saving article with slug: ${article.path}');
                  final articleDetails = await articlesProvider
                      .getArticleDetails(slug: article.path);

                  await ref.read(articlesDaoProvider).saveArticle(
                        ArticleDetailsToArticleWithAuthorConverter
                            .toArticleWithAuthor(
                          articleDetails,
                        ),
                      );
                }
              },
              child: Icon(
                isFavourite
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_border_rounded,
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return const SizedBox.shrink();
          },
          loading: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
