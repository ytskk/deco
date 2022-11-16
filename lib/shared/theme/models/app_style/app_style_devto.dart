import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';

class AppStyleDevTo extends AppStyle {
  const AppStyleDevTo() : super(appStyleType: AppStyleType.devto);

  ButtonStyle get _elevatedButtonStyle => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );

  CardTheme get _cardTheme => CardTheme(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );

  DividerThemeData get _dividerTheme => const DividerThemeData(space: 1);

  TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
        displayLarge: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 34,
          height: 1.2,
          letterSpacing: 0.37,
        ),
        displayMedium: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 28,
          height: 1.25,
        ),
        displaySmall: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 22,
          height: 1.25,
          letterSpacing: 0.35,
        ),
        bodyLarge: TextStyle(
          fontSize: 17,
          height: 1.29,
          letterSpacing: -0.41,
          color: colorScheme.onBackground,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          color: colorScheme.onBackground,
        ),
        bodySmall: TextStyle(
          fontSize: 13,
          color: colorScheme.onBackground,
        ),
        labelLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: colorScheme.onBackground,
        ),
        labelMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: colorScheme.onBackground,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: colorScheme.onBackground,
        ),
      );

  ChipThemeData _chipThemeData(ColorScheme colorScheme) => ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4),
      );

  TabBarTheme _tabBarTheme(ColorScheme colorScheme) {
    final textTheme = _textTheme(colorScheme);

    return TabBarTheme(
      labelStyle: textTheme.labelMedium!.semibold,
      labelColor: textTheme.labelMedium!.color,
      unselectedLabelStyle: textTheme.labelMedium!.semibold,
      unselectedLabelColor: textTheme.labelMedium!.color?.withOpacity(0.42),
      splashFactory: NoSplash.splashFactory,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: textTheme.bodySmall!.color!.withOpacity(0.72),
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
      background: const Color(0xFFF9F9FA),
      surface: Colors.white,
    );

    return copyWith(
      colorScheme: colorScheme,
      elevatedButtonStyle: _elevatedButtonStyle.copyWith(
        backgroundColor: materialResolveWithColor(colorScheme.primary),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
      ),
      cardTheme: _cardTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      dividerTheme: _dividerTheme,
      textTheme: _textTheme(colorScheme),
      chipTheme: _chipThemeData(colorScheme),
      tabBarTheme: _tabBarTheme(colorScheme),
    );
  }

  @override
  AppStyle get dark {
    final colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.indigo.shade400,
      surface: const Color(0xFF26272B),
      background: const Color(0xFF1D1E22),
    );

    return copyWith(
      colorScheme: colorScheme,
      elevatedButtonStyle: _elevatedButtonStyle.copyWith(
        backgroundColor: materialResolveWithColor(colorScheme.primary),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
      ),
      cardTheme: _cardTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Colors.grey.shade800,
          ),
        ),
      ),
      dividerTheme: _dividerTheme,
      textTheme: _textTheme(colorScheme),
      chipTheme: _chipThemeData(colorScheme),
      tabBarTheme: _tabBarTheme(colorScheme),
    );
  }

  @override
  AppStyle get dim {
    final colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.indigo.shade400,
      surface: const Color(0xFF1C1C1E),
      background: Colors.black,
    );

    return copyWith(
      colorScheme: colorScheme,
      elevatedButtonStyle: _elevatedButtonStyle.copyWith(
        backgroundColor: materialResolveWithColor(colorScheme.primary),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
      ),
      cardTheme: _cardTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Colors.grey.shade800,
          ),
        ),
      ),
      dividerTheme: _dividerTheme,
      textTheme: _textTheme(colorScheme),
      chipTheme: _chipThemeData(colorScheme),
      tabBarTheme: _tabBarTheme(colorScheme),
    );
  }
}
