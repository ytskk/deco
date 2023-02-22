import 'dart:developer';

import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class TagsSelectionPage extends StatelessWidget {
  const TagsSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 44),
            sliver: SliverToBoxAdapter(
              child: InfoList(
                title: AppStrings.tagsSelectionInfoTitle,
                description: AppStrings.tagsSelectionInfoDescription,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: _TagsSelectionView(),
          ),
          _TagsList(),
        ],
      ),
    );
  }
}

class _TagsList extends StatelessWidget {
  const _TagsList();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final textSearch = ref.watch(textSearchProvider);
        final filteredTags = ref.watch(filteredTagsProvider);
        final tags = ref.read(tagsProvider.notifier);

        return SliverInfiniteList(
          isLoading: filteredTags.isLoading,
          hasError: filteredTags.hasError,
          hasReachedMax: filteredTags.hasReachedMax,
          itemCount: filteredTags.data!.length,
          onFetchData: () {
            if (textSearch.isEmpty) {
              tags.getTags();
            }
          },
          loadingBuilder: (context) => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          errorBuilder: (context) => const Center(
            child: Text('Error'),
          ),
          emptyBuilder: (context) => const Center(
            child: InfoList(
              title: AppStrings.tagsSearchEmptyTitle,
              description: AppStrings.tagsSearchEmptySubtitle,
            ),
          ),
          itemBuilder: (context, index) {
            final tag = filteredTags.data![index];

            return TagTileItem(
              key: ValueKey(tag.id),
              tag: tag,
              onTap: () {
                tags.toggleTagSelection(tag);
              },
            );
          },
        );
      },
    );
  }
}

class TagTileItem extends StatelessWidget {
  const TagTileItem({
    super.key,
    required this.tag,
    this.onTap,
  });

  final TagModel tag;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.colorScheme.primary;

    return ListTile(
      onTap: onTap,
      title: Text(
        tag.name.toCapitalized(),
        style: theme.textTheme.bodySmall,
      ),
      minLeadingWidth: 8,
      trailing: RotatingSwitcher(
        showFirst: tag.isSelected,
        firstChild: Icon(
          Icons.check_box_rounded,
          key: const ValueKey('icon1'),
          color: iconColor,
        ),
        secondChild: Icon(
          Icons.check_box_outline_blank_rounded,
          key: const ValueKey('icon2'),
          color: iconColor,
        ),
      ),
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}

class _TagsSelectionView extends ConsumerStatefulWidget {
  const _TagsSelectionView();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __TagsSelectionViewState();
}

class __TagsSelectionViewState extends ConsumerState<_TagsSelectionView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: AdaptiveSearchField(
              controller: _searchController,
              onChanged: (value) {
                ref.read(textSearchProvider.notifier).update((state) => value);
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

List<TagModel> _filterByName(String query, List<TagModel> tags) {
  return tags
      .where((tag) => tag.name.toLowerCase().contains(query.toLowerCase()))
      .toList();
}

final textSearchProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final filteredTagsProvider =
    Provider.autoDispose<LoadingDataModel<List<TagModel>>>((ref) {
  final tags = ref.watch(tagsProvider);
  final textSearch = ref.watch(textSearchProvider);

  return tags.copyWith(
    data: _filterByName(textSearch, tags.data ?? []),
  );
});
