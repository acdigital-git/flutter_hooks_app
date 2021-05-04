import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';

class AnimatedIconsView extends HookWidget {
  const AnimatedIconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(title: Text('Animated Icons')),
      child: Center(
        child: Text('Animated Icons'),
      ),
    );
  }
}
