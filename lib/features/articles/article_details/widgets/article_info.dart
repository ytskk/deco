import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ArticleInfo extends StatelessWidget {
  const ArticleInfo({
    super.key,
    this.coverImage,
    required this.title,
    this.tags,
    required this.relativeDate,
    required this.readingTime,
  });

  final String? coverImage;
  final String title;
  final List<String>? tags;
  final String relativeDate;
  final String readingTime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringUtils.joinBy(
                  [
                    relativeDate,
                    '$readingTime ${AppStrings.articleDetailsInfoReadingTime}',
                  ],
                  separator: ' • ',
                ),
                style: theme.textTheme.bodySmall!.medium.secondary,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: theme.textTheme.displayLarge!.bold,
              ),
              if (tags != null) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: tags!
                      .map(
                        // TODO(me): navigate to tag page by tag name.
                        (tag) => FadingButton(
                          child: Text(
                            tag,
                            style: theme.textTheme.bodySmall!.semibold.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          onPressed: () {
                            // log('TODO: navigate to tag page by tag name.');
                            context.pushNamed(
                              PathNames.tagsByName,
                              params: {
                                PathNames.tagsByName: tag,
                              },
                            );
                            HapticFeedback.lightImpact();
                          },
                        ),
                      )
                      .toList(),
                ),
              ]
            ],
          ),
        ),
        if (coverImage != null) ...[
          const SizedBox(height: 16),
          _ArticleCoverImage(imageUrl: coverImage!),
        ],
        const SizedBox(height: 16),
      ],
    );
  }
}

class _ArticleCoverImage extends StatelessWidget {
  const _ArticleCoverImage({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      cacheKey: imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
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
