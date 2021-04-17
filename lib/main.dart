import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/src/views/home_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hooks App',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          appBarTheme: AppBarTheme(
            centerTitle: true,
          )),
      home: HomeView(title: 'Flutter Hooks App'),
    );
  }
}
