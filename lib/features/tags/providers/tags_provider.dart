import 'dart:developer';

import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/providers/shared_utility_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tagsProvider = StateNotifierProvider<TagNotifier, List<TagModel>>(
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

class TagNotifier extends StateNotifier<List<TagModel>> {
  TagNotifier(
    this.ref, {
    required TagsRepositoryInterface tagsRepository,
    required SharedUtility sharedUtility,
  })  : _tagsRepository = tagsRepository,
        _sharedUtility = sharedUtility,
        super([]) {
    getSelectedTags();
  }

  final TagsRepositoryInterface _tagsRepository;
  final SharedUtility _sharedUtility;
  final Ref ref;

  List<TagModel> getSelectedTags() {
    log('getting tags again');
    final savedTags = _sharedUtility.savedTags;

    return savedTags;
  }

  void _updateSavedTags() {
    final selectedTags = state.where((tag) => tag.isSelected).toList();

    _sharedUtility.savedTags = selectedTags;
    ref.read(selectedTagsProvider.notifier).update((state) => selectedTags);
  }

  /// Returns all fetched tags, if tags in selected, updates isSelected to true.
  Future<List<TagModel>> getTags({
    int page = 1,
    int perPage = 200,
  }) async {
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

    state = updatedTags;

    return state;
  }

  void toggleTagSelection(TagModel tag) {
    final newTag = tag.copyWith(isSelected: !tag.isSelected);
    final newState = state.map(
      (t) {
        if (t.id == tag.id) {
          return newTag;
        }
        return t;
      },
    ).toList();

    log('updating ${newTag.name} to ${newTag.isSelected}');

    state = newState;
    _updateSavedTags();
  }
}
