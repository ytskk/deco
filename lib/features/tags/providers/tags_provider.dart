import 'dart:developer';

import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tagsProvider =
    StateNotifierProvider<TagNotifier, LoadingDataModel<List<TagModel>>>(
  (ref) {
    final tagsRepository = ref.watch(tagsRepositoryProvider);
    final sharedUtility = ref.watch(sharedUtilityProvider);

    return TagNotifier(
      ref,
      tagsRepository: tagsRepository,
      sharedUtility: sharedUtility,
    );
  },
);

class TagNotifier extends StateNotifier<LoadingDataModel<List<TagModel>>> {
  TagNotifier(
    this.ref, {
    required TagsRepositoryInterface tagsRepository,
    required SharedUtility sharedUtility,
  })  : _tagsRepository = tagsRepository,
        _sharedUtility = sharedUtility,
        super(
          const LoadingDataModel(
            defaultValue: [],
          ),
        ) {
    getSelectedTags();
  }

  final TagsRepositoryInterface _tagsRepository;
  final SharedUtility _sharedUtility;
  final Ref ref;
  int page = 1;

  List<TagModel> getSelectedTags() {
    log('getting tags again');
    final savedTags = _sharedUtility.savedTags;

    return savedTags;
  }

  void _updateSavedTags() {
    final selectedTags = state.data!.where((tag) => tag.isSelected).toList();

    _sharedUtility.savedTags = selectedTags;
    ref.read(selectedTagsProvider.notifier).update((state) => selectedTags);
  }

  /// Fetches tags, if tags in selected, updates isSelected to true.
  Future<void> getTags({
    int perPage = 20,
  }) async {
    log(
      'loading tags for page $page',
      name: 'TagNotifier::getTags',
    );

    state = state.copyWith(isLoading: true);
    if (page == 1) {
      perPage = 200;
    }

    final tags = await _tagsRepository.getTags(
      page: page,
      perPage: perPage,
    );

    final selectedTags = getSelectedTags();

    final updatedTags = tags.map((tag) {
      final isTagSaved = selectedTags.any(
        (selectedTag) => selectedTag.id == tag.id,
      );

      return tag.copyWith(isSelected: isTagSaved);
    }).toList();

    state = state.copyWith(
      isLoading: false,
      data: (state.data ?? []) + updatedTags,
    );

    page += 1;
  }

  Future<bool> isTagSelected(String name) async {
    final selectedTags = getSelectedTags();

    return selectedTags.any(
      (selectedTag) => selectedTag.name == name,
    );
  }

  void toggleTagSelection(TagModel tag) {
    final newTag = tag.copyWith(isSelected: !tag.isSelected);
    final newState = state.copyWith(
      data: state.data!.map(
        (t) {
          if (t.id == tag.id) {
            return newTag;
          }
          return t;
        },
      ).toList(),
    );

    log('updating ${newTag.name} to ${newTag.isSelected}');

    state = newState;
    _updateSavedTags();
  }
}
