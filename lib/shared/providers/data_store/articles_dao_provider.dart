import 'package:data_store/data_store.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final articlesDaoProvider = Provider<ArticlesDataStoreInterface>((ref) {
  final dataStore = ref.watch(dataStoreProvider);

  return dataStore.driftArticlesDao;
});
