// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppThemePreferences _$$_AppThemePreferencesFromJson(
        Map<String, dynamic> json) =>
    _$_AppThemePreferences(
      useDimColors: json['useDimColors'] as bool,
      themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
      appStyleType: $enumDecode(_$AppStyleTypeEnumMap, json['appStyleType']),
    );

Map<String, dynamic> _$$_AppThemePreferencesToJson(
        _$_AppThemePreferences instance) =>
    <String, dynamic>{
      'useDimColors': instance.useDimColors,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'appStyleType': _$AppStyleTypeEnumMap[instance.appStyleType]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$AppStyleTypeEnumMap = {
  AppStyleType.standard: 'standard',
  AppStyleType.devto: 'devto',
  AppStyleType.reddish: 'reddish',
};
