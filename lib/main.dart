import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/src/routes/route_generator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _buttonStyle =
    ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        scaffoldBackgroundColor: Colors.grey.shade300,
        appBarTheme: const AppBarTheme(centerTitle: true),
        iconTheme: const IconThemeData(color: Colors.indigo),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardColor: Colors.white,
        cardTheme: const CardTheme(
            elevation: 3,
            shadowColor: Colors.indigoAccent,
            margin: const EdgeInsets.all(0.0),
            clipBehavior: Clip.antiAlias),
        buttonTheme: const ButtonThemeData(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
        elevatedButtonTheme: ElevatedButtonThemeData(style: _buttonStyle),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            isDense: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(6.0))),
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/',
    );
  }
}
