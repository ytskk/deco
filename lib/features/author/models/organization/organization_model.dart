import 'package:dev_community/shared/shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_model.freezed.dart';
part 'organization_model.g.dart';

@freezed
class OrganizationModel with _$OrganizationModel {
  const factory OrganizationModel({
    required int id,
    required String username,
    required String name,
    @JsonKey(name: 'summary', fromJson: nullIfEmptyString) String? summary,
    @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
        String? twitterUsername,
    @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
        String? githubUsername,
    required String url,
    @JsonKey(name: 'location', fromJson: nullIfEmptyString)
        required String? location,
    @JsonKey(name: 'tech_stack', fromJson: nullIfEmptyString) String? techStack,
    @JsonKey(name: 'tag_line', fromJson: nullIfEmptyString) String? tagLine,
    @JsonKey(name: 'story', fromJson: nullIfEmptyString) String? story,
    @JsonKey(name: 'joined_at') required String joinedAt,
    @JsonKey(name: 'profile_image') required String profileImage,
  }) = _OrganizationModel;

  factory OrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizationModelFromJson(json);
}
