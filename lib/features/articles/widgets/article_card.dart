import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/utils/utils.dart';
import 'package:flutter/material.dart';

typedef BookmarkBuilder = Widget Function(
  BuildContext context,
  int articleId,
  String articlePath,
);

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
    this.onPressed,
    this.bookmarkBuilder,
  });

  final ArticleCardModel article;
  final VoidCallback? onPressed;
  final BookmarkBuilder? bookmarkBuilder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ArticleCardBody(article: article),
            _ArticleCardBottom(
              article: article,
              bookmarkBuilder: bookmarkBuilder,
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleCardBody extends StatelessWidget {
  const _ArticleCardBody({
    required this.article,
  });

  final ArticleCardModel article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.authorsString,
                  style: theme.textTheme.labelLarge!.medium.secondary,
                ),
                Text(
                  article.title,
                  style: article.isRead
                      ? theme.textTheme.bodyMedium!.semibold.secondary
                      : theme.textTheme.bodyMedium!.semibold,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                if (article.tags != null)
                  Text(
                    StringUtils.joinBy(
                      article.tags!,
                      separator: '  ',
                    ),
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (article.coverImage != null)
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              right: 12,
            ),
            child: _ArticleCardCoverImage(imageUrl: article.coverImage!),
          ),
      ],
    );
  }
}

class _ArticleCardCoverImage extends StatelessWidget {
  const _ArticleCardCoverImage({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        cacheKey: imageUrl,
        fit: BoxFit.cover,
        width: 80,
        height: 80,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: AnimatedOpacity(
            opacity: downloadProgress.progress ?? 0.0,
            duration: const Duration(milliseconds: 500),
            child: CircularProgressIndicator.adaptive(
              value: downloadProgress.progress,
            ),
          ),
        ),
      ),
    );
  }
}

class _ArticleCardBottom extends StatelessWidget {
  const _ArticleCardBottom({
    required this.article,
    this.bookmarkBuilder,
  });

  final ArticleCardModel article;
  final BookmarkBuilder? bookmarkBuilder;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelLarge;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
      child: Row(
        children: [
          Text(
            StringUtils.joinBy(
              [
                StringUtils.relativeDate(article.createdAt),
                '${article.readingTimeMinutes.clamp(1, 999)} min read',
              ],
              separator: ' • ',
            ),
            style: textStyle!.medium.secondary,
          ),
          const Spacer(),
          IconTheme(
            data: IconThemeData(
              color: textStyle.secondary.color,
            ),
            child: Row(
              children: [
                if (bookmarkBuilder != null) ...[
                  bookmarkBuilder!(context, article.id, article.path),
                  const SizedBox(width: 12),
                ],
                GestureDetector(
                  onTap: () => _onArticleShare(context),
                  child: const Icon(Icons.file_upload_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onArticleShare(BuildContext context) async {
    return shareData(
      context,
      article.url,
      '${article.title} — ${article.authorsString}',
    );
  }
}
