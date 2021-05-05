import 'package:flutter_hooks_app/core/models/menu_item.dart';
import 'package:flutter_hooks_app/src/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final menuDrawerProvider = Provider.autoDispose<List<MenuItem>>(
  (ref) => const [
    const MenuItem(
      title: 'Todo App',
      icon: Icons.home_rounded,
      route: AppRoutes.root,
    ),
    const MenuItem(
      title: 'Simple Animations',
      icon: Icons.animation,
      route: AppRoutes.simpleAnimation,
    ),
    const MenuItem(
      title: 'Hook Animations',
      icon: Icons.auto_awesome_motion,
      route: AppRoutes.hookAnimations,
    ),
  ],
);

final menuHookAnimationsProvider = Provider.autoDispose<List<MenuItem>>(
  (ref) => const [
    const MenuItem(
      title: 'AnimatedCounter w/ Custom Hooks',
      icon: Icons.calculate_rounded,
      route: AppRoutes.counterHookAnimation,
    ),
    const MenuItem(
      title: 'AnimatedFab w/ Custom Hooks',
      icon: Icons.smart_button_rounded,
      route: AppRoutes.fabHookAnimation,
    ),
    const MenuItem(
      title: 'RotatingLogo w/ Custom Hooks',
      icon: Icons.rotate_right_rounded,
      route: AppRoutes.rotatingLogoHookAnimation,
    ),
    const MenuItem(
      title: 'AnimatedIcons w/ Basic Hooks',
      icon: Icons.play_arrow_rounded,
      route: AppRoutes.animatedIcons,
    )
  ],
);
