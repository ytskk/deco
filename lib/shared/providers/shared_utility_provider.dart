import 'dart:convert';
import 'dart:developer';

import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);

  return SharedUtility(sharedPreferences: sharedPreferences);
});

class SharedUtility {
  const SharedUtility({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  // app theme preferences
  String get appThemePreferencesString =>
      _sharedPreferences.getString('appThemePreferences') ?? '';

  AppThemePreferences get appThemePreferences {
    final appThemePreferencesString = this.appThemePreferencesString;

    if (appThemePreferencesString.isEmpty) {
      return AppThemePreferences.initial();
    }

    return AppThemePreferences.fromJson(
      jsonDecode(appThemePreferencesString) as Map<String, dynamic>,
    );
  }

  set appThemePreferences(AppThemePreferences appThemePreferences) {
    final jsonString = jsonEncode(appThemePreferences.toJson());

    _sharedPreferences.setString('appThemePreferences', jsonString);
  }

  // tags
  String get tagsString => _sharedPreferences.getString('tags') ?? '';

  /// Returns selected tags.
  List<TagModel> get savedTags {
    final tagsString = this.tagsString;

    if (tagsString.isEmpty) {
      return [];
    }

    final tagsJson = jsonDecode(tagsString) as List;

    return tagsJson.map((tag) => TagModel.fromJson(tag)).toList();
  }

  set savedTags(List<TagModel> tags) {
    final jsonString = jsonEncode(tags.map((tag) => tag.toJson()).toList());

    _sharedPreferences.setString('tags', jsonString);
  }
}
