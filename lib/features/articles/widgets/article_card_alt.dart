import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';

class ArticleCardAlt extends StatelessWidget {
  const ArticleCardAlt({
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
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.coverImage != null)
              _ArticleCardCoverImage(imageUrl: article.coverImage!),
            _ArticleCardBody(
              article: article,
              bookmarkBuilder: bookmarkBuilder,
            ),
          ],
        ),
      ),
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
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: 140,
      errorWidget: (context, url, error) => const Icon(Icons.error),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: AnimatedOpacity(
          opacity: downloadProgress.progress ?? 0.0,
          duration: const Duration(milliseconds: 500),
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
        ),
      ),
    );
  }
}

class _ArticleCardBody extends StatelessWidget {
  const _ArticleCardBody({
    required this.article,
    this.bookmarkBuilder,
  });

  final ArticleCardModel article;
  final BookmarkBuilder? bookmarkBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ArticleCardBodyInfo(article: article),
          Text(
            article.title,
            style: theme.textTheme.bodyLarge?.bold,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          _ArticleCardBottomInfo(
            article: article,
            bookmarkBuilder: bookmarkBuilder,
          ),
        ],
      ),
    );
  }
}

class _ArticleCardBodyInfo extends StatelessWidget {
  const _ArticleCardBodyInfo({
    required this.article,
  });

  final ArticleCardModel article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      StringUtils.joinBy(
        [
          article.authorsString,
          StringUtils.relativeDate(article.createdAt),
        ],
        separator: ' • ',
      ),
      style: theme.textTheme.labelMedium?.secondary,
    );
  }
}

class _ArticleCardBottomInfo extends StatelessWidget {
  const _ArticleCardBottomInfo({
    required this.article,
    this.bookmarkBuilder,
  });

  final ArticleCardModel article;
  final BookmarkBuilder? bookmarkBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (article.tags != null) ...[
          Text(
            StringUtils.joinBy(
              article.tags!,
              separator: '  ',
            ),
            style: theme.textTheme.labelMedium!.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => _onArticleShare(context),
                  child: Icon(
                    Icons.file_upload_outlined,
                    color: theme.textTheme.labelMedium!.secondary.color,
                  ),
                ),
                // if (bookmarkBuilder != null) ...[
                //   const SizedBox(width: 12),
                //   bookmarkBuilder!(context, article.id),
                // ],
              ],
            ),
            const Spacer(),
            Row(
              children: [
                if (article.positiveReactionsCount != null) ...[
                  IconLabel(
                    icon: Icons.favorite_outline_rounded,
                    label: article.positiveReactionsCount.toString(),
                  ),
                  const SizedBox(width: 8),
                ],
                if (article.positiveReactionsCount != null) ...[
                  IconLabel(
                    icon: Icons.chat_bubble_outline_rounded,
                    label: article.commentsCount.toString(),
                  ),
                  const SizedBox(width: 8),
                ],
                IconLabel(
                  icon: Icons.access_time_rounded,
                  label: '${article.readingTimeMinutes} min ',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _onArticleShare(BuildContext context) async {
    return shareData(
      context,
      article.url!,
      '${article.title} — ${article.authorsString}',
    );
  }
}
