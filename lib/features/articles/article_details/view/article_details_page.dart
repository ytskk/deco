import 'dart:developer';

import 'package:dev_community/constants/app_icons.dart';
import 'package:dev_community/core/adaptive_widgets/adaptive_widgets.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrolls_to_top/scrolls_to_top.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final articleDetailsControllerProvider = StateNotifierProvider.autoDispose
    .family<ArticleDetailsController, ArticleDetailsState, String>(
  (ref, path) {
    final repository = ref.read(articlesRepositoryProvider);
    final dataStore = ref.read(articlesDaoProvider);

    return ArticleDetailsController(
      articlesRepository: repository,
      articlesDataStore: dataStore,
      articlePath: path,
    );
  },
);

// TODO(me): add table of contents to article.

final floatingIslandProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});

class ArticleDetailsPage extends StatelessWidget {
  const ArticleDetailsPage({
    super.key,
    required this.articlePath,
  });

  final String articlePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final articleDetails =
              ref.watch(articleDetailsControllerProvider(articlePath));
          final isFloating = ref.watch(floatingIslandProvider);
          log('redraw');

          return articleDetails.when(
            data: (details) {
              return GestureDetector(
                onTap: () {
                  ref
                      .read(floatingIslandProvider.notifier)
                      .update((state) => !state);
                },
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: 0,
                  ),
                  floatingActionButton: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: animation.drive(
                          Tween<double>(
                            begin: 0.92,
                            end: 1,
                          ),
                        ),
                        child: child,
                      ),
                    ),
                    child: isFloating
                        ? ArticleDetailsFloatingIsland(article: details)
                        : null,
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  body: _ArticleDetailsView(articleDetails: details),
                ),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
            error: (error) {
              return Center(
                child: Text(error.toString()),
              );
            },
          );
        },
      ),
    );
  }
}

class ArticleDetailsFloatingIsland extends StatelessWidget {
  const ArticleDetailsFloatingIsland({
    super.key,
    required this.article,
  });

  final ArticleDetailsModel article;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final isSaved =
            ref.watch(articlesDaoProvider).isArticleSaved(article.id);

        return FloatingIsland(
          children: [
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            StreamBuilder<bool>(
              stream: isSaved,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                final value = snapshot.data ?? false;

                if (value) {
                  return Row(
                    children: [
                      Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          final isRead = ref
                              .watch(articlesDaoProvider)
                              .isArticleRead(article.id);

                          return StreamBuilder<bool>(
                            stream: isRead,
                            builder: (BuildContext context,
                                AsyncSnapshot<bool> snapshot) {
                              final isReadValue = snapshot.data ?? false;

                              return IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  ref
                                      .read(articlesDaoProvider)
                                      .toggleRead(article.id);
                                  HapticFeedback.mediumImpact();
                                },
                                icon: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  switchInCurve: Curves.easeOut,
                                  switchOutCurve: Curves.easeOut,
                                  transitionBuilder: (child, animation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  child: isReadValue
                                      ? const IconBox(
                                          key: ValueKey('read'),
                                          assetName: AppIcons.readFill,
                                          color: Colors.white,
                                        )
                                      : const IconBox(
                                          key: ValueKey('unread'),
                                          assetName: AppIcons.read,
                                          color: Colors.white,
                                        ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            BookmarkButton(
              articleId: article.id,
              articlePath: article.path,
              usePadding: true,
              color: Colors.white,
            ),
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                shareData(
                  context,
                  article.url,
                  StringUtils.joinBy(
                    [
                      article.title,
                      article.user.name,
                    ],
                    separator: ' by ',
                  ),
                );
              },
              icon: const IconBox(
                assetName: AppIcons.share,
                color: Colors.white,
              ),
            ),
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                launchUrlString(
                  article.url,
                  mode: LaunchMode.externalApplication,
                );
              },
              icon: const IconBox(
                assetName: AppIcons.globe,
                color: Colors.white,
              ),
            ),
            // TODO: dropdown menu with open original link, re-download button.
          ],
        );
      },
    );
  }
}

class FloatingIsland extends StatelessWidget {
  const FloatingIsland({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return CardAlternative(
      color: primaryColor,
      child: Theme(
        data: ThemeData(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleDetailsView extends StatefulWidget {
  const _ArticleDetailsView({
    required this.articleDetails,
  });

  final ArticleDetailsModel articleDetails;

  @override
  State<_ArticleDetailsView> createState() => _ArticleDetailsViewState();
}

class _ArticleDetailsViewState extends State<_ArticleDetailsView> {
  late final AutoScrollController _articleDetailsScrollController;

  @override
  void initState() {
    super.initState();

    _articleDetailsScrollController = AutoScrollController();
  }

  @override
  void dispose() {
    _articleDetailsScrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollsToTop(
      onScrollsToTop: (ScrollsToTopEvent event) async {
        await _articleDetailsScrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      },
      child: ListView(
        controller: _articleDetailsScrollController,
        padding: const EdgeInsets.only(
          bottom: 120,
          top: 32,
        ),
        children: [
          ArticleInfo(
            title: widget.articleDetails.title,
            coverImage: widget.articleDetails.coverImage,
            tags: widget.articleDetails.tags,
            readingTime:
                widget.articleDetails.readingTimeMinutes.clampMin(1).toString(),
            relativeDate:
                StringUtils.relativeDate(widget.articleDetails.createdAt),
          ),
          ArticleBody(
            articleDetails: widget.articleDetails,
            scrollController: _articleDetailsScrollController,
          ),
          const SizedBox(height: 24),
          ArticleAuthors(
            author: widget.articleDetails.user,
            organization: widget.articleDetails.organization,
          ),
        ],
      ),
    );
  }
}
