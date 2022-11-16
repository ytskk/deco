import 'package:dev_community/features/features.dart';

/// Represents a repository interface to get tags info.
abstract class TagsRepositoryInterface {
  /// Gets a list of tags.
  Future<List<TagModel>> getTags({int page, int perPage});
}
