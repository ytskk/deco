import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';

// TODO: extends, standartize styles.

class AppStyle {
  const AppStyle({
    required this.appStyleType,
    this.colorScheme,
    this.elevatedButtonStyle,
    this.cardTheme,
    this.dividerTheme,
    this.textTheme,
    this.chipTheme,
    this.tabBarTheme,
  });

  factory AppStyle.fromType(AppStyleType appStyleType) {
    switch (appStyleType) {
      case AppStyleType.devto:
        return const AppStyleDevTo();
      default:
        return const AppStyle(appStyleType: AppStyleType.standard);
    }
  }

  final AppStyleType appStyleType;
  final ColorScheme? colorScheme;
  final ButtonStyle? elevatedButtonStyle;
  final CardTheme? cardTheme;
  final DividerThemeData? dividerTheme;
  final TextTheme? textTheme;
  final ChipThemeData? chipTheme;
  final TabBarTheme? tabBarTheme;

  // copy with
  AppStyle copyWith({
    AppStyleType? appStyleType,
    ColorScheme? colorScheme,
    ButtonStyle? elevatedButtonStyle,
    CardTheme? cardTheme,
    DividerThemeData? dividerTheme,
    TextTheme? textTheme,
    ChipThemeData? chipTheme,
    TabBarTheme? tabBarTheme,
  }) {
    return AppStyle(
      appStyleType: appStyleType ?? this.appStyleType,
      colorScheme: colorScheme ?? this.colorScheme,
      elevatedButtonStyle: elevatedButtonStyle ?? this.elevatedButtonStyle,
      cardTheme: cardTheme ?? this.cardTheme,
      dividerTheme: dividerTheme ?? this.dividerTheme,
      textTheme: textTheme ?? this.textTheme,
      chipTheme: chipTheme ?? this.chipTheme,
      tabBarTheme: tabBarTheme ?? this.tabBarTheme,
    );
  }

  TextTheme _textTheme(ColorScheme colorScheme) => TextTheme(
        labelMedium: TextStyle(
          color: colorScheme.onBackground,
        ),
      );

  CardTheme _cardTheme(ColorScheme colorScheme) => CardTheme(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: colorScheme.outline.withOpacity(0.12),
          ),
        ),
      );

  TabBarTheme _tabBarTheme(
    ColorScheme colorScheme,
  ) {
    final textTheme = _textTheme(colorScheme);

    return TabBarTheme(
      labelStyle: textTheme.labelMedium?.semibold,
      labelColor: textTheme.labelMedium?.color,
      unselectedLabelStyle: textTheme.labelMedium?.semibold,
      unselectedLabelColor: textTheme.labelMedium?.color?.withOpacity(0.42),
    );
  }

  AppStyle get light {
    const colorScheme = ColorScheme.light(
        // primary: _primaryColorLight,
        );

    return copyWith(
      colorScheme: colorScheme,
      cardTheme: _cardTheme(colorScheme),
      tabBarTheme: _tabBarTheme(colorScheme),
    );
  }

  AppStyle get dark {
    const colorScheme = ColorScheme.dark(
        // primary: _primaryColorDark,
        );

    return copyWith(
      colorScheme: colorScheme,
      cardTheme: _cardTheme(colorScheme),
      tabBarTheme: _tabBarTheme(colorScheme),
    );
  }

  AppStyle get dim {
    const colorScheme = ColorScheme.dark(
      // primary: _primaryColorDark,
      background: Colors.black,
    );

    return copyWith(
      colorScheme: colorScheme,
      cardTheme: _cardTheme(colorScheme),
      tabBarTheme: _tabBarTheme(colorScheme),
    );
  }
}

/// Resolves a MaterialStateProperty from a [color].
///
/// Styles disabled state with [color.withOpacity(0.5)] and else with [color].
MaterialStateProperty<Color?> materialResolveWithColor(Color color) {
  return MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.disabled)) {
      return color.withOpacity(0.35);
    }
    return color;
  });
}
