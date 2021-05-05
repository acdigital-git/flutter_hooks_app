import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/core/models/todo.dart';
import 'package:flutter_hooks_app/src/views/animation/hook_animations/animated_counter_hook_view.dart';
import 'package:flutter_hooks_app/src/views/animation/hook_animations/animated_fab_hook_view.dart';
import 'package:flutter_hooks_app/src/views/animation/hook_animations/animated_icons_view.dart';
import 'package:flutter_hooks_app/src/views/animation/hook_animations/rotating_logo_hook_view.dart';
import 'package:flutter_hooks_app/src/views/animation/hook_animations_view.dart';
import 'package:flutter_hooks_app/src/views/animation/simple_animation_view.dart';
import 'package:flutter_hooks_app/src/views/auth_wrapper.dart';
import 'package:flutter_hooks_app/src/views/todo/todo_edit_view.dart';

class AppRoutes {
  static const root = '/';

  /// TODOS (HOMEPAGE) ///
  static const editTodo = '/edit_todo';
  ////// ANIMATIONS //////
  static const simpleAnimation = '/simple_animation';
  static const hookAnimations = '/hook_animations';
  static const counterHookAnimation = '/counter_hook_animation';
  static const fabHookAnimation = '/fab_hook_animation';
  static const rotatingLogoHookAnimation = '/rotating_logo_hook_animation';
  static const animatedIcons = '/animated_icons';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // home
      case root:
        return MaterialPageRoute(builder: (_) => AuthWrapper());
      // todo
      case editTodo:
        return args is Todo
            ? MaterialPageRoute(builder: (_) => TodoFormView(item: args))
            : MaterialPageRoute(builder: (_) => TodoFormView());
      // simple animations
      case simpleAnimation:
        return MaterialPageRoute(builder: (_) => SimpleAnimationView());
      // hook animations
      case hookAnimations:
        return MaterialPageRoute(builder: (_) => HookAnimationsView());
      case counterHookAnimation:
        return MaterialPageRoute(builder: (_) => AnimatedCounterHookView());
      case fabHookAnimation:
        return MaterialPageRoute(builder: (_) => AnimatedFabHookView());
      case rotatingLogoHookAnimation:
        return MaterialPageRoute(builder: (_) => RotatingLogoHookView());
      case animatedIcons:
        return MaterialPageRoute(builder: (_) => AnimatedIconsView());
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
