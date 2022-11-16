// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['user_id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      profileImage: json['profile_image'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'profile_image': instance.profileImage,
    };
