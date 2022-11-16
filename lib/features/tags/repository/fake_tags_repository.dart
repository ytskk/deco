import 'package:dev_community/features/tags/tags.dart';

class FakeTagsRepository implements TagsRepositoryInterface {
  @override
  Future<List<TagModel>> getTags({
    int page = 1,
    int perPage = 10,
  }) async {
    final response = [
      {
        'bg_color_hex': '#f7df1e',
        'id': 6,
        'name': 'javascript',
        'text_color_hex': '#000000'
      },
      {
        'bg_color_hex': '#562765',
        'id': 8,
        'name': 'webdev',
        'text_color_hex': '#ffffff'
      },
    ];

    final tags = response.map(TagModel.fromJson).toList();

    return tags;
  }

  static List<TagModel> mockTags({int count = 1}) {
    final response = [
      {
        'bg_color_hex': '#f7df1e',
        'id': 6,
        'name': 'javascript',
        'text_color_hex': '#000000'
      },
      {
        'bg_color_hex': '#562765',
        'id': 8,
        'name': 'webdev',
        'text_color_hex': '#ffffff'
      },
    ];
    final tags = response.take(count).map(TagModel.fromJson).toList();

    return tags;
  }
}
