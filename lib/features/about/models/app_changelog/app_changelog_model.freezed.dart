// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_changelog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppChangelogModel _$AppChangelogModelFromJson(Map<String, dynamic> json) {
  return _AppChangelogModel.fromJson(json);
}

/// @nodoc
mixin _$AppChangelogModel {
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  Color get color => throw _privateConstructorUsedError;
  List<AppChangeItemModel> get changes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppChangelogModelCopyWith<AppChangelogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppChangelogModelCopyWith<$Res> {
  factory $AppChangelogModelCopyWith(
          AppChangelogModel value, $Res Function(AppChangelogModel) then) =
      _$AppChangelogModelCopyWithImpl<$Res, AppChangelogModel>;
  @useResult
  $Res call(
      {String name,
      String icon,
      DateTime date,
      @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson) Color color,
      List<AppChangeItemModel> changes});
}

/// @nodoc
class _$AppChangelogModelCopyWithImpl<$Res, $Val extends AppChangelogModel>
    implements $AppChangelogModelCopyWith<$Res> {
  _$AppChangelogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? date = null,
    Object? color = null,
    Object? changes = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      changes: null == changes
          ? _value.changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<AppChangeItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppChangelogModelCopyWith<$Res>
    implements $AppChangelogModelCopyWith<$Res> {
  factory _$$_AppChangelogModelCopyWith(_$_AppChangelogModel value,
          $Res Function(_$_AppChangelogModel) then) =
      __$$_AppChangelogModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String icon,
      DateTime date,
      @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson) Color color,
      List<AppChangeItemModel> changes});
}

/// @nodoc
class __$$_AppChangelogModelCopyWithImpl<$Res>
    extends _$AppChangelogModelCopyWithImpl<$Res, _$_AppChangelogModel>
    implements _$$_AppChangelogModelCopyWith<$Res> {
  __$$_AppChangelogModelCopyWithImpl(
      _$_AppChangelogModel _value, $Res Function(_$_AppChangelogModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? date = null,
    Object? color = null,
    Object? changes = null,
  }) {
    return _then(_$_AppChangelogModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      changes: null == changes
          ? _value._changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<AppChangeItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppChangelogModel implements _AppChangelogModel {
  const _$_AppChangelogModel(
      {required this.name,
      required this.icon,
      required this.date,
      @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
          required this.color,
      required final List<AppChangeItemModel> changes})
      : _changes = changes;

  factory _$_AppChangelogModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppChangelogModelFromJson(json);

  @override
  final String name;
  @override
  final String icon;
  @override
  final DateTime date;
  @override
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color color;
  final List<AppChangeItemModel> _changes;
  @override
  List<AppChangeItemModel> get changes {
    if (_changes is EqualUnmodifiableListView) return _changes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_changes);
  }

  @override
  String toString() {
    return 'AppChangelogModel(name: $name, icon: $icon, date: $date, color: $color, changes: $changes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppChangelogModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other._changes, _changes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, icon, date, color,
      const DeepCollectionEquality().hash(_changes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppChangelogModelCopyWith<_$_AppChangelogModel> get copyWith =>
      __$$_AppChangelogModelCopyWithImpl<_$_AppChangelogModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppChangelogModelToJson(
      this,
    );
  }
}

abstract class _AppChangelogModel implements AppChangelogModel {
  const factory _AppChangelogModel(
      {required final String name,
      required final String icon,
      required final DateTime date,
      @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
          required final Color color,
      required final List<AppChangeItemModel> changes}) = _$_AppChangelogModel;

  factory _AppChangelogModel.fromJson(Map<String, dynamic> json) =
      _$_AppChangelogModel.fromJson;

  @override
  String get name;
  @override
  String get icon;
  @override
  DateTime get date;
  @override
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  Color get color;
  @override
  List<AppChangeItemModel> get changes;
  @override
  @JsonKey(ignore: true)
  _$$_AppChangelogModelCopyWith<_$_AppChangelogModel> get copyWith =>
      throw _privateConstructorUsedError;
}
