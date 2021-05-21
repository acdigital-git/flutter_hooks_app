import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/core/helpers/routes_generator.dart';
import 'package:flutter_hooks_app/core/constants/app_globals.dart';
import 'package:flutter_hooks_app/core/constants/app_routes.dart';
import 'package:flutter_hooks_app/src/styles/themes/light_theme.dart';

class AppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppGlobals.appName,
      theme: LightTheme.theme,
      onGenerateRoute: RoutesGenerator.generateRoute,
      initialRoute: AppRoutes.homepage, // HomepageView
    );
  }
}
