import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/providers/custom_animated_icons/custom_animated_icons_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks_app/src/shared/animated_icon_widget.dart';

class AppBarCustomIconsToggleWidget extends HookWidget {
  const AppBarCustomIconsToggleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDismissed = useState(true);

    void _toggleAll() {
      isDismissed.value
          ? context
              .read(animatedIconsControllersStateNotifier.notifier)
              .runAllForward()
          : context
              .read(animatedIconsControllersStateNotifier.notifier)
              .runAllReverse();
      isDismissed.value = !isDismissed.value;
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedIconWidget(
          iconData: AnimatedIcons.play_pause,
          onPressedForward: () {
            print('toggle all forward');
            _toggleAll();
          },
          onPressedReverse: () {
            print('toggle all reverse');
            _toggleAll();
          },
        ),
      ),
    );
  }
}
