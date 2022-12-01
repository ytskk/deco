import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';

class AppStyleDeco extends AppStyle {
  const AppStyleDeco() : super(appStyleType: AppStyleType.deco);

  String get _primaryFontFamily => 'Avenir Next';
  String get _displayFontFamily => 'Playfair Display';

  TextStyle get _baseTextStyle => TextStyle(
        fontFamily: _primaryFontFamily,
      );

  TextStyle get _displayTextStyle => TextStyle(
        fontFamily: _displayFontFamily,
      );

  TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
        displayLarge: _displayTextStyle.copyWith(
          fontSize: 34,
          letterSpacing: 1,
          color: colorScheme.onBackground,
          fontWeight: FontWeight.w400,
        ),
        displayMedium: _displayTextStyle.copyWith(
          fontSize: 28,
          letterSpacing: 0.36,
          color: colorScheme.onBackground,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: _displayTextStyle.copyWith(
          fontSize: 22,
          letterSpacing: 0.35,
          color: colorScheme.onBackground,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: _baseTextStyle.copyWith(
          fontSize: 20,
          height: 1.29,
          letterSpacing: -0.41,
          color: colorScheme.onBackground,
        ),
        bodyMedium: _baseTextStyle.copyWith(
          fontSize: 17,
          height: 1.29,
          letterSpacing: -0.41,
          color: colorScheme.onBackground,
        ),
        bodySmall: _baseTextStyle.copyWith(
          fontSize: 15,
          color: colorScheme.onBackground,
        ),
        labelLarge: _baseTextStyle.copyWith(
          fontSize: 13,
          letterSpacing: 0.06,
          color: colorScheme.onBackground,
          fontWeight: FontWeight.w400,
        ),
        labelMedium: _baseTextStyle.copyWith(
          fontSize: 12,
          letterSpacing: 0.06,
          color: colorScheme.onBackground,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: _baseTextStyle.copyWith(
          fontSize: 11,
          letterSpacing: 0.06,
          color: colorScheme.onBackground,
          fontWeight: FontWeight.w400,
        ),
      );

  CardTheme _cardTheme(ColorScheme colorScheme) => CardTheme(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        color: colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: colorScheme.outline,
          ),
        ),
      );
  DividerThemeData _dividerTheme(ColorScheme colorScheme) => DividerThemeData(
        space: 1,
        color: colorScheme.outline,
      );

  TabBarTheme _tabBarTheme(ColorScheme colorScheme) {
    final textTheme = _textTheme(colorScheme);

    return TabBarTheme(
      labelStyle: textTheme.labelLarge!.semibold,
      labelColor: textTheme.labelLarge!.color,
      unselectedLabelStyle: textTheme.labelLarge!.semibold,
      unselectedLabelColor: textTheme.labelLarge!.color?.withOpacity(0.42),
      splashFactory: NoSplash.splashFactory,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: textTheme.bodyMedium!.color!.withOpacity(0.72),
            width: 0.85,
          ),
        ),
      ),
    );
  }

  @override
  AppStyle get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.indigo.shade600,
      background: const Color(0xFFFFFFFF),
      // get application for that color.
      surface: const Color(0xFFFFFFFF),
      // primary background color
      primaryContainer: const Color(0xFFFFFFFF),
      // secondary background color
      secondaryContainer: const Color(0xFFF6F6F6),
      // tertiary background color
      tertiaryContainer: const Color(0xFFEDEDED),
      surfaceVariant: const Color(0xFFF6F6F6),
      // borders and dividers
      outline: const Color(0xFFD7D7D7),
    );

    return copyWith(
      colorScheme: colorScheme,
      textTheme: _textTheme(colorScheme),
      cardTheme: _cardTheme(colorScheme),
      tabBarTheme: _tabBarTheme(colorScheme),
      dividerTheme: _dividerTheme(colorScheme),
    );
  }

  ChipThemeData _chipThemeData(ColorScheme colorScheme) => ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4),
      );

  @override
  AppStyle get dark {
    final colorScheme = ColorScheme.dark();

    return copyWith(
      colorScheme: colorScheme,
      textTheme: _textTheme(colorScheme),
      // cardTheme: _cardTheme,
      chipTheme: _chipThemeData(colorScheme),
      // dividerTheme: _dividerTheme,
    );
  }

  @override
  AppStyle get dim {
    return dark.copyWith();
  }
}
