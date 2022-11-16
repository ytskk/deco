import 'dart:developer';

import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TagsSelectionPage extends StatelessWidget {
  const TagsSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 24, bottom: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            InfoList(
              title: AppStrings.tagsSelectionInfoTitle,
              description: AppStrings.tagsSelectionInfoDescription,
            ),
            SizedBox(height: 44),
            _TagsSelectionView(),
          ],
        ),
      ),
    );
  }
}

final tagsSelectionProvider =
    FutureProvider.autoDispose<List<TagModel>>((ref) async {
  final tags = ref.watch(tagsProvider.notifier);
  log('loading tags', name: 'TagsSelectionPage::tagsSelectionProvider');

  return tags.getTags();
});

class _TagsSelectionView extends ConsumerWidget {
  const _TagsSelectionView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(tagsSelectionProvider);

    return tags.when(
      data: (_) => const _TagsList(),
      error: (error, _) => const Center(
        child: Text('Cannot load tags'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
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

final filteredTagsProvider = Provider.autoDispose<List<TagModel>>((ref) {
  final tags = ref.watch(tagsProvider);
  final textSearch = ref.watch(textSearchProvider);

  return _filterByName(textSearch, tags);
});

class _TagsList extends ConsumerStatefulWidget {
  const _TagsList();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __TagsListState();
}

class __TagsListState extends ConsumerState<_TagsList> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tagsList = ref.watch(filteredTagsProvider);
    final tags = ref.watch(tagsProvider.notifier);

    return Column(
      children: [
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
        if (tagsList.isEmpty)
          Center(
            child: Column(
              children: [
                Text(
                  AppStrings.tagsSearchEmptyTitle,
                  style: theme.textTheme.bodyLarge?.bold,
                ),
                const SizedBox(height: 2),
                Text(
                  AppStrings.tagsSearchEmptySubtitle,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          )
        else
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            children: tagsList.map((tag) {
              return TagChip(
                key: ValueKey(tag.name),
                tag: tag,
                isSelected: tag.isSelected,
                onTap: () {
                  tags.toggleTagSelection(tag);
                },
              );
            }).toList(),
          ),
      ],
    );
  }
}
