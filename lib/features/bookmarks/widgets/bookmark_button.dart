import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteArticleProvider = StreamProvider.family.autoDispose(
  (ref, int articleId) {
    final dao = ref.watch(articlesDaoProvider);

    return dao.isArticleSaved(articleId);
  },
);

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    super.key,
    required this.articleId,
    required this.articlePath,
    this.usePadding = false,
    this.color,
  });

  final Color? color;
  final int articleId;
  final String articlePath;
  final bool usePadding;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final favoriteArticle = ref.watch(
          favoriteArticleProvider(articleId),
        );

        return favoriteArticle.when(
          data: (isFavorite) {
            return GestureDetector(
              onTap: () async {
                if (isFavorite) {
                  await ref.read(articlesDaoProvider).deleteArticle(articleId);
                } else {
                  final articlesProvider = ref.read(articlesRepositoryProvider);
                  final articleDetails = await articlesProvider
                      .getArticleDetails(path: articlePath);

                  await ref.read(articlesDaoProvider).saveArticle(
                        ArticleConverter.toArticleWithAuthor(
                          articleDetails,
                        ),
                      );
                }
              },
              child: Padding(
                padding: usePadding ? const EdgeInsets.all(8) : EdgeInsets.zero,
                child: Icon(
                  isFavorite
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  color: color,
                ),
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
