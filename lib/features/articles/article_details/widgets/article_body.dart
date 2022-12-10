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

  return repository.getArticleDetails(path: slug);
});

class ArticleBody extends StatelessWidget {
  const ArticleBody({
    super.key,
    required this.articleDetails,
    required this.scrollController,
  });

  final ArticleDetailsModel articleDetails;
  final AutoScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final isDarkMode =
            ref.watch(appThemePreferencesProvider.notifier).isDarkMode();

        final html = _buildHtml(articleDetails.bodyMarkdown);

        return _ArticleBody(
          scrollController: scrollController,
          html: html,
          isDarkMode: isDarkMode,
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

      // log('tOC: ${ref.read(tableOfContentsProvider(slug))}');
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

    if (markdown.trim().substring(0, 3) == '---') {
      final index = markdown.indexOf('---', 3);
      return markdown.substring(index + 3);
    }

    return markdown;
  }
}

class _ArticleBody extends StatelessWidget {
  const _ArticleBody({
    required this.scrollController,
    required this.html,
    required this.isDarkMode,
  });

  final AutoScrollController scrollController;
  final String html;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
          if (element.localName == 'hr') {
            return const Separator.material();
            // return Text('This is a divider');
          }

          // handle headings
          if (element.localName?.contains('h') == true) {
            return _tagHeadings(textTheme, element);
          }

          final embedRegex = RegExp('{% embed .* %}');

          if (element.text.contains(embedRegex)) {
            final embeddedUrl = element.text
                .replaceAll('{% embed ', '')
                .replaceAll(' %}', '')
                .trim();

            return EmbeddedUrl(url: embeddedUrl);
          }

          if (element.localName == 'img') {
            // log('figure: ${element.parent?.nodes}');
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: generateShadow(),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  element.attributes['src']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          }

          // Handle code block.
          if (element.localName == 'pre') {
            final theme = Theme.of(context);
            final lang =
                element.firstChild?.attributes['class']?.split('-').last;
            final codeTheme = isDarkMode ? atomOneDarkTheme : atomOneLightTheme;

            return CodeBlock(
              codeTheme: codeTheme,
              lang: lang,
              text: element.text,
            );
          }

          return null;
        },
      ),
    );
  }

  Widget? _tagHeadings(TextTheme textTheme, dom.Element element) {
    if (element.localName?.contains('h') == true && element.id.isNotEmpty) {
      final headingElement = element.localName!;
      final headingValue = int.parse(headingElement.substring(1));
      final headingStyle = _matchTextStyleToHeading(headingElement, textTheme);

      return Padding(
        padding: EdgeInsets.only(
          top: 44 / headingValue.toDouble(),
          bottom: 4,
        ),
        child: AutoScrollTag(
          key: ValueKey(element),
          controller: scrollController,
          index: element.text.hashCode,
          child: Text(
            element.text.trim(),
            style: headingStyle,
            // style: textTheme.,
          ),
        ),
      );
    }
    return null;
  }

  TextStyle? _matchTextStyleToHeading(String heading, TextTheme textTheme) {
    switch (heading) {
      case 'h1':
        return textTheme.displayMedium!.bold;
      case 'h2':
        return textTheme.displayMedium!.bold;
      case 'h3':
        return textTheme.displaySmall!.bold;
      case 'h4':
        return textTheme.displaySmall!.medium;
      default:
        return textTheme.displaySmall;
    }
  }
}

class CodeBlock extends StatelessWidget {
  const CodeBlock({
    super.key,
    required this.codeTheme,
    required this.lang,
    required this.text,
  });

  final Map<String, TextStyle> codeTheme;
  final String? lang;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                      lang!,
                      style: theme.textTheme.labelSmall!.medium.secondary,
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
                        text: text,
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text(AppStrings.authorInfoAppBarUsernameCopied),
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
                  text,
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
              AsyncSnapshot<ArticleQuickInfoModel> snapshot,
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
    log(
      'URL can be embedded: $url',
      name: 'EmbeddedUrl::build',
    );

    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Text(
        url,
        style: theme.textTheme.labelMedium!.medium.copyWith(
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }

  Future<ArticleQuickInfoModel> _fetchEmbeddedUrl(
    String embededUrl,
    ArticlesRepositoryInterface articlesRepository,
  ) async {
    final path = embededUrl.substring('https://dev.to'.length);
    final res = await articlesRepository.getArticleDetails(path: path);

    return ArticleQuickInfoModel.fromDetails(res);
  }
}

class ArticlePreview extends StatelessWidget {
  const ArticlePreview({
    super.key,
    required this.article,
    this.onTap,
  });

  final ArticleQuickInfoModel article;
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
