import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme_preferences.freezed.dart';
part 'app_theme_preferences.g.dart';

@freezed
class AppThemePreferences with _$AppThemePreferences {
  const factory AppThemePreferences({
    required bool useDimColors,
    required ThemeMode themeMode,
    required AppStyleType appStyleType,
  }) = _AppThemePreferences;

  factory AppThemePreferences.fromJson(Map<String, dynamic> json) =>
      _$AppThemePreferencesFromJson(json);

  factory AppThemePreferences.initial() => const AppThemePreferences(
        useDimColors: false,
        themeMode: ThemeMode.system,
        appStyleType: AppStyleType.devto,
      );
}
