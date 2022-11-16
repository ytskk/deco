// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrganizationModel _$$_OrganizationModelFromJson(Map<String, dynamic> json) =>
    _$_OrganizationModel(
      id: json['id'] as int,
      username: json['username'] as String,
      name: json['name'] as String,
      summary: nullIfEmptyString(json['summary'] as String?),
      twitterUsername: nullIfEmptyString(json['twitter_username'] as String?),
      githubUsername: nullIfEmptyString(json['github_username'] as String?),
      url: json['url'] as String,
      location: nullIfEmptyString(json['location'] as String?),
      techStack: nullIfEmptyString(json['tech_stack'] as String?),
      tagLine: nullIfEmptyString(json['tag_line'] as String?),
      story: nullIfEmptyString(json['story'] as String?),
      joinedAt: json['joined_at'] as String,
      profileImage: json['profile_image'] as String,
    );

Map<String, dynamic> _$$_OrganizationModelToJson(
        _$_OrganizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'summary': instance.summary,
      'twitter_username': instance.twitterUsername,
      'github_username': instance.githubUsername,
      'url': instance.url,
      'location': instance.location,
      'tech_stack': instance.techStack,
      'tag_line': instance.tagLine,
      'story': instance.story,
      'joined_at': instance.joinedAt,
      'profile_image': instance.profileImage,
    };
