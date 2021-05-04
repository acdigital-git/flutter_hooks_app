import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/src/constants/app_globals.dart';
import 'package:flutter_hooks_app/src/constants/app_routes.dart';
import 'package:flutter_hooks_app/src/constants/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // firebase is initialized before app starts
  await Firebase.initializeApp();
  // ProviderScope feeds the app with all providers
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppGlobals.name,
      theme: AppTheme.theme,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.root,
    );
  }
}
