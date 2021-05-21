import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/data/models/view.dart';
import 'package:flutter_hooks_app/core/constants/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final viewsProvider = Provider<List<View>>(
  (ref) => const [
    View(
      path: AppRoutes.counter,
      label: 'Counter Animation (duplicate)',
      icon: Icons.calculate_rounded,
    ),
    View(
      path: AppRoutes.fab,
      label: 'FAB (fade) w/ ScrollController',
      icon: Icons.animation,
    ),
    View(
      path: AppRoutes.logo,
      label: 'Rotating logo w/ AutoBounce',
      icon: Icons.autorenew_rounded,
    ),
    View(
      path: AppRoutes.animatedIcons,
      label: 'Animated icons (flutter)',
      icon: Icons.auto_awesome_motion,
    ),
    View(
      path: AppRoutes.customAnimatedIcons,
      label: 'Custom animated icons',
      icon: Icons.dashboard_customize_rounded,
    ),
  ],
);
