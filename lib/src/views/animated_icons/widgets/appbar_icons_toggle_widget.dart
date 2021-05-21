import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/src/shared/animated_icon_widget.dart';

class AppBarIconsToggleWidget extends HookWidget {
  const AppBarIconsToggleWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    final isDismissed = useState(true);

    void _toggleAll() {
      isDismissed.value ? controller.forward() : controller.reverse();
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
