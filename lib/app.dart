import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemePreferences = ref.watch(appThemePreferencesProvider);

    final themeData =
        AppThemeData(appStyleType: appThemePreferences.appStyleType);
    final themeLight = themeData.light();
    final themeDark = themeData.dark(appThemePreferences.useDimColors);

    return MaterialApp.router(
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: appThemePreferences.themeMode,
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
