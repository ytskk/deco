import 'package:dev_community/features/about/models/app_changelog_mock.dart';
import 'package:dev_community/features/features.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentVersionProvider = StateProvider<AppChangelogModel>((ref) {
  return AppChangelogModel.fromJson(changelogMock.last);
});
