// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppThemePreferences _$AppThemePreferencesFromJson(Map<String, dynamic> json) {
  return _AppThemePreferences.fromJson(json);
}

/// @nodoc
mixin _$AppThemePreferences {
  bool get useDimColors => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  AppStyleType get appStyleType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppThemePreferencesCopyWith<AppThemePreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppThemePreferencesCopyWith<$Res> {
  factory $AppThemePreferencesCopyWith(
          AppThemePreferences value, $Res Function(AppThemePreferences) then) =
      _$AppThemePreferencesCopyWithImpl<$Res, AppThemePreferences>;
  @useResult
  $Res call(
      {bool useDimColors, ThemeMode themeMode, AppStyleType appStyleType});
}

/// @nodoc
class _$AppThemePreferencesCopyWithImpl<$Res, $Val extends AppThemePreferences>
    implements $AppThemePreferencesCopyWith<$Res> {
  _$AppThemePreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useDimColors = null,
    Object? themeMode = null,
    Object? appStyleType = null,
  }) {
    return _then(_value.copyWith(
      useDimColors: null == useDimColors
          ? _value.useDimColors
          : useDimColors // ignore: cast_nullable_to_non_nullable
              as bool,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      appStyleType: null == appStyleType
          ? _value.appStyleType
          : appStyleType // ignore: cast_nullable_to_non_nullable
              as AppStyleType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppThemePreferencesCopyWith<$Res>
    implements $AppThemePreferencesCopyWith<$Res> {
  factory _$$_AppThemePreferencesCopyWith(_$_AppThemePreferences value,
          $Res Function(_$_AppThemePreferences) then) =
      __$$_AppThemePreferencesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool useDimColors, ThemeMode themeMode, AppStyleType appStyleType});
}

/// @nodoc
class __$$_AppThemePreferencesCopyWithImpl<$Res>
    extends _$AppThemePreferencesCopyWithImpl<$Res, _$_AppThemePreferences>
    implements _$$_AppThemePreferencesCopyWith<$Res> {
  __$$_AppThemePreferencesCopyWithImpl(_$_AppThemePreferences _value,
      $Res Function(_$_AppThemePreferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useDimColors = null,
    Object? themeMode = null,
    Object? appStyleType = null,
  }) {
    return _then(_$_AppThemePreferences(
      useDimColors: null == useDimColors
          ? _value.useDimColors
          : useDimColors // ignore: cast_nullable_to_non_nullable
              as bool,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      appStyleType: null == appStyleType
          ? _value.appStyleType
          : appStyleType // ignore: cast_nullable_to_non_nullable
              as AppStyleType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppThemePreferences implements _AppThemePreferences {
  const _$_AppThemePreferences(
      {required this.useDimColors,
      required this.themeMode,
      required this.appStyleType});

  factory _$_AppThemePreferences.fromJson(Map<String, dynamic> json) =>
      _$$_AppThemePreferencesFromJson(json);

  @override
  final bool useDimColors;
  @override
  final ThemeMode themeMode;
  @override
  final AppStyleType appStyleType;

  @override
  String toString() {
    return 'AppThemePreferences(useDimColors: $useDimColors, themeMode: $themeMode, appStyleType: $appStyleType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppThemePreferences &&
            (identical(other.useDimColors, useDimColors) ||
                other.useDimColors == useDimColors) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.appStyleType, appStyleType) ||
                other.appStyleType == appStyleType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, useDimColors, themeMode, appStyleType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppThemePreferencesCopyWith<_$_AppThemePreferences> get copyWith =>
      __$$_AppThemePreferencesCopyWithImpl<_$_AppThemePreferences>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppThemePreferencesToJson(
      this,
    );
  }
}

abstract class _AppThemePreferences implements AppThemePreferences {
  const factory _AppThemePreferences(
      {required final bool useDimColors,
      required final ThemeMode themeMode,
      required final AppStyleType appStyleType}) = _$_AppThemePreferences;

  factory _AppThemePreferences.fromJson(Map<String, dynamic> json) =
      _$_AppThemePreferences.fromJson;

  @override
  bool get useDimColors;
  @override
  ThemeMode get themeMode;
  @override
  AppStyleType get appStyleType;
  @override
  @JsonKey(ignore: true)
  _$$_AppThemePreferencesCopyWith<_$_AppThemePreferences> get copyWith =>
      throw _privateConstructorUsedError;
}
