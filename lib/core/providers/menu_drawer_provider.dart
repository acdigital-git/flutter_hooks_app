import 'package:flutter_hooks_app/core/models/menu_item.dart';
import 'package:flutter_hooks_app/src/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final menuDrawerProvider = Provider.autoDispose<List<MenuItem>>((ref) => const [
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
        title: 'AnimatedCounter w/ Hook',
        icon: Icons.calculate_rounded,
        route: AppRoutes.counterHookAnimation,
      ),
      const MenuItem(
        title: 'AnimatedFab w/ Hook',
        icon: Icons.smart_button_rounded,
        route: AppRoutes.fabHookAnimation,
      ),
      const MenuItem(
        title: 'RotatingLogo w/ Hook',
        icon: Icons.rotate_right_rounded,
        route: AppRoutes.rotatingLogoHookAnimation,
      ),
      const MenuItem(
        title: 'AnimatedIcons w/ Hook',
        icon: Icons.play_arrow_rounded,
        route: AppRoutes.animatedIcons,
      )
    ]);
