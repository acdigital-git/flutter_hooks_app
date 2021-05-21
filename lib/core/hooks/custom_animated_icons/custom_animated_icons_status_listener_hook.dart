import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/providers/custom_animated_icons/custom_animated_icons_providers.dart';
import 'package:flutter_hooks_app/data/models/custom_animated_icon_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

bool useCustomAnimatedIconsStatusListener({
  required CustomAnimatedIconController controller,
  required VoidCallback forward,
  required VoidCallback reverse,
  required AnimationStatus widgetControllerStatus,
}) {
  final context = useContext();

  useMemoized(() {
    context
        .read(animatedIconsControllersStateNotifier.notifier)
        .addController(controller);
    controller.animateToEnd = () => forward();
    controller.animateToStart = () => reverse();
    controller.isForward = () => true;
  });
  return useValueChanged(widgetControllerStatus, (_, __) {
        final isForward =
            (widgetControllerStatus == AnimationStatus.dismissed ||
                widgetControllerStatus == AnimationStatus.reverse);
        controller.animateToEnd = () {
          if (isForward) forward();
        };
        controller.animateToStart = () {
          if (!isForward) reverse();
        };
        controller.isForward = () => isForward;
        return isForward;
      }) ??
      true;
}
