// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_change_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppChangeItemModel _$AppChangeItemModelFromJson(Map<String, dynamic> json) {
  return _AppChangeItemModel.fromJson(json);
}

/// @nodoc
mixin _$AppChangeItemModel {
  AppChangeStatus? get status => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String>? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppChangeItemModelCopyWith<AppChangeItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppChangeItemModelCopyWith<$Res> {
  factory $AppChangeItemModelCopyWith(
          AppChangeItemModel value, $Res Function(AppChangeItemModel) then) =
      _$AppChangeItemModelCopyWithImpl<$Res, AppChangeItemModel>;
  @useResult
  $Res call({AppChangeStatus? status, String name, List<String>? content});
}

/// @nodoc
class _$AppChangeItemModelCopyWithImpl<$Res, $Val extends AppChangeItemModel>
    implements $AppChangeItemModelCopyWith<$Res> {
  _$AppChangeItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = null,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppChangeStatus?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppChangeItemModelCopyWith<$Res>
    implements $AppChangeItemModelCopyWith<$Res> {
  factory _$$_AppChangeItemModelCopyWith(_$_AppChangeItemModel value,
          $Res Function(_$_AppChangeItemModel) then) =
      __$$_AppChangeItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppChangeStatus? status, String name, List<String>? content});
}

/// @nodoc
class __$$_AppChangeItemModelCopyWithImpl<$Res>
    extends _$AppChangeItemModelCopyWithImpl<$Res, _$_AppChangeItemModel>
    implements _$$_AppChangeItemModelCopyWith<$Res> {
  __$$_AppChangeItemModelCopyWithImpl(
      _$_AppChangeItemModel _value, $Res Function(_$_AppChangeItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = null,
    Object? content = freezed,
  }) {
    return _then(_$_AppChangeItemModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppChangeStatus?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppChangeItemModel implements _AppChangeItemModel {
  const _$_AppChangeItemModel(
      {this.status, required this.name, final List<String>? content})
      : _content = content;

  factory _$_AppChangeItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppChangeItemModelFromJson(json);

  @override
  final AppChangeStatus? status;
  @override
  final String name;
  final List<String>? _content;
  @override
  List<String>? get content {
    final value = _content;
    if (value == null) return null;
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AppChangeItemModel(status: $status, name: $name, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppChangeItemModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, name, const DeepCollectionEquality().hash(_content));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppChangeItemModelCopyWith<_$_AppChangeItemModel> get copyWith =>
      __$$_AppChangeItemModelCopyWithImpl<_$_AppChangeItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppChangeItemModelToJson(
      this,
    );
  }
}

abstract class _AppChangeItemModel implements AppChangeItemModel {
  const factory _AppChangeItemModel(
      {final AppChangeStatus? status,
      required final String name,
      final List<String>? content}) = _$_AppChangeItemModel;

  factory _AppChangeItemModel.fromJson(Map<String, dynamic> json) =
      _$_AppChangeItemModel.fromJson;

  @override
  AppChangeStatus? get status;
  @override
  String get name;
  @override
  List<String>? get content;
  @override
  @JsonKey(ignore: true)
  _$$_AppChangeItemModelCopyWith<_$_AppChangeItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
