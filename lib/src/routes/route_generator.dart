import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/src/routes/routes.dart';
import 'package:flutter_hooks_app/src/views/home_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // home
      case Routes.root:
        return MaterialPageRoute(
            builder: (_) => HomeView(title: 'Flutter Hooks App'));
      default:
        return _errorRoute();
    }
  }

  // error route
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return SafeArea(
        child: Scaffold(
          body: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Page introuvable'),
              const SizedBox(),
              ElevatedButton.icon(
                  onPressed: () => Navigator.of(_)
                      .pushNamedAndRemoveUntil('/', (route) => false),
                  icon: Icon(Icons.home_rounded),
                  label: Text('HomeView'))
            ],
          )),
        ),
      );
    });
  }
}
