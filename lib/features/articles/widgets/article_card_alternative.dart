import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ArticleCardAlternative extends StatelessWidget {
  const ArticleCardAlternative({
    super.key,
    required this.article,
    this.onPressed,
    this.showCoverImage = true,
  });

  final ArticleQuickInfoModel article;
  final VoidCallback? onPressed;
  final bool showCoverImage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onPressed,
      child: CardAlternative(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ArticleBody(article: article),
            if (showCoverImage && article.coverImage != null) ...[
              const SizedBox(height: 20),
              _ArticleCoverImage(imageUrl: article.coverImage!),
            ],
            _ArticleOptions(article: article),
          ],
        ),
      ),
    );
  }
}

class _ArticleBody extends StatelessWidget {
  const _ArticleBody({
    required this.article,
  });

  final ArticleQuickInfoModel article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringUtils.prepareAuthors(
              userName: article.user.name,
              organizationName: article.organization?.name,
            ),
            style: theme.textTheme.labelMedium!.medium.secondary,
          ),
          Text(
            article.title,
            style: theme.textTheme.bodyMedium!.bold,
          ),
          const SizedBox(height: verySmallSpacing),
          Text(
            StringUtils.joinBy(
              [
                StringUtils.relativeDate(article.createdAt),
                '${article.readingTimeMinutes} min read',
              ],
              separator: ' - ',
            ),
            style: theme.textTheme.labelSmall!.secondary,
          ),
        ],
      ),
    );
  }
}

class _ArticleCoverImage extends StatelessWidget {
  const _ArticleCoverImage({
    required this.imageUrl,
  });

  final String imageUrl;

  static const double imageHeight = 160;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: imageHeight,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _ArticleOptions extends StatelessWidget {
  const _ArticleOptions({
    required this.article,
  });

  final ArticleQuickInfoModel article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.tags != null)
            RichText(
              text: TextSpan(
                children: article.tags!
                    .map(
                      (tag) => TextSpan(
                        text: '$tag  ',
                        style: theme.textTheme.labelSmall!.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          Row(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await shareData(
                        context,
                        article.url,
                        '${article.title} by ${StringUtils.prepareAuthors(
                          userName: article.user.username,
                          organizationName: article.organization?.name,
                        )}',
                      );
                    },
                    child: Icon(
                      Icons.file_upload_outlined,
                      color: theme.textTheme.labelMedium!.secondary.color,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  IconLabel(
                    icon: Icons.thumb_up_off_alt_outlined,
                    label: article.positiveReactionsCount.toString(),
                    iconSize: 20,
                  ),
                  const SizedBox(width: 8),
                  IconLabel(
                    icon: Icons.chat_bubble_outline_rounded,
                    label: article.commentsCount.toString(),
                    iconSize: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
