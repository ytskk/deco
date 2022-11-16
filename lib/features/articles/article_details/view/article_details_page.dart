import 'dart:developer';

import 'package:dev_community/constants/app_icons.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrolls_to_top/scrolls_to_top.dart';
import 'package:url_launcher/url_launcher_string.dart';

final articleInfoProvider = FutureProvider.autoDispose
    .family<ArticleDetailsModel, String>((ref, slug) async {
  final repository = ref.read(articlesRepositoryProvider);
  log('articleInfoProvider: $slug');

  return repository.getArticleDetails(slug: slug);
});

// TODO(me): add table of contents to article.
final tableOfContentsProvider =
    StateProvider.autoDispose.family<ArticleDetailsTableOfContentMap, String>(
  (ref, slug) {
    return const ArticleDetailsTableOfContentMap();
  },
);

class ArticleDetailsPage extends StatelessWidget {
  const ArticleDetailsPage({
    super.key,
    required this.articleSlug,
  });

  final String articleSlug;

  @override
  Widget build(BuildContext context) {
    log('passing to provider slug: $articleSlug');
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              size: 20,
            ),
            toolbarHeight: 32,
            surfaceTintColor: Theme.of(context).colorScheme.background,
            actions: [
              IconButton(
                onPressed: () {
                  launchUrlString(
                    'https://dev.to/$articleSlug',
                    mode: LaunchMode.externalApplication,
                  );
                },
                icon: SvgPicture.asset(
                  AppIcons.globe,
                  width: 20,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          // TODO(me): create a bottom navigation.
          body: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final articleInfo = ref.watch(articleInfoProvider(articleSlug));

              return articleInfo.when(
                data: (data) {
                  return _ArticleDetailsView(
                    articleDetails: data,
                    articleSlug: articleSlug,
                  );
                },
                error: (Object error, StackTrace stackTrace) {
                  return Text('Error: $error');
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _ArticleDetailsView extends StatefulWidget {
  const _ArticleDetailsView({
    required this.articleDetails,
    required this.articleSlug,
  });

  final ArticleDetailsModel articleDetails;
  final String articleSlug;

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
        padding: const EdgeInsets.only(bottom: 64),
        children: [
          ArticleInfo(
            title: widget.articleDetails.title,
            coverImage: widget.articleDetails.coverImage,
            tags: widget.articleDetails.tags,
            readingTime: widget.articleDetails.readingTimeMinutes.toString(),
            relativeDate:
                StringUtils.relativeDate(widget.articleDetails.createdAt),
          ),
          const SizedBox(height: 32),
          ArticleBody(
            slug: widget.articleSlug,
            scrollController: _articleDetailsScrollController,
          ),
          const SizedBox(height: 32),
          ArticleAuthors(
            author: widget.articleDetails.user,
            organization: widget.articleDetails.organization,
          ),
        ],
      ),
    );
  }
}
