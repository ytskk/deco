import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/providers/client_api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final articlesRepositoryProvider = Provider<ArticlesRepositoryInterface>(
  (ref) {
    final dio = ref.watch(clientApiProvider);

    return RemoteArticlesRepository(dio: dio);
  },
);
