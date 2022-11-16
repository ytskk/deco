import 'package:dev_community/features/tags/tags.dart';
import 'package:dev_community/shared/providers/client_api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tagsRepositoryProvider = Provider<TagsRepositoryInterface>((ref) {
  final dio = ref.watch(clientApiProvider);

  return RemoteTagsRepository(dio: dio);
});
