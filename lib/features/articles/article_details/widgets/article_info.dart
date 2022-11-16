import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        if (coverImage != null) ...[
          _ArticleCoverImage(imageUrl: coverImage!),
          const SizedBox(height: 24),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                relativeDate,
                style: theme.textTheme.labelMedium!.semibold.secondary,
              ),
              Text(
                '$readingTime ${AppStrings.articleDetailsInfoReadingTime}',
                style: theme.textTheme.labelMedium!.semibold.secondary,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: theme.textTheme.displayMedium!.bold,
              ),
              if (tags != null) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  children: tags!
                      .map(
                        // TODO(me): navigate to tag page by tag name.
                        (tag) => GestureDetector(
                          onTap: () {
                            log('Tapped on tag: $tag');
                            HapticFeedback.lightImpact();
                          },
                          child: Text(
                            '#$tag',
                            style: theme.textTheme.bodyMedium!.medium.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ]
            ],
          ),
        ),
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
