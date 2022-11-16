// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int,
      username: json['username'] as String,
      name: json['name'] as String,
      twitterUsername: nullIfEmptyString(json['twitter_username'] as String?),
      githubUsername: nullIfEmptyString(json['github_username'] as String?),
      summary: json['summary'] as String?,
      location: json['location'] as String?,
      websiteUrl: nullIfEmptyString(json['website_url'] as String?),
      joinedAt: json['joined_at'] as String,
      profileImage: json['profile_image'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'twitter_username': instance.twitterUsername,
      'github_username': instance.githubUsername,
      'summary': instance.summary,
      'location': instance.location,
      'website_url': instance.websiteUrl,
      'joined_at': instance.joinedAt,
      'profile_image': instance.profileImage,
    };
