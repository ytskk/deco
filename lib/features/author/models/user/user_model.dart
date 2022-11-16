import 'package:dev_community/shared/shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String username,
    required String name,
    @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
        required String? twitterUsername,
    @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
        required String? githubUsername,
    String? summary,
    required String? location,
    @JsonKey(name: 'website_url', fromJson: nullIfEmptyString)
        required String? websiteUrl,
    @JsonKey(name: 'joined_at') required String joinedAt,
    @JsonKey(name: 'profile_image') required String profileImage,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
