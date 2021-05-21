import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/core/constants/app_routes.dart';
import 'package:flutter_hooks_app/src/views/animated_icons/animated_icons_view.dart';
import 'package:flutter_hooks_app/src/views/custom_animated_icons/custom_animated_icons_view.dart';
import 'package:flutter_hooks_app/src/views/counter/counter_view.dart';
import 'package:flutter_hooks_app/src/views/error404/error_404_view.dart';
import 'package:flutter_hooks_app/src/views/fab/fab_view.dart';
import 'package:flutter_hooks_app/src/views/homepage/homepage_view.dart';
import 'package:flutter_hooks_app/src/views/rotating_logo/rotating_logo_view.dart';

class RoutesGenerator {
  const RoutesGenerator();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Initial route
      case AppRoutes.homepage:
        return MaterialPageRoute(builder: (_) => HomePageView());
      case AppRoutes.counter:
        return MaterialPageRoute(builder: (_) => CounterView());
      case AppRoutes.fab:
        return MaterialPageRoute(builder: (_) => FabView());
      case AppRoutes.logo:
        return MaterialPageRoute(builder: (_) => RotatingLogoView());
      case AppRoutes.animatedIcons:
        return MaterialPageRoute(builder: (_) => AnimatedIconsView());
      case AppRoutes.customAnimatedIcons:
        return MaterialPageRoute(builder: (_) => CustomAnimatedIconsView());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() =>
      MaterialPageRoute(builder: (context) => Error404View());
}
