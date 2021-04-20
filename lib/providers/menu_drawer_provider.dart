import 'package:flutter_hooks_app/src/routes/routes.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final menuDrawerProvider = Provider.autoDispose<List<MenuItem>>((ref) => const [
      const MenuItem(
        title: 'Todo App',
        icon: Icons.home_rounded,
        route: Routes.root,
      ),
      const MenuItem(
        title: 'Simple Animation',
        icon: Icons.animation,
        route: Routes.simpleAnimation,
      ),
      const MenuItem(
        title: 'AnimatedCounter w/ Hook',
        icon: Icons.calculate_rounded,
        route: Routes.counterHookAnimation,
      ),
      const MenuItem(
        title: 'AnimatedFab w/ Hook',
        icon: Icons.smart_button_rounded,
        route: Routes.fabHookAnimation,
      )
    ]);