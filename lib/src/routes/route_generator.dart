import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/models/todo.dart';
import 'package:flutter_hooks_app/src/routes/routes.dart';
import 'package:flutter_hooks_app/src/views/auth_wrapper.dart';
import 'package:flutter_hooks_app/src/views/todo/todo_edit_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // home
      case Routes.root:
        return MaterialPageRoute(builder: (_) => AuthWrapper());
      // Todo
      case Routes.editTodo:
        return args is Todo
            ? MaterialPageRoute(builder: (_) => TodoFormView(item: args))
            : MaterialPageRoute(builder: (_) => TodoFormView());
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
