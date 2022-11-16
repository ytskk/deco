import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
    this.onPressed,
  });

  final ArticleCardModel article;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Card(
        child: Column(
          children: [
            if (article.coverImage != null)
              _ArticleCardCoverImage(imageUrl: article.coverImage!),
            _ArticleCardBody(article: article),
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
  });

  final ArticleCardModel article;

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
          Text(
            article.description,
            style: theme.textTheme.bodySmall?.secondary,
          ),
          const SizedBox(height: 8),
          _ArticleCardBottomInfo(article: article),
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
          _prepareAuthors(),
          StringUtils.relativeDate(article.createdAt),
        ],
        separator: ' • ',
      ),
      style: theme.textTheme.labelSmall?.secondary,
    );
  }

  String _prepareAuthors() {
    if (article.organization != null) {
      return StringUtils.joinBy(
        [
          article.user.name,
          article.organization!.name,
        ],
        separator: ' for ',
      );
    }

    return article.user.name;
  }
}

class _ArticleCardBottomInfo extends StatelessWidget {
  const _ArticleCardBottomInfo({
    required this.article,
  });

  final ArticleCardModel article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (article.tags != null) ...[
          Expanded(
            child: Text(
              StringUtils.joinBy(
                article.tags!,
                separator: '  ',
              ),
              style: theme.textTheme.labelMedium!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconLabel(
              icon: Icons.favorite_outline_rounded,
              label: article.positiveReactionsCount.toString(),
            ),
            const SizedBox(width: 8),
            IconLabel(
              icon: Icons.chat_bubble_outline_rounded,
              label: article.commentsCount.toString(),
            ),
          ],
        ),
      ],
    );
  }
}
