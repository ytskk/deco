import 'dart:developer';

import 'package:dev_community/constants/app_icons.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrolls_to_top/scrolls_to_top.dart';
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

class ArticleDetailsPage extends StatelessWidget {
  const ArticleDetailsPage({
    super.key,
    required this.articlePath,
  });

  final String articlePath;

  @override
  Widget build(BuildContext context) {
    log('passing to provider path: $articlePath');
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(size: 20),
            toolbarHeight: 32,
            surfaceTintColor: Theme.of(context).colorScheme.background,
            actions: [
              IconButton(
                onPressed: () {
                  launchUrlString(
                    'https://dev.to$articlePath',
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
              final articleDetails =
                  ref.watch(articleDetailsControllerProvider(articlePath));

              return articleDetails.when(
                data: (articleDetails) {
                  return _ArticleDetailsView(articleDetails: articleDetails);
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
      },
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
