import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/providers/animated_icons/animated_icons_providers.dart';
import 'package:flutter_hooks_app/core/constants/app_globals.dart';
import 'package:flutter_hooks_app/src/shared/animated_icon_widget.dart';
import 'package:flutter_hooks_app/src/views/animated_icons/widgets/appbar_icons_toggle_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _duration = AppGlobals.animationDuration;

class AnimatedIconsView extends HookWidget {
  const AnimatedIconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = useProvider(animatedIconsProvider);
    final animationController = useAnimationController(duration: _duration);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animated Icons'),
          actions: [
            AppBarIconsToggleWidget(
              controller: animationController,
            ),
          ],
        ),
        body: GridView(
          children: [
            for (var i = 0; i < icons.length; i++) ...[
              AnimatedIconWidget(
                iconData: icons[i],
                size: 76,
                controller: animationController,
                onPressedForward: () => null,
                onPressedReverse: () => null,
              )
            ]
          ],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
          ),
        ),
      ),
    );
  }
}
