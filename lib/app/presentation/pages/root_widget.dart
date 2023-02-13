import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../../utils/themes/theme_types.dart';
import '../navigation/main_navigation.dart';
import '../providers/theme_type_provider.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({
    super.key
  });

  static final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Time Tracking App',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      darkTheme: ThemeTypes.dark,
      theme: ThemeTypes.light,
      themeMode: context.watch<ThemeProvider>().themeMode,
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.loaderWidget,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}