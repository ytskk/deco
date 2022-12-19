// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
  String? get twitterUsername => throw _privateConstructorUsedError;
  @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
  String? get githubUsername => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'website_url', fromJson: nullIfEmptyString)
  String? get websiteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'joined_at')
  String get joinedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int id,
      String username,
      String name,
      @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
          String? twitterUsername,
      @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
          String? githubUsername,
      String? summary,
      String? location,
      @JsonKey(name: 'website_url', fromJson: nullIfEmptyString)
          String? websiteUrl,
      @JsonKey(name: 'joined_at')
          String joinedAt,
      @JsonKey(name: 'profile_image')
          String profileImage});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = null,
    Object? twitterUsername = freezed,
    Object? githubUsername = freezed,
    Object? summary = freezed,
    Object? location = freezed,
    Object? websiteUrl = freezed,
    Object? joinedAt = null,
    Object? profileImage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      twitterUsername: freezed == twitterUsername
          ? _value.twitterUsername
          : twitterUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      githubUsername: freezed == githubUsername
          ? _value.githubUsername
          : githubUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String username,
      String name,
      @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
          String? twitterUsername,
      @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
          String? githubUsername,
      String? summary,
      String? location,
      @JsonKey(name: 'website_url', fromJson: nullIfEmptyString)
          String? websiteUrl,
      @JsonKey(name: 'joined_at')
          String joinedAt,
      @JsonKey(name: 'profile_image')
          String profileImage});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = null,
    Object? twitterUsername = freezed,
    Object? githubUsername = freezed,
    Object? summary = freezed,
    Object? location = freezed,
    Object? websiteUrl = freezed,
    Object? joinedAt = null,
    Object? profileImage = null,
  }) {
    return _then(_$_UserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      twitterUsername: freezed == twitterUsername
          ? _value.twitterUsername
          : twitterUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      githubUsername: freezed == githubUsername
          ? _value.githubUsername
          : githubUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {required this.id,
      required this.username,
      required this.name,
      @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
          required this.twitterUsername,
      @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
          required this.githubUsername,
      this.summary,
      required this.location,
      @JsonKey(name: 'website_url', fromJson: nullIfEmptyString)
          required this.websiteUrl,
      @JsonKey(name: 'joined_at')
          required this.joinedAt,
      @JsonKey(name: 'profile_image')
          required this.profileImage});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String name;
  @override
  @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
  final String? twitterUsername;
  @override
  @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
  final String? githubUsername;
  @override
  final String? summary;
  @override
  final String? location;
  @override
  @JsonKey(name: 'website_url', fromJson: nullIfEmptyString)
  final String? websiteUrl;
  @override
  @JsonKey(name: 'joined_at')
  final String joinedAt;
  @override
  @JsonKey(name: 'profile_image')
  final String profileImage;

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, name: $name, twitterUsername: $twitterUsername, githubUsername: $githubUsername, summary: $summary, location: $location, websiteUrl: $websiteUrl, joinedAt: $joinedAt, profileImage: $profileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.twitterUsername, twitterUsername) ||
                other.twitterUsername == twitterUsername) &&
            (identical(other.githubUsername, githubUsername) ||
                other.githubUsername == githubUsername) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      name,
      twitterUsername,
      githubUsername,
      summary,
      location,
      websiteUrl,
      joinedAt,
      profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final int id,
      required final String username,
      required final String name,
      @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
          required final String? twitterUsername,
      @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
          required final String? githubUsername,
      final String? summary,
      required final String? location,
      @JsonKey(name: 'website_url', fromJson: nullIfEmptyString)
          required final String? websiteUrl,
      @JsonKey(name: 'joined_at')
          required final String joinedAt,
      @JsonKey(name: 'profile_image')
          required final String profileImage}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get name;
  @override
  @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
  String? get twitterUsername;
  @override
  @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
  String? get githubUsername;
  @override
  String? get summary;
  @override
  String? get location;
  @override
  @JsonKey(name: 'website_url', fromJson: nullIfEmptyString)
  String? get websiteUrl;
  @override
  @JsonKey(name: 'joined_at')
  String get joinedAt;
  @override
  @JsonKey(name: 'profile_image')
  String get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
