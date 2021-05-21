import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/constants/app_globals.dart';
import 'package:flutter_hooks_app/core/hooks/custom_animated_icons/custom_animated_icons_status_listener_hook.dart';
import 'package:flutter_hooks_app/data/models/custom_animated_icon_controller.dart';

const _duration = AppGlobals.iconAnimationDuration;

class CustomAnimatedIconWidget extends HookWidget {
  const CustomAnimatedIconWidget({
    Key? key,
    required this.onPressedReverse,
    required this.onPressedForward,
    required this.startIcon,
    required this.endIcon,
    required this.controller,
    this.clockwise,
    this.size,
  }) : super(key: key);

  final VoidCallback onPressedForward, onPressedReverse;
  final CustomAnimatedIconController controller;
  final double? size;
  final IconData startIcon, endIcon;
  final bool? clockwise;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(duration: _duration);
    useListenable(animationController);
    final animationValue = animationController.value;
    double x = animationValue;
    double y = 1.0 - animationValue;
    double angleX = math.pi / 180 * (180 * x);
    double angleY = math.pi / 180 * (180 * y);

    void _forward() {
      onPressedForward();
      animationController.forward();
    }

    void _reverse() {
      onPressedReverse();
      animationController.reverse();
    }

    final isForward = useCustomAnimatedIconsStatusListener(
      controller: controller,
      forward: _forward,
      reverse: _reverse,
      widgetControllerStatus: animationController.status,
    );

    Widget buildStartIcon() {
      return Transform.rotate(
        angle: clockwise ?? false ? angleX : -angleX,
        child: Opacity(
          opacity: y,
          child: Icon(
            startIcon,
            size: size,
          ),
        ),
      );
    }

    Widget buildEndIcon() {
      return Transform.rotate(
        angle: clockwise ?? false ? -angleY : angleY,
        child: Opacity(
          opacity: x,
          child: Icon(
            endIcon,
            size: size,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => isForward ? _forward() : _reverse(),
      child: Center(
        child: Stack(
          children: [
            x == 1 && y == 0 ? buildEndIcon() : buildStartIcon(),
            x == 0 && y == 1 ? buildStartIcon() : buildEndIcon(),
          ],
        ),
      ),
    );
  }
}
