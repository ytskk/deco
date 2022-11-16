// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'organization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrganizationModel _$OrganizationModelFromJson(Map<String, dynamic> json) {
  return _OrganizationModel.fromJson(json);
}

/// @nodoc
mixin _$OrganizationModel {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary', fromJson: nullIfEmptyString)
  String? get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
  String? get twitterUsername => throw _privateConstructorUsedError;
  @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
  String? get githubUsername => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'location', fromJson: nullIfEmptyString)
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'tech_stack', fromJson: nullIfEmptyString)
  String? get techStack => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_line', fromJson: nullIfEmptyString)
  String? get tagLine => throw _privateConstructorUsedError;
  @JsonKey(name: 'story', fromJson: nullIfEmptyString)
  String? get story => throw _privateConstructorUsedError;
  @JsonKey(name: 'joined_at')
  String get joinedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationModelCopyWith<OrganizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationModelCopyWith<$Res> {
  factory $OrganizationModelCopyWith(
          OrganizationModel value, $Res Function(OrganizationModel) then) =
      _$OrganizationModelCopyWithImpl<$Res, OrganizationModel>;
  @useResult
  $Res call(
      {int id,
      String username,
      String name,
      @JsonKey(name: 'summary', fromJson: nullIfEmptyString)
          String? summary,
      @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
          String? twitterUsername,
      @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
          String? githubUsername,
      String url,
      @JsonKey(name: 'location', fromJson: nullIfEmptyString)
          String? location,
      @JsonKey(name: 'tech_stack', fromJson: nullIfEmptyString)
          String? techStack,
      @JsonKey(name: 'tag_line', fromJson: nullIfEmptyString)
          String? tagLine,
      @JsonKey(name: 'story', fromJson: nullIfEmptyString)
          String? story,
      @JsonKey(name: 'joined_at')
          String joinedAt,
      @JsonKey(name: 'profile_image')
          String profileImage});
}

/// @nodoc
class _$OrganizationModelCopyWithImpl<$Res, $Val extends OrganizationModel>
    implements $OrganizationModelCopyWith<$Res> {
  _$OrganizationModelCopyWithImpl(this._value, this._then);

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
    Object? summary = freezed,
    Object? twitterUsername = freezed,
    Object? githubUsername = freezed,
    Object? url = null,
    Object? location = freezed,
    Object? techStack = freezed,
    Object? tagLine = freezed,
    Object? story = freezed,
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
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      twitterUsername: freezed == twitterUsername
          ? _value.twitterUsername
          : twitterUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      githubUsername: freezed == githubUsername
          ? _value.githubUsername
          : githubUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      techStack: freezed == techStack
          ? _value.techStack
          : techStack // ignore: cast_nullable_to_non_nullable
              as String?,
      tagLine: freezed == tagLine
          ? _value.tagLine
          : tagLine // ignore: cast_nullable_to_non_nullable
              as String?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_OrganizationModelCopyWith<$Res>
    implements $OrganizationModelCopyWith<$Res> {
  factory _$$_OrganizationModelCopyWith(_$_OrganizationModel value,
          $Res Function(_$_OrganizationModel) then) =
      __$$_OrganizationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String username,
      String name,
      @JsonKey(name: 'summary', fromJson: nullIfEmptyString)
          String? summary,
      @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
          String? twitterUsername,
      @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
          String? githubUsername,
      String url,
      @JsonKey(name: 'location', fromJson: nullIfEmptyString)
          String? location,
      @JsonKey(name: 'tech_stack', fromJson: nullIfEmptyString)
          String? techStack,
      @JsonKey(name: 'tag_line', fromJson: nullIfEmptyString)
          String? tagLine,
      @JsonKey(name: 'story', fromJson: nullIfEmptyString)
          String? story,
      @JsonKey(name: 'joined_at')
          String joinedAt,
      @JsonKey(name: 'profile_image')
          String profileImage});
}

