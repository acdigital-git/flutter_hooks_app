import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/providers/animated_icons_providers.dart';
import 'package:flutter_hooks_app/src/constants/app_routes.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimatedIconsView extends HookWidget {
  const AnimatedIconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _icons = useProvider(animatedIcons);
    return BaseWidget(
        appBar: AppBar(title: Text('Animated Icons'), actions: [
          IconButton(
              icon: const Icon(Icons.home_rounded),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.root))
        ]),
        child: GridView(
            children: _icons,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.4)));
  }
}