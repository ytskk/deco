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

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
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
            final iconColor =
                Theme.of(context).textTheme.labelLarge!.secondary.color;

            return GestureDetector(
              onTap: () async {
                if (isFavourite) {
                  await ref.read(articlesDaoProvider).deleteArticle(articleId);
                } else {
                  final articlesProvider = ref.read(articlesRepositoryProvider);
                  // log('saving article with slug: ${article.path}');
                  final articleDetails = await articlesProvider
                      .getArticleDetailsById(id: articleId);

                  await ref.read(articlesDaoProvider).saveArticle(
                        ArticleConverter.toArticleWithAuthor(
                          articleDetails,
                        ),
                      );
                }
              },
              child: Icon(
                isFavourite
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_border_rounded,
                color: iconColor,
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
