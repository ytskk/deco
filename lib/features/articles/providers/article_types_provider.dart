import 'package:dev_community/features/features.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final articleTypesProvider = StateProvider<List<String>>((ref) {
  final selectedTags = ref.watch(selectedTagsProvider);

  final articleTypes = <String>[
    'popular',
    'latest',
    ...selectedTags.map((tag) => tag.name),
  ];

  return articleTypes;
});
