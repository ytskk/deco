import 'dart:developer';

import 'package:dev_community/features/features.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedTagsProvider = StateProvider<List<TagModel>>(
  (ref) {
    final tags = ref.read(tagsProvider.notifier);
    log('selected tags: ${tags.getSelectedTags().length}');

    return tags.getSelectedTags();
  },
);
