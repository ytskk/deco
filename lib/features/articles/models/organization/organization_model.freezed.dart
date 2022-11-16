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

OrganizationQuickInfoModel _$OrganizationQuickInfoModelFromJson(
    Map<String, dynamic> json) {
  return _OrganizationModel.fromJson(json);
}

/// @nodoc
mixin _$OrganizationQuickInfoModel {
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationQuickInfoModelCopyWith<OrganizationQuickInfoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationQuickInfoModelCopyWith<$Res> {
  factory $OrganizationQuickInfoModelCopyWith(OrganizationQuickInfoModel value,
          $Res Function(OrganizationQuickInfoModel) then) =
      _$OrganizationQuickInfoModelCopyWithImpl<$Res,
          OrganizationQuickInfoModel>;
  @useResult
  $Res call(
      {String name,
      String username,
      @JsonKey(name: 'profile_image') String profileImage});
}

/// @nodoc
class _$OrganizationQuickInfoModelCopyWithImpl<$Res,
        $Val extends OrganizationQuickInfoModel>
    implements $OrganizationQuickInfoModelCopyWith<$Res> {
  _$OrganizationQuickInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? username = null,
    Object? profileImage = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
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
    implements $OrganizationQuickInfoModelCopyWith<$Res> {
  factory _$$_OrganizationModelCopyWith(_$_OrganizationModel value,
          $Res Function(_$_OrganizationModel) then) =
      __$$_OrganizationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String username,
      @JsonKey(name: 'profile_image') String profileImage});
}

/// @nodoc
class __$$_OrganizationModelCopyWithImpl<$Res>
    extends _$OrganizationQuickInfoModelCopyWithImpl<$Res, _$_OrganizationModel>
    implements _$$_OrganizationModelCopyWith<$Res> {
  __$$_OrganizationModelCopyWithImpl(
      _$_OrganizationModel _value, $Res Function(_$_OrganizationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? username = null,
    Object? profileImage = null,
  }) {
    return _then(_$_OrganizationModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
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
      {required this.name,
      required this.username,
      @JsonKey(name: 'profile_image') required this.profileImage});

  factory _$_OrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrganizationModelFromJson(json);

  @override
  final String name;
  @override
  final String username;
  @override
  @JsonKey(name: 'profile_image')
  final String profileImage;

  @override
  String toString() {
    return 'OrganizationQuickInfoModel(name: $name, username: $username, profileImage: $profileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrganizationModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, username, profileImage);

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

abstract class _OrganizationModel implements OrganizationQuickInfoModel {
  const factory _OrganizationModel(
          {required final String name,
          required final String username,
          @JsonKey(name: 'profile_image') required final String profileImage}) =
      _$_OrganizationModel;

  factory _OrganizationModel.fromJson(Map<String, dynamic> json) =
      _$_OrganizationModel.fromJson;

  @override
  String get name;
  @override
  String get username;
  @override
  @JsonKey(name: 'profile_image')
  String get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$_OrganizationModelCopyWith<_$_OrganizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
