import 'dart:developer';
import 'dart:io';

import 'package:dev_community/constants/api_constants.dart';
import 'package:dev_community/constants/app_strings.dart';
import 'package:dev_community/features/articles/articles.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:url_launcher/url_launcher.dart';

final articleBodyProvider =
    FutureProvider.family<ArticleDetailsModel, String>((ref, slug) async {
  final repository = ref.read(articlesRepositoryProvider);

  return repository.getArticleDetails(slug: slug);
});

class ArticleBody extends StatelessWidget {
  const ArticleBody({
    super.key,
    required this.slug,
    required this.scrollController,
  });

  final String slug;
  final AutoScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final articleBody = ref.watch(articleBodyProvider(slug));

        return articleBody.when(
          data: (ArticleDetailsModel data) {
            // Change article code block theme based on app theme.
            final isDarkMode =
                ref.watch(appThemePreferencesProvider.notifier).isDarkMode();

            final html = _buildHtml(data.bodyMarkdown);

            return _ArticleBody(
              articleDetailsModel: data,
              scrollController: scrollController,
              html: html,
              isDarkMode: isDarkMode,
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Center(
              child: Text('Error: $error'),
            );
          },
          loading: () {
            return const Center(child: CircularProgressIndicator.adaptive());
          },
        );
      },
    );
  }

  void _handleHeadings(WidgetRef ref, String html) {
    const headingValues = [
      'h2',
      'h3',
      'h4',
    ];

    final document = parse(html);

    for (final element in headingValues) {
      final heading = document
          .getElementsByTagName(element)
          .map((e) => e.text.toCapitalized())
          .toList();

      log('tOC: ${ref.read(tableOfContentsProvider(slug))}');
      // ref
      //     .read(tableOfContentsProvider(slug).state)
      //     .update((state) => state.copyWithNewValuesTo(element, heading));
      log('founded $element: ${heading.length}');
    }
  }

  String _buildHtml(String markdown) {
    String body = _removeSelectionMarker(markdown);

    final html = md.markdownToHtml(
      body,
      extensionSet: md.ExtensionSet.gitHubWeb,
    );

    return html;
  }

  /// If markdown contains YAML selection marker, remove it.
  String _removeSelectionMarker(String markdown) {
    if (markdown.isEmpty) {
      return markdown;
    }

    if (markdown.substring(0, 3) == '---') {
      final index = markdown.indexOf('---', 3);
      return markdown.substring(index + 3);
    }

    return markdown;
  }
}

class _ArticleBody extends StatelessWidget {
  const _ArticleBody({
    required this.articleDetailsModel,
    required this.scrollController,
    required this.html,
    required this.isDarkMode,
  });

  final ArticleDetailsModel articleDetailsModel;
  final AutoScrollController scrollController;
  final String html;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: HtmlWidget(
        html,
        rebuildTriggers: RebuildTriggers([isDarkMode]),
        enableCaching: false,

        /// TODO(me): Refactor, inject this.
        onTapUrl: (url) async {
          if (url.startsWith('https://dev.to/')) {
            context.pushNamedArticleByPath(
              url.substring('https://dev.to'.length),
            );
            return true;
          }

          final uri = Uri.parse(url);
          return launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
        },
        customStylesBuilder: (element) {
          if (element.localName!.contains('h2')) {
            return {
              'font-size': '32px',
              'line-height': '40px',
              'font-weight': 'bold',
            };
          }

          // If there is a link refers to the same site
          if (element.localName!.contains('a')) {
            final href = element.attributes['href'];

            if (href != null && href.startsWith('https://dev.to/')) {
              return {
                'text-decoration': 'none',
                'font-weight': '500',
              };
            }
          }

          return null;
        },
        customWidgetBuilder: (element) {
          _tagHeadings(element);
          if (element.localName == 'hr') {
            return const Divider(
              thickness: 1,
            );
          }

          final embedRegex = RegExp('{% embed .* %}');

          if (element.text.contains(embedRegex)) {
            final embeddedUrl = element.text
                .replaceAll('{% embed ', '')
                .replaceAll(' %}', '')
                .trim();

            return EmbeddedUrl(url: embeddedUrl);
          }

          /// Handle code block.
          if (element.localName == 'pre') {
            final theme = Theme.of(context);
            final lang =
                element.firstChild?.attributes['class']?.split('-').last;
            final codeTheme = isDarkMode ? atomOneDarkTheme : atomOneLightTheme;

            return SizedBox(
              width: double.infinity,
              child: Card(
                color: codeTheme['root']?.backgroundColor,
                child: Column(
                  children: [
                    Row(
                      children: [
                        if (lang != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              lang,
                              style:
                                  theme.textTheme.labelSmall!.medium.secondary,
                            ),
                          ),
                        const Spacer(),
                        CupertinoButton(
                          // padding: EdgeInsets.zero,
                          // minSize: 0,
                          child: Text(
                            AppStrings.articleDetailsCopy,
                            style: theme.textTheme.labelMedium!.medium.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),

                          /// TODO(me): inject this.
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(
                                text: element.text,
                              ),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    AppStrings.authorInfoAppBarUsernameCopied),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    // const Separator.adaptive(),
                    SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: HighlightView(
                          element.text,
                          language: lang ?? 'auto',
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          theme: codeTheme,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return null;
        },
      ),
    );
  }

  dynamic _tagHeadings(dom.Element element) {
    if (element.localName?.contains('h') == true && element.id.isNotEmpty) {
      // log('element.localName: ${element.id}');
      return AutoScrollTag(
        key: ValueKey(element),
        controller: scrollController,
        index: element.text.hashCode,
        child: Text(
          element.text.trim(),
        ),
      );
    }
  }
}

class EmbeddedUrl extends StatelessWidget {
  const EmbeddedUrl({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    final inner = url.contains('https://dev.to/');
    if (inner) {
      return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final articlesRepository = ref.watch(articlesRepositoryProvider);

          return FutureBuilder(
            future: _fetchEmbeddedUrl(url, articlesRepository),
            builder: (
              BuildContext context,
              AsyncSnapshot<ArticleCardModel> snapshot,
            ) {
              if (snapshot.hasData) {
                final article = snapshot.data!;
                return ArticlePreview(
                  article: article,
                  onTap: () {
                    context.pushNamedArticleByPath(article.path);
                  },
                );
              }

              return const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            },
          );
        },
      );
    }

    final theme = Theme.of(context);

    return Text(
      url,
      style: theme.textTheme.labelMedium!.medium.copyWith(
        color: theme.colorScheme.primary,
      ),
    );
  }

  Future<ArticleCardModel> _fetchEmbeddedUrl(
    String embededUrl,
    ArticlesRepositoryInterface articlesRepository,
  ) async {
    final path = embededUrl.substring('https://dev.to'.length);
    final res = await articlesRepository.getArticleDetails(slug: path);

    return ArticleCardModel.fromDetails(res);
  }
}

class ArticlePreview extends StatelessWidget {
  const ArticlePreview({
    super.key,
    required this.article,
    this.onTap,
  });

  final ArticleCardModel article;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: CardAlternative(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              AccountAvatar(
                url: article.user.profileImage,
                accountName: article.user.username,
                radius: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: theme.textTheme.bodyLarge!.semibold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      StringUtils.joinBy(
                        [
                          article.user.name,
                          StringUtils.relativeDate(article.createdAt),
                          '${article.readingTimeMinutes} min read',
                        ],
                        separator: ' • ',
                      ),
                      style: theme.textTheme.labelMedium!.medium.secondary,
                    ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
