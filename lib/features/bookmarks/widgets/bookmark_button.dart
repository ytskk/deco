import 'package:dev_community/constants/app_icons.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    final iconColor = Theme.of(context).textTheme.bodyMedium!.secondary.color;

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
                await HapticFeedback.mediumImpact();
              },
              child: Padding(
                padding: usePadding ? const EdgeInsets.all(8) : EdgeInsets.zero,
                child: AnimatedCrossFade(
                  firstChild: IconBox(
                    assetName: AppIcons.bookmark,
                    color: color ?? iconColor,
                  ),
                  secondChild: IconBox(
                    assetName: AppIcons.bookmarkFill,
                    color: color ?? iconColor,
                  ),
                  crossFadeState: isFavorite
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 250),
                  secondCurve: Curves.easeOut,
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
