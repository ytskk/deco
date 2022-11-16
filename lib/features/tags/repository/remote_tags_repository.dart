import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/features/features.dart';
import 'package:dio/dio.dart';

/// {@template remote_tags_repository}
///
/// Represents a remote repository to get tags info.
///
/// Uses [Dio] to make HTTP requests.
///
/// {@endtemplate}
class RemoteTagsRepository implements TagsRepositoryInterface {
  /// {@macro remote_tags_repository}
  const RemoteTagsRepository({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<TagModel>> getTags({
    int page = 1,
    int perPage = 10,
  }) async {
    final response = await _dio.get(
      ApiConstants.tags,
      queryParameters: {
        'page': page,
        'per_page': perPage,
      },
    );

    final tags = response.data as List;

    return tags.map((tag) => TagModel.fromJson(tag)).toList();
  }
}
