import 'package:dev_community/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  AppThemeData({
    AppStyleType appStyleType = AppStyleType.standard,
    AppStyle? style,
  }) : appStyle = style ?? AppStyle.fromType(appStyleType);

  final AppStyle appStyle;

  ThemeData _themeData({
    Brightness brightness = Brightness.light,
    required AppStyle style,
  }) {
    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      scaffoldBackgroundColor: style.colorScheme?.background,
      toggleableActiveColor: style.colorScheme?.primary,
      colorScheme: style.colorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: style.elevatedButtonStyle,
      ),
      cardTheme: style.cardTheme,
      dividerTheme: style.dividerTheme,
      textTheme: style.textTheme,
      chipTheme: style.chipTheme,
      // tmp
      appBarTheme: AppBarTheme(
        color: style.colorScheme?.background,
        surfaceTintColor: style.colorScheme?.background,
      ),
      tabBarTheme: style.tabBarTheme,
    );
  }

  ThemeData light() => _themeData(
        style: appStyle.light,
      );

  ThemeData dark([bool useDimColors = false]) => useDimColors
      ? dim()
      : _themeData(
          brightness: Brightness.dark,
          style: appStyle.dark,
        );

  ThemeData dim() => _themeData(
        brightness: Brightness.dark,
        style: appStyle.dim,
      );
}
