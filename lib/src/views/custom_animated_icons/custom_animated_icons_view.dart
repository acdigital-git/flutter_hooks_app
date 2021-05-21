import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/providers/custom_animated_icons/custom_animated_icons_providers.dart';
import 'package:flutter_hooks_app/data/models/custom_animated_icon_controller.dart';
import 'package:flutter_hooks_app/src/shared/custom_animated_icon_widget.dart';
import 'package:flutter_hooks_app/src/views/custom_animated_icons/widgets/appbar_custom_icons_toggle_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomAnimatedIconsView extends HookWidget {
  const CustomAnimatedIconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = useProvider(customIconsProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animated Icons'),
          actions: [
            AppBarCustomIconsToggleWidget(),
          ],
        ),
        body: GridView(
          children: [
            ...icons.map((item) {
              final controller = CustomAnimatedIconController();
              return CustomAnimatedIconWidget(
                startIcon: item.start,
                endIcon: item.end,
                clockwise: true,
                size: 72,
                controller: controller,
                onPressedForward: () => null,
                onPressedReverse: () => null,
              );
            })
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