/// @nodoc
class __$$_OrganizationModelCopyWithImpl<$Res>
    extends _$OrganizationModelCopyWithImpl<$Res, _$_OrganizationModel>
    implements _$$_OrganizationModelCopyWith<$Res> {
  __$$_OrganizationModelCopyWithImpl(
      _$_OrganizationModel _value, $Res Function(_$_OrganizationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = null,
    Object? summary = freezed,
    Object? twitterUsername = freezed,
    Object? githubUsername = freezed,
    Object? url = null,
    Object? location = freezed,
    Object? techStack = freezed,
    Object? tagLine = freezed,
    Object? story = freezed,
    Object? joinedAt = null,
    Object? profileImage = null,
  }) {
    return _then(_$_OrganizationModel(
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
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      twitterUsername: freezed == twitterUsername
          ? _value.twitterUsername
          : twitterUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      githubUsername: freezed == githubUsername
          ? _value.githubUsername
          : githubUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      techStack: freezed == techStack
          ? _value.techStack
          : techStack // ignore: cast_nullable_to_non_nullable
              as String?,
      tagLine: freezed == tagLine
          ? _value.tagLine
          : tagLine // ignore: cast_nullable_to_non_nullable
              as String?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
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
class _$_OrganizationModel implements _OrganizationModel {
  const _$_OrganizationModel(
      {required this.id,
      required this.username,
      required this.name,
      @JsonKey(name: 'summary', fromJson: nullIfEmptyString)
          this.summary,
      @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
          this.twitterUsername,
      @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
          this.githubUsername,
      required this.url,
      @JsonKey(name: 'location', fromJson: nullIfEmptyString)
          required this.location,
      @JsonKey(name: 'tech_stack', fromJson: nullIfEmptyString)
          this.techStack,
      @JsonKey(name: 'tag_line', fromJson: nullIfEmptyString)
          this.tagLine,
      @JsonKey(name: 'story', fromJson: nullIfEmptyString)
          this.story,
      @JsonKey(name: 'joined_at')
          required this.joinedAt,
      @JsonKey(name: 'profile_image')
          required this.profileImage});

  factory _$_OrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrganizationModelFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String name;
  @override
  @JsonKey(name: 'summary', fromJson: nullIfEmptyString)
  final String? summary;
  @override
  @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
  final String? twitterUsername;
  @override
  @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
  final String? githubUsername;
  @override
  final String url;
  @override
  @JsonKey(name: 'location', fromJson: nullIfEmptyString)
  final String? location;
  @override
  @JsonKey(name: 'tech_stack', fromJson: nullIfEmptyString)
  final String? techStack;
  @override
  @JsonKey(name: 'tag_line', fromJson: nullIfEmptyString)
  final String? tagLine;
  @override
  @JsonKey(name: 'story', fromJson: nullIfEmptyString)
  final String? story;
  @override
  @JsonKey(name: 'joined_at')
  final String joinedAt;
  @override
  @JsonKey(name: 'profile_image')
  final String profileImage;

  @override
  String toString() {
    return 'OrganizationModel(id: $id, username: $username, name: $name, summary: $summary, twitterUsername: $twitterUsername, githubUsername: $githubUsername, url: $url, location: $location, techStack: $techStack, tagLine: $tagLine, story: $story, joinedAt: $joinedAt, profileImage: $profileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganizationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.twitterUsername, twitterUsername) ||
                other.twitterUsername == twitterUsername) &&
            (identical(other.githubUsername, githubUsername) ||
                other.githubUsername == githubUsername) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.techStack, techStack) ||
                other.techStack == techStack) &&
            (identical(other.tagLine, tagLine) || other.tagLine == tagLine) &&
            (identical(other.story, story) || other.story == story) &&
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
      summary,
      twitterUsername,
      githubUsername,
      url,
      location,
      techStack,
      tagLine,
      story,
      joinedAt,
      profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrganizationModelCopyWith<_$_OrganizationModel> get copyWith =>
      __$$_OrganizationModelCopyWithImpl<_$_OrganizationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrganizationModelToJson(
      this,
    );
  }
}

abstract class _OrganizationModel implements OrganizationModel {
  const factory _OrganizationModel(
      {required final int id,
      required final String username,
      required final String name,
      @JsonKey(name: 'summary', fromJson: nullIfEmptyString)
          final String? summary,
      @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
          final String? twitterUsername,
      @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
          final String? githubUsername,
      required final String url,
      @JsonKey(name: 'location', fromJson: nullIfEmptyString)
          required final String? location,
      @JsonKey(name: 'tech_stack', fromJson: nullIfEmptyString)
          final String? techStack,
      @JsonKey(name: 'tag_line', fromJson: nullIfEmptyString)
          final String? tagLine,
      @JsonKey(name: 'story', fromJson: nullIfEmptyString)
          final String? story,
      @JsonKey(name: 'joined_at')
          required final String joinedAt,
      @JsonKey(name: 'profile_image')
          required final String profileImage}) = _$_OrganizationModel;

  factory _OrganizationModel.fromJson(Map<String, dynamic> json) =
      _$_OrganizationModel.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get name;
  @override
  @JsonKey(name: 'summary', fromJson: nullIfEmptyString)
  String? get summary;
  @override
  @JsonKey(name: 'twitter_username', fromJson: nullIfEmptyString)
  String? get twitterUsername;
  @override
  @JsonKey(name: 'github_username', fromJson: nullIfEmptyString)
  String? get githubUsername;
  @override
  String get url;
  @override
  @JsonKey(name: 'location', fromJson: nullIfEmptyString)
  String? get location;
  @override
  @JsonKey(name: 'tech_stack', fromJson: nullIfEmptyString)
  String? get techStack;
  @override
  @JsonKey(name: 'tag_line', fromJson: nullIfEmptyString)
  String? get tagLine;
  @override
  @JsonKey(name: 'story', fromJson: nullIfEmptyString)
  String? get story;
  @override
  @JsonKey(name: 'joined_at')
  String get joinedAt;
  @override
  @JsonKey(name: 'profile_image')
  String get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$_OrganizationModelCopyWith<_$_OrganizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
