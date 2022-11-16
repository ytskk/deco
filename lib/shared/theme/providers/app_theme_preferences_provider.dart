import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemePreferencesProvider =
    StateNotifierProvider<AppThemePreferencesNotifier, AppThemePreferences>(
        (ref) {
  final sharedUtility = ref.watch(sharedUtilityProvider);

  return AppThemePreferencesNotifier(sharedUtility);
});

class AppThemePreferencesNotifier extends StateNotifier<AppThemePreferences> {
  AppThemePreferencesNotifier(this.sharedUtility)
      : super(sharedUtility.appThemePreferences);

  final SharedUtility sharedUtility;

  // getters.
  ThemeMode get themeMode => state.themeMode;

  AppStyleType get appStyle => state.appStyleType;

  void updateAppThemePreferences(AppThemePreferences appThemePreferences) {
    state = appThemePreferences;
    sharedUtility.appThemePreferences = appThemePreferences;
  }

  void updateUseDimColors(bool useDimColors) {
    state = state.copyWith(useDimColors: useDimColors);
    sharedUtility.appThemePreferences = state;
  }

  void updateThemeMode(ThemeMode themeMode) {
    state = state.copyWith(themeMode: themeMode);
    sharedUtility.appThemePreferences = state;
  }

  void updateAppStyleType(AppStyleType appStyleType) {
    state = state.copyWith(appStyleType: appStyleType);
    sharedUtility.appThemePreferences = state;
  }

  bool isDarkMode() {
    return state.themeMode == ThemeMode.dark ||
        (state.themeMode == ThemeMode.system &&
            WidgetsBinding.instance.window.platformBrightness ==
                Brightness.dark);
  }
}
