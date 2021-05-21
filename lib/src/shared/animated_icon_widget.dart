import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/constants/app_globals.dart';

const _duration = AppGlobals.animationDuration;

class AnimatedIconWidget extends HookWidget {
  const AnimatedIconWidget({
    Key? key,
    required this.iconData,
    required this.onPressedReverse,
    required this.onPressedForward,
    this.controller,
    this.size,
  }) : super(key: key);

  final AnimatedIconData iconData;
  final VoidCallback onPressedForward, onPressedReverse;
  final AnimationController? controller;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(duration: _duration);
    final isDismissed = useState(true);

    // Runs the animation
    void _toggleState() {
      isDismissed.value
          ? animationController.forward()
          : animationController.reverse();
      isDismissed.value = !isDismissed.value;
    }

    // Executed once (On first build of the HookWidget)
    useMemoized(() {
      if (controller != null)
        controller!
          ..addStatusListener((status) {
            if (status == AnimationStatus.forward) {
              if (isDismissed.value) {
                onPressedForward();
                _toggleState();
              }
            } else if (status == AnimationStatus.reverse) {
              if (!isDismissed.value) {
                onPressedReverse();
                _toggleState();
              }
            }
          });
    });

    return GestureDetector(
      onTap: () {
        isDismissed.value ? onPressedForward() : onPressedReverse();
        _toggleState();
      },
      child: Center(
        child: AnimatedIcon(
          icon: iconData,
          size: size ?? 24,
          progress: animationController,
        ),
      ),
    );
  }
}
