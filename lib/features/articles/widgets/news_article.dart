import 'dart:developer';

import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/utils/utils.dart';
import 'package:flutter/material.dart';

class NewsArticle extends StatelessWidget {
  const NewsArticle({
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
    final theme = Theme.of(context);

    return Dismissible(
      key: ValueKey(article.id),
      background: Text('background'),
      secondaryBackground: Text('secondaryBackground'),
      child: GestureDetector(
        onTap: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (article.coverImage != null ||
                    (article.tags != null && article.tags!.isNotEmpty)) ...[
                  _TopContent(
                    image: showCoverImage ? article.coverImage : null,
                    tags: article.tags,
                  ),
                  const SizedBox(height: 4),
                ],
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: theme.textTheme.bodyLarge!.medium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        StringUtils.joinBy(
                          [
                            StringUtils.prepareAuthors(
                              userName: article.user.name,
                              organizationName: article.organization?.name,
                            ),
                            StringUtils.formatDate(article.createdAt),
                          ],
                          separator: ' // ',
                        ),
                        style: theme.textTheme.bodyMedium!.secondary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopContent extends StatelessWidget {
  const _TopContent({
    this.image,
    this.tags,
  });

  final String? image;
  final List<String>? tags;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTagTextWidget(
              context,
              tags!.join(', '),
            ),
            const SizedBox(height: 2),
            const Divider(
              thickness: 0.5,
            ),
          ],
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.network(
            image!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 180,
          ),
          if (tags != null) ...[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tags!
                    .map(
                      (tag) => DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(80),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          child: _buildTagTextWidget(context, tag),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTagTextWidget(BuildContext context, String tag) {
    final style = Theme.of(context).textTheme.labelSmall!.medium;

    return Text(
      tag.toUpperCase(),
      style: style,
    );
  }
}
